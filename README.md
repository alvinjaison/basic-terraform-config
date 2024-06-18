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
├── README.md
├── applications
│   └── example-application-1
│       ├── data.tf
│       ├── locals.tf
│       ├── main.tf
│       ├── provider.tf
│       ├── tfvars
│       │   ├── example-application-1-dev.tfvars
│       │   └── example-application-1-prod.tfvars
│       ├── variables.tf
│       └── versions.tf
├── environment
│   ├── dev.tfvars
│   └── prod.tfvars
├── global.tfvars
└── outputs.tf
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
terraform apply --var-file environment/dev.tfvars
```
### Destroy the Infrastructure
To destroy the infrastructure managed by Terraform:


```
terraform destroy config/dev.tfvars
```

