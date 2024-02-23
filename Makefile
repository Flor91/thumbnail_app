SHELL := /bin/bash

# Define default target
.DEFAULT_GOAL := help
.PHONY: help init fmt validate plan apply destroy clean

# Help target
help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		nb = sub(/^## /, "", helpMsg); \
		if (nb == 0) { \
			helpMsg = $$0; \
			nb = sub(/^[^:]*:.* ## /, "", helpMsg); \
		} \
		if (nb) \
			print "  " $$1 "\t" helpMsg; \
	} \
	{ helpMsg = $$0 }' $(MAKEFILE_LIST) | column -t -s ':'

setup: ## Setup project
	@echo "Setting up project..."
	@echo "Installing Terraform..."
	@brew install terraform
	@echo "Installing AWS CLI..."
	@brew install awscli
	@echo "Installing AWS SAM CLI..."
	@brew tap aws/tap
	@brew install aws-sam-cli
	@echo "Installing poetry..."
	@brew install poetry
	@echo "Installing pre-commit..."
	@brew install pre-commit
	@echo "Installing pre-commit hooks..."
	@pre-commit install
	@echo "Project setup complete!"

create-virtualenv: ## Create virtual environment
	@echo "Creating virtual environment..."
	poetry install

create-target-dir: ## Delete and create target directory
	@echo "Deleting and creating target directory..."
	rm -rf target
	mkdir target

generate-lambda-zip: create-target-dir ## Generate Lambda function ZIP archive
	@echo "Generating Lambda function ZIP archive..."
	rm -rf lambda_function_payload.zip
	cd lambda && zip -r ../target/lambda_function_payload.zip .

init: ## Initialize Terraform
	cd terraform && terraform init

# Format Terraform files
fmt: ## Format Terraform files
	cd terraform && terraform fmt -recursive

validate: ## Validate Terraform files
	cd terraform && terraform validate

plan-dev: ## Plan Dev Terraform changes
	cd terraform && terraform plan -var-file=environments/dev.tfvars

apply-dev: ## Apply Dev Terraform changes
	cd terraform && terraform apply -var-file=environments/dev.tfvars

destroy-dev: ## Destroy Dev Terraform resources
	cd terraform && terraform destroy -var-file=environments/dev.tfvars

plan-prod: ## Plan Prod Terraform changes
	cd terraform && terraform plan -var-file=environments/prod.tfvars

apply-prod: ## Apply Prod Terraform changes
	cd terraform && terraform apply -var-file=environments/prod.tfvars

destroy-prod: ## Destroy Prod Terraform resources
	cd terraform && terraform destroy -var-file=environments/prod.tfvars

clean: ## Clean up Terraform workspace
	cd terraform && rm -rf .terraform terraform.tfstate*
