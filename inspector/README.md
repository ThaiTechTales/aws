# AWS Project

## Project Overview

This project deploys a solution using AWS Inspector to scan and assess vulnerabilities for both standalone EC2 instances and EC2 instances deployed through an Auto Scaling Group (ASG). AWS Inspector is a security assessment service that helps identify vulnerabilities and deviations from security best practices. It demonstrates both the Classic and the v2 versions of AWS Inspector for the assessment.

## Technologies Used

- **AWS Inspector:** A service for automated security assessment of EC2 instances to identify vulnerabilities and improve security posture.
- **EC2:** Virtual machines for running applications.
- **Auto Scaling Group (ASG):** Automatically adjusts the number of EC2 instances based on demand.
- **IAM:** Identity and Access Management for defining roles and permissions.
- **Terraform:** Infrastructure as Code (IaC) tool for automating resource provisioning.
- **Git:** For version control.

## Key Terms

- **AWS Inspector:** A tool to identify vulnerabilities in EC2 instances.
- **Assessment Target:** A collection of resources to be assessed by AWS Inspector.
- **Assessment Template:** Defines the rules package and duration for assessments.
- **Auto Scaling Group:** A group of EC2 instances that scales based on demand.
- **IAM Role:** Provides permissions to AWS services like EC2 and Inspector.

## Key Concepts

- **Inspector Classic:** The original version of AWS Inspector, which requires the creation of assessment targets and templates. It supports a limited set of operating systems and regions. For more details of supported os, refer to the [Inspector Classic documentation](https://docs.aws.amazon.com/inspector/v1/userguide/inspector_supported_os_regions.html).

- **Inspector V2:** The newer version of AWS Inspector, which simplifies the setup process by eliminating the need for assessment targets. It provides broader coverage and improved integration with other AWS services.

## Workflow

- AWS Inspector requires an **Assessment Target** to define the resources (e.g., EC2 instances) it will scan.
- An **Assessment Template** specifies the type of rules and duration for the scans.
- Auto Scaling Group instances must be dynamically included in the Inspector scans, which is managed using tags.

## Requirements

- Terraform v1.5+
- AWS CLI
- AWS credentials configured.


## Usage

1. Clone this repository.
2. Edit `terraform.tfvars` with the desired AWS region and other variables.
3. Initialise Terraform:

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
