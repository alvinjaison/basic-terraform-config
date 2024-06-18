# Basic Terraform Config Repository

This repository contains Terraform configurations for managing infrastructure on AWS. It includes basic configurations for modules, simple applications, and an extended example.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) v0.12+
- [AWS CLI](https://aws.amazon.com/cli/) v2+
- [jq](https://stedolan.github.io/jq/) (optional, for JSON parsing)

## Repository Structure

```plaintext
.
├── README.md                  # This README file
├── extended-example           # Directory for extended examples
│   ├── applications
│   │   ├── example-application-1
│   │   │   ├── data.tf
│   │   │   ├── locals.tf
│   │   │   ├── main.tf
│   │   │   ├── tfvars
│   │   │   │   ├── example-application-1-dev.tfvars
│   │   │   │   └── example-application-1-test.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── example-application-2
│   │       ├── data.tf
│   │       ├── locals.tf
│   │       ├── main.tf
│   │       ├── tfvars
│   │       │   ├── example-application-2-dev.tfvars
│   │       │   └── example-application-2-test.tfvars
│   │       ├── variables.tf
│   │       └── versions.tf
│   ├── core-services
│   │   ├── example-service-1
│   │   │   ├── data.tf
│   │   │   ├── locals.tf
│   │   │   ├── main.tf
│   │   │   ├── tfvars
│   │   │   │   ├── example-service-1-dev.tfvars
│   │   │   │   ├── example-service-1-prod.tfvars
│   │   │   │   └── example-service-1-test.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── example-service-2
│   │       ├── data.tf
│   │       ├── locals.tf
│   │       ├── main.tf
│   │       ├── tfvars
│   │       │   ├── example-service-2-dev.tfvars
│   │       │   ├── example-service-2-prod.tfvars
│   │       │   └── example-service-2-test.tfvars
│   │       ├── variables.tf
│   │       └── versions.tf
│   ├── environment            # Environment-specific variable definitions
│   │   ├── dev.tfvars
│   │   ├── prod.tfvars
│   │   └── test.tfvars
│   └── global.tfvars          # Global variables
├── module                     # Directory for reusable Terraform modules
│   ├── README.md
│   ├── examples
│   │   ├── main.tf
│   │   └── provider.tf
│   ├── main.tf
│   └── variables.tf
├── simple-example             # Directory for simple examples
│   ├── applications
│   │   └── example-application-1
│   │       ├── data.tf
│   │       ├── locals.tf
│   │       ├── main.tf
│   │       ├── tfvars
│   │       │   ├── example-application-1-dev.tfvars
│   │       │   └── example-application-1-prod.tfvars
│   │       ├── variables.tf
│   │       └── versions.tf
│   ├── environment            # Environment-spec

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


Note: Replace `<region>`, `<environment>` and `<project_name>` with the appropriate values for your setup.
