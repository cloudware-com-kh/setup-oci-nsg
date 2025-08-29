.PHONY: help init plan apply destroy validate format clean

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

init: ## Initialize Terraform
	terraform init

validate: ## Validate Terraform configuration
	terraform validate

format: ## Format Terraform files
	terraform fmt

plan: ## Create Terraform execution plan
	terraform plan

apply: ## Apply Terraform changes
	terraform apply

destroy: ## Destroy Terraform-managed infrastructure
	terraform destroy

clean: ## Clean Terraform files
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f terraform.tfstate*

show: ## Show current state
	terraform show

output: ## Show outputs
	terraform output

check-nsg: ## Check if NSG ID is set correctly
	@echo "Checking NSG ID configuration..."
	@grep "nsg_id" terraform.tfvars | grep -v "REPLACE_WITH_YOUR_NSG_ID" || (echo "ERROR: Please set your actual NSG ID in terraform.tfvars" && exit 1)
	@echo "NSG ID is configured ✓"
