# Terraform Infrastructure Repository

This repository contains Terraform configurations for managing infrastructure on AWS. The configurations are designed to be reusable across multiple environments such as `dev`, `staging`, and `prod`.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) v0.12+
- [AWS CLI](https://aws.amazon.com/cli/) v2+
- [jq](https://stedolan.github.io/jq/) (optional, for JSON parsing)

## Repository Structure

```plaintext
.
├── config/                     # Directory for environment basedconfiguration
│   └── dev.tfvars              # Variable definitions specific to the development environment
├── scripts/                    # Directory for utility scripts
│   └── init_backend.sh         # Script to generate Terraform backend configuration
├── backend.tf                  # Terraform backend configuration
├── main.tf                     # Main Terraform configuration
├── variables.tf                # Variable definitions
├── outputs.tf                  # Output definitions
├── locals.tf                   # Local value definitions
├── .gitignore                  # Git ignore rules
└── README.md                   # This README file
```


## Setting Up the Backend
The backend configuration for Terraform is necessary to store the state files remotely, enabling collaboration and preventing state conflicts. This repository uses an S3 bucket and a DynamoDB table for backend configuration.

## Generate Backend Configuration
To generate the backend configuration, use the init_backend.sh script located in the scripts directory. This script ensures the necessary S3 bucket and DynamoDB table are already exist.

## Usage

Run the generate_backend.sh script:

```
.scripts/generate_backend.sh -r <region> -e <environment> -p <project_name>
```
-r, --region: AWS Region (e.g., eu-west-2, us-east-1)

-e, --environment: Environment name (e.g., dev, staging, prod)

-p, --project: Project name (e.g., ohid-nhs-login-iac)


Example:

```
./generate_backend.sh -r us-east-1 -e dev -p my-project
```

## Example backend.tf Generated by the Script
The script will generate a backend.tf file similar to the following:

```
terraform {
  backend "s3" {
    bucket         = "tfstate-my-project-us-east-1-dev"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-my-project-us-east-1-dev"
    encrypt        = true
  }
}
```

## Terraform Commands

### Initialize the Terraform Workspace
Initialize the Terraform workspace by running the following command in the root directory of the repository:

```
terraform init
```

### Plan the Infrastructure
Review the changes Terraform will make to your infrastructure:

```
terraform plan
```

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


Note: Replace *region*, *environment* and *project_name* with the appropriate values for your setup.
