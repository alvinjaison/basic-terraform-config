variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "devops-project"
}

variable "environment" {
  description = "The deployment environment (e.g., Dev, Staging, Prod)"
  type        = string
  default     = "dev"
}
