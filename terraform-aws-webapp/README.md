# High Availability Web Application Infrastructure on AWS using Terraform

## Overview
This project demonstrates a highly available web application infrastructure on AWS using Terraform. It includes a VPC, subnets, EC2 instances, and an ALB.

## Technologies Used
- Terraform: Infrastructure as Code (IaC) tool to provision AWS resources.
- AWS: Cloud platform for deploying infrastructure.
- Git: Version control for managing Terraform configuration files.
- Bash: Script automation for initial setups (optional).

## Features
- Modular and reusable Terraform code.
- High availability with multi-AZ architecture.
- Secure design with security groups.

## Requirements
- Terraform v1.5+
- AWS CLI
- AWS credentials configured.

## Usage
1. Clone this repository.
2. Edit `terraform.tfvars` with your AWS region and other variables.
3. Initialize Terraform:
   ```bash
   terraform init
4. terraform validate:
    ```bash
    terraform validate
    ```
5. Plan and apply the configuration:
    ```bash
    terraform plan
    terraform apply
    ```

## Testing
- Access the ALB DNS in a browser to view the web app.

## Cleanup
- Destroy resources
    ```bash
    terraform destroy
    ```
