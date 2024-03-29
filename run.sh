#!/bin/bash

set -e

#----------------------------------------------------------
#Usage
# Scripts takes 2 arguments: environment_name and action
# environment_name: target environment example dev prod
# ACTION_TYPE: task to complete example plan apply test clean
# AWS_TOKEN: token to use when running locally eg hmpps-token
#----------------------------------------------------------

#----------------------------------------------------------
# Error handler function
#----------------------------------------------------------
exit_on_error() {
  exit_code=$1
  last_command=${@:2}
  if [ $exit_code -ne 0 ]; then
      >&2 echo "\"${last_command}\" command failed with exit code ${exit_code}."
      exit ${exit_code}
  fi
}

ENVIRONMENT_NAME_ARG=$1
ACTION_TYPE=$2
COMPONENT=${3}

if [ -z "${HMPPS_BUILD_WORK_DIR}" ]
then
    echo "--> Using default workdir"
    env_config_dir="${HOME}/data/env_configs"
else
    echo "USING CUSTOM WORKDIR for configs: $HMPPS_BUILD_WORK_DIR"
    env_config_dir="${HMPPS_BUILD_WORK_DIR}/env_configs"

    if [ $ACTION_TYPE != "apply" ]
    then
        mkdir ${env_config_dir}
        cp -r $CODEBUILD_SRC_DIR_config/* ${HMPPS_BUILD_WORK_DIR}/env_configs
    fi
fi

if [ -z "${ENVIRONMENT_NAME_ARG}" ]
then
    echo "environment_name argument not supplied, please provide an argument!"
    exit 1
fi

echo "Output -> environment_name set to: ${ENVIRONMENT_NAME_ARG}"

if [ -z "${ACTION_TYPE}" ]
then
    echo "ACTION_TYPE argument not supplied."
    echo "--> Defaulting to plan ACTION_TYPE"
    ACTION_TYPE="plan"
fi

echo "Output -> ACTION_TYPE set to: ${ACTION_TYPE}"

if [ -z "${COMPONENT}" ]
then
    echo "COMPONENT argument not supplied, please provide an argument!"
    exit 1
fi

#check env vars for RUNNING_IN_CONTAINER switch
if [[ ${RUNNING_IN_CONTAINER} == True ]]
then
    workDirContainer=${3}
    echo "Output -> environment stage"

    source ${env_config_dir}/${ENVIRONMENT_NAME_ARG}/${ENVIRONMENT_NAME_ARG}.properties
    exit_on_error $? !!
    echo "Output ---> set environment stage complete"
    # set runCmd
    ACTION_TYPE="docker-${ACTION_TYPE}"
    export workDir=${workDirContainer}
    cd ${workDir}
    mkdir -p "${HOME}/data/${workDirContainer}"
    export PLAN_RET_FILE=${HOME}/data/${workDirContainer}_plan_ret
    echo "Output -> Container workDir: ${workDir}"
fi

case ${ACTION_TYPE} in
  docker-plan)
    echo "Running docker plan action"
    rm -rf .terraform *.plan
    terragrunt init
    terragrunt plan -detailed-exitcode --out ${ENVIRONMENT_NAME_ARG}.plan || tf_exitcode="$?" ;
    if [ "$tf_exitcode" == '1' ]; then
        exit 1
    elif [ "$tf_exitcode" == '2' ]; then
        echo "TERRAFORM PLAN HAS FOUND SOME CHANGES"
        exit 0
    else
        echo "TERRAFORM PLAN DOES NOT HAVE ANY CHANGES"
        exit 0
    fi
    ;;
  docker-apply)
    echo "Running docker apply action"
    terragrunt apply ${ENVIRONMENT_NAME_ARG}.plan || exit $?
    ;;
  docker-destroy)
    echo "Running docker destroy action"
    rm -rf .terraform *.plan
    terragrunt init
    terragrunt destroy -force
    exit_on_error $? !!
    ;;
  docker-output)
    echo "Running docker output action"
    terragrunt output
    exit_on_error $? !!
    ;;
  *)
    echo "${ACTION_TYPE} is not a valid argument. init - apply - test - output - destroy"
  ;;
esac

set -o pipefail
set -x
