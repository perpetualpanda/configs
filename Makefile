.PHONY: init format dryrun deploy destroy

init:
	terraform -chdir=./terraform init

format:
	terraform fmt --recursive ./terraform

plan:
	terraform -chdir=./terraform plan

apply:
	terraform -chdir=./terraform apply

destroy:
	terraform -chdir=./terraform destroy
