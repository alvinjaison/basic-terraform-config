#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 -e <environment> -p <project_name> -r <region>"
    echo "Options:"
    echo "  -r, --region        AWS Region (e.g., eu-west-2, us-east-1)"
    echo "  -e, --environment   Environment name (e.g., dev, staging, prod)"
    echo "  -p, --project       Project name (e.g., project1, project2, project3...)"
    exit 1
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -r|--region)
            region="$2"
            shift
            shift
            ;;
        -e|--environment)
            environment="$2"
            shift
            shift
            ;;
        -p|--project)
            project="$2"
            shift
            shift
            ;;
        *)
            usage
            ;;
    esac
done

# Validate options
if [[ -z $environment ]] || [[ -z $project ]] || [[ -z $region ]]; then
    echo "Error: Environment, project, and region are required."
    usage
fi

# Define S3 bucket and DynamoDB table names
bucket_name="tfstate-${project}-${region}-${environment}"
dynamodb_table="terraform-lock-${project}-${region}-${environment}"

# Create S3 bucket if it doesn't exist
aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Backend bucket $bucket_name doesn't exist. Please create it manually..."
    exit 1
    #echo "Creating S3 bucket: $bucket_name in region: $region"
    #aws s3api create-bucket --bucket "$bucket_name" --region "$region" --create-bucket-configuration LocationConstraint="$region"
else
    echo "S3 bucket $bucket_name already exists."
fi

# Create DynamoDB table if it doesn't exist
aws dynamodb describe-table --table-name "$dynamodb_table" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Backend DynamoDB table $dynamodb_table doesn't exist. Please create it manually..."
    exit 1
    # echo "Creating DynamoDB table: $dynamodb_table in region: $region"
    # aws dynamodb create-table --table-name "$dynamodb_table" \
    #     --attribute-definitions AttributeName=LockID,AttributeType=S \
    #     --key-schema AttributeName=LockID,KeyType=HASH \
    #     --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
    #     --region "$region"
else
    echo "DynamoDB table $dynamodb_table already exists."
fi

# Generate Terraform backend configuration
cat << EOF > backend.tf
terraform {
  backend "s3" {
    bucket         = "$bucket_name"
    key            = "terraform.tfstate"
    region         = "$region"
    dynamodb_table = "$dynamodb_table"
    encrypt        = true
  }
}
EOF

echo "Terraform backend configuration generated successfully!"
