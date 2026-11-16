common:
	git pull
	rm -f .terraform/terraform.tfstate

dev-apply: common
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars
dev-destroy: common
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars
prod-apply: common
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars
prod-destroy: common
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars