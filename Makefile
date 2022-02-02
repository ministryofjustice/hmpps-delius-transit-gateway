default: build-infra
.PHONY: build-infra

terraform_plan:
	./run.sh $(ENVIRONMENT_NAME) plan $(component) || (exit $$?)

terraform_apply: terraform_plan
	./run.sh $(ENVIRONMENT_NAME) apply $(component) || (exit $$?)

terraform_approved_apply:
	./run.sh $(ENVIRONMENT_NAME) apply $(component) || (exit $$?)
