# Basic Terraform Config Repository

This directory contains extended examples of Terraform configurations for managing applications and core services. The structure includes environment-specific configurations and global variables.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) v0.12+
- [AWS CLI](https://aws.amazon.com/cli/) v2+

## Repository Structure

```plaintext
extended-example
├── README.md                   # This README file
├── applications                # Directory for application configurations
│   ├── example-application-1   # Example Application 1
│   │   ├── data.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── tfvars
│   │   │   ├── example-application-1-dev.tfvars
│   │   │   └── example-application-1-test.tfvars
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── example-application-2   # Example Application 2
│       ├── data.tf
│       ├── locals.tf
│       ├── main.tf
│       ├── tfvars
│       │   ├── example-application-2-dev.tfvars
│       │   └── example-application-2-test.tfvars
│       ├── variables.tf
│       └── versions.tf
├── core-services               # Directory for core service configurations
│   ├── example-service-1       # Example Service 1
│   │   ├── data.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── tfvars
│   │   │   ├── example-service-1-dev.tfvars
│   │   │   ├── example-service-1-prod.tfvars
│   │   │   └── example-service-1-test.tfvars
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── example-service-2       # Example Service 2
│       ├── data.tf
│       ├── locals.tf
│       ├── main.tf
│       ├── tfvars
│       │   ├── example-service-2-dev.tfvars
│       │   ├── example-service-2-prod.tfvars
│       │   └── example-service-2-test.tfvars
│       ├── variables.tf
│       └── versions.tf
├── environment                 # Directory for environment-specific variable definitions
│   ├── dev.tfvars
│   ├── prod.tfvars
│   └── test.tfvars
└── global.tfvars               # Global variables

```


## Usage

### Initialize the Terraform Workspace
Initialize the Terraform workspace by running the following command in the root directory of the repository:

```
terraform init
```

### Plan the Infrastructure
To see the changes Terraform will make to your infrastructure, use the plan command with the appropriate variable file for your environment:

```
terraform plan -var-file=environment/dev.tfvars
```
Replace dev.tfvars with prod.tfvars or test.tfvars for production or test environments, respectively.
### Apply the Changes
Apply the changes to your infrastructure:

```
terraform apply --var-file config/dev.tfvars
```
### Destroy the Infrastructure
To destroy the infrastructure managed by Terraform:


```
terraform destroy config/dev.tfvars
```

## Directory Details
### Applications
*example-application-1*
Contains Terraform configurations for Example Application 1.

`data.tf`: Data sources used by the application.
`locals.tf`: Local values used by the application.
`main.tf`: Main configuration file.
`tfvars`: Directory containing environment-specific variable files.
`example-application-1-dev.tfvars`: Variables for the development environment.
`example-application-1-test.tfvars`: Variables for the test environment.
variables.tf: Variable definitions.
versions.tf: Terraform version and provider requirements.
example-application-2
Contains Terraform configurations for Example Application 2.

Similar structure to Example Application 1.
### Core Services
#### example-service-1
Contains Terraform configurations for Example Service 1.

data.tf: Data sources used by the service.
locals.tf: Local values used by the service.
main.tf: Main configuration file.
tfvars: Directory containing environment-specific variable files.
example-service-1-dev.tfvars: Variables for the development environment.
example-service-1-prod.tfvars: Variables for the production environment.
example-service-1-test.tfvars: Variables for the test environment.
variables.tf: Variable definitions.
versions.tf: Terraform version and provider requirements.
#### example-service-2
Contains Terraform configurations for Example Service 2.

Similar structure to Example Service 1.
### Environment
dev.tfvars: Variable definitions for the development environment.
prod.tfvars: Variable definitions for the production environment.
test.tfvars: Variable definitions for the test environment.
Global Variables
global.tfvars: Definitions for global variables used across the configurations.
