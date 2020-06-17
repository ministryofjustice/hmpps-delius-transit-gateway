# hmpps-delius-transit-gateway
Transit Gateway implementation for delius environments connections to other non delius accounts

Full docs available in Confluence at https://dsdmoj.atlassian.net/wiki/spaces/DAM/pages/2043740219/delius+AWS+account+integration+with+3rd+parties 

#### Current 3rd Party to delius connectivity via transit gateway
- delius to cloudplatform
- delius to analytics platform

#### Implementation 

##### 1. Create the Transit Gateway Association for delius environments

Applies the terraform code in the `transit-gateway-common` folder.

```bash
# delius-core-dev
tfrun delius-core-dev plan transit-gateway-common hmpps_token
tfrun delius-core-dev apply transit-gateway-common hmpps_token

# delius-core-sandpit
tfrun delius-core-dev plan transit-gateway-common hmpps_token
tfrun delius-core-dev apply transit-gateway-common hmpps_token

# delius-stage
tfrun delius-core-dev plan transit-gateway-common hmpps_token
tfrun delius-core-dev apply transit-gateway-common hmpps_token

# delius-pre-prod
tfrun delius-pre-prod plan transit-gateway-common hmpps_token
tfrun delius-pre-prod apply transit-gateway-common hmpps_token

# delius-prod
tfrun delius-prod plan transit-gateway-common hmpps_token
tfrun delius-prod apply transit-gateway-common hmpps_token
```

##### 2a. AWS Route Table Entries from delius envs to Cloudplatform

Apply the configuration in the `transit-gateway-cloud-platform` folder to create route table entries in the delius environments to the target environments.

```bash
# delius-core-dev
tfrun delius-core-dev plan transit-gateway-cloud-platform hmpps_token
tfrun delius-core-dev apply transit-gateway-cloud-platform hmpps_token

# delius-core-sandpit
tfrun delius-core-dev plan transit-gateway-cloud-platform hmpps_token
tfrun delius-core-dev apply transit-gateway-cloud-platform hmpps_token

# delius-stage
tfrun delius-core-dev plan transit-gateway-cloud-platform hmpps_token
tfrun delius-core-dev apply transit-gateway-cloud-platform hmpps_token

# delius-pre-prod
tfrun delius-pre-prod plan transit-gateway-cloud-platform hmpps_token
tfrun delius-pre-prod apply transit-gateway-cloud-platform hmpps_token

# delius-prod
tfrun delius-prod plan transit-gateway-cloud-platform hmpps_token
tfrun delius-prod apply transit-gateway-cloud-platform hmpps_token
```

##### 2b. AWS Route Table Entries for each target platform

Apply the configuration in the `transit-gateway-analytics-platform` folder to create route table entries in the delius environments to the analytics environments.

```bash
# delius-core-dev
tfrun delius-core-dev plan transit-gateway-analytics-platform hmpps_token
tfrun delius-core-dev apply transit-gateway-analytics-platform hmpps_token

# delius-core-sandpit
tfrun delius-core-dev plan transit-gateway-analytics-platform hmpps_token
tfrun delius-core-dev apply transit-gateway-analytics-platform hmpps_token

# delius-stage
tfrun delius-core-dev plan transit-gateway-analytics-platform hmpps_token
tfrun delius-core-dev apply transit-gateway-analytics-platform hmpps_token

# delius-pre-prod
tfrun delius-pre-prod plan transit-gateway-analytics-platform hmpps_token
tfrun delius-pre-prod apply transit-gateway-analytics-platform hmpps_token

# delius-prod
tfrun delius-prod plan transit-gateway-analytics-platform hmpps_token
tfrun delius-prod apply transit-gateway-analytics-platform hmpps_token
```

##### 3a. Apply the configuration in the `transit-gateway-cloud-platform-test-rules`  folder to create security group ingress rules in the delius environments to allow the target environments to ping test servers.

```bash
# delius-core-dev
tfrun delius-core-dev plan transit-gateway-cloud-platform-test-rules hmpps_token
tfrun delius-core-dev apply transit-gateway-cloud-platform-test-rules hmpps_token

# delius-core-sandpit
tfrun delius-core-dev plan transit-gateway-cloud-platform-test-rules hmpps_token
tfrun delius-core-dev apply transit-gateway-cloud-platform-test-rules hmpps_token

# delius-stage
tfrun delius-core-dev plan transit-gateway-cloud-platform-test-rules hmpps_token
tfrun delius-core-dev apply transit-gateway-cloud-platform-test-rules hmpps_token

# delius-pre-prod
tfrun delius-pre-prod plan transit-gateway-cloud-platform-test-rules hmpps_token
tfrun delius-pre-prod apply transit-gateway-cloud-platform-test-rules hmpps_token

# delius-prod
tfrun delius-prod plan transit-gateway-cloud-platform-test-rules hmpps_token
tfrun delius-prod apply transit-gateway-cloud-platform-test-rules hmpps_token
```

##### 3b. Apply the configuration in the `transit-gateway-cloud-platform-test-rules`  folder to create security group ingress rules in the delius environments to allow the target environments to ping test servers.

```bash
# delius-core-dev
tfrun delius-core-dev plan transit-gateway-analytics-platform-test-rules hmpps_token
tfrun delius-core-dev apply transit-gateway-analytics-platform-test-rules hmpps_token

# delius-core-sandpit
tfrun delius-core-dev plan transit-gateway-analytics-platform-test-rules hmpps_token
tfrun delius-core-dev apply transit-gateway-analytics-platform-test-rules hmpps_token

# delius-stage
tfrun delius-core-dev plan transit-gateway-analytics-platform-test-rules hmpps_token
tfrun delius-core-dev apply transit-gateway-analytics-platform-test-rules hmpps_token

# delius-pre-prod
tfrun delius-pre-prod plan transit-gateway-analytics-platform-test-rules hmpps_token
tfrun delius-pre-prod apply transit-gateway-analytics-platform-test-rules hmpps_token

# delius-prod
tfrun delius-prod plan transit-gateway-analytics-platform-test-rules hmpps_token
tfrun delius-prod apply transit-gateway-analytics-platform-test-rules hmpps_token
```

##### 4a. Apply the configuration in the `transit-gateway-cloud-platform-test-rules`  folder to destroy security group ingress rules in the delius environments to allow the target environments to ping test servers.

Warning: Terragrunt destroy won't prompt for destroy
```bash
# delius-core-dev
tfrun delius-core-dev destroy transit-gateway-cloud-platform-test-rules hmpps_token

# delius-core-sandpit
tfrun delius-core-dev destroy transit-gateway-cloud-platform-test-rules hmpps_token

# delius-stage
tfrun delius-core-dev destroy transit-gateway-cloud-platform-test-rules hmpps_token

# delius-pre-prod
tfrun delius-pre-prod destroy transit-gateway-cloud-platform-test-rules hmpps_token

# delius-prod
tfrun delius-prod destroy transit-gateway-cloud-platform-test-rules hmpps_token
```

##### 4b. Apply the configuration in the `transit-gateway-cloud-platform-test-rules`  folder to destroy security group ingress rules in the delius environments to allow the target environments to ping test servers.

Warning: Terragrunt destroy won't prompt for destroy

```bash
# delius-core-dev
tfrun delius-core-dev destroy transit-gateway-analytics-platform-test-rules hmpps_token

# delius-core-sandpit
tfrun delius-core-dev destroy transit-gateway-analytics-platform-test-rules hmpps_token

# delius-stage
tfrun delius-core-dev destroy transit-gateway-analytics-platform-test-rules hmpps_token

# delius-pre-prod
tfrun delius-pre-prod destroy transit-gateway-analytics-platform-test-rules hmpps_token

# delius-prod
tfrun delius-prod destroy transit-gateway-analytics-platform-test-rules hmpps_token
```


### Applying using the Jenkins Jobs
Notes: 
- You must run the common apply before the cloudplatform/analytics apply due to state file outpur dependencies
- You must run the cloudplatform/analytics apply before the cloudplatform-test-rules/analytics-test-rules apply due to state file outpur dependencies


| Number | Stage         | Jenkins Job | Jenkinsfile                                                  |
|---|---------------|-------------|--------------------------------------------------------------|
| 1 | common        | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/1-Common-Apply/            | apply_transit_gateway_config_common.Jenkinsfile              |
| 2a | cloudplatform | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/2b-Cloudplatform-Apply/            | apply_transit_gateway_config_cloudplatform.Jenkinsfile       |
| 2b | analytics     | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/2b-AnalyticsPlatforms-Apply/            | apply_transit_gateway_config_analytics_platforms.Jenkinsfile |
| 3a | analytics-test-rules     | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/3a-AnalyticsPlatforms-Apply/            | apply_transit_gateway_config_analytics_platforms_test_security_rules.Jenkinsfile |
| 3b | cloudplatform-test-rules     | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/3b-AnalyticsPlatforms-Apply/            | apply_transit_gateway_config_cloud_platform_test_security_rules.Jenkinsfile |

### Deleting the security group rules once testing is completed

| Number | Stage         | Jenkins Job | Jenkinsfile                                                  |
|---|---------------|-------------|--------------------------------------------------------------|
| 4a | analytics-test-rules     | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/4a-CloudPlatform-destroy/            | destroy_transit_gateway_config_analytics_platforms_test_security_rules.Jenkinsfile |
| 4b | cloudplatform-test-rules     | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/4b-AnalyticsPlatforms-Apply/            | destroy_transit_gateway_config_cloud_platform_test_security_rules.Jenkinsfile |


### Github Actions

tag-master-branch-on-merge github action is added to this repo so every merge to master creates a tag.