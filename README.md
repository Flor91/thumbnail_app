# Thumbnail generator
[![Pre-commit Check](https://github.com/Flor91/thumbnail_app/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/Flor91/thumbnail_app/actions/workflows/pre-commit.yml)

Thumbnail generator App deployed in AWS using Terraform and Github Actions.

We have found a time machine and went back in time! The year is 2000 and social media is just taking off. The hottest thing is a thumbnail generator: you input a big picture and get a small picture as  output.

## Description

This is a simple app that generates a thumbnail from a given image. The app is deployed in AWS using the following services:

- Lambda
- API Gateway

### Requirements

- Terraform
- AWS CLI
- Poetry

#### Other Recommended tools

- tfswitch
- aws-vault or acp

### How to run

A `MAKEFILE` is provided to simplify the process. The following commands are available:

Available targets:
  setup                 Setup project
  create-virtualenv     Create virtual environment
  create-target-dir     Delete and create target directory
  generate-lambda-zip   Generate Lambda function ZIP archive
  init                  Initialize Terraform
  fmt                   Format Terraform files
  validate              Validate Terraform files
  plan-dev              Plan Dev Terraform changes
  apply-dev             Apply Dev Terraform changes
  destroy-dev           Destroy Dev Terraform resources
  plan-prod             Plan Prod Terraform changes
  apply-prod            Apply Prod Terraform changes
  destroy-prod          Destroy Prod Terraform resources
  clean                 Clean up Terraform workspace
  help                  Show this help.

## How it works

The app is composed of 3 main components:
- **API Gateway**: This is the entry point of the app. It receives the image binary encoded.
- **Lambda**: This is the core of the app. It receives the image binary, generates the thumbnail and returns the small sized thumbnail binary.
- **CloudWatch**: This is used to monitor the app.

## About the architecture
### Strengths

- **Simplicity**: The app is simple. It is easy to understand and maintain.
- **Cost**: The app is cheap. It is easy to optimize for cost.
- **Performance**: The app is fast. It is easy to optimize for performance.
- **Scalability**: The app is easy to scale. It is easy to handle a large number of requests.
- **Logging**: The app is easy to monitor. It is easy to recover from failures.
- **CI/CD**: The app is easy to deploy, and to synchronize the infrastructure with the code.

### Weaknesses

- **User interface**: This is simply an API service, no user interface is implemented.
- **Security**: No security is implemented. It is easy to add security features.
- **Error handling**: No error handling is implemented.
- **Testing**: Testing layer is very simple, and code coverage is not 100%.
- **Documentation**: Auto-generated documentation is not available. It would be very simple to add shpinx or mkdocs.
