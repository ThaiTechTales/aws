# High Availability Web Application Infrastructure on AWS using Terraform

## Overview

This project demonstrates the creation of a highly available infrastructure to host a web application using AWS and Terraform. The setup includes an Amazon VPC, subnets across multiple Availability Zones, an EC2 instance with a web server, and an Application Load Balancer (ALB).

## Status

This project is complete and successfully provisions a highly available web application infrastructure on AWS.

## Technologies Used

- Terraform: Infrastructure as Code (IaC) tool to provision AWS resources.
- AWS: Cloud platform for deploying infrastructure.
- Git: Version control for managing Terraform configuration files.

## Project Features

- Highly Available Infrastructure:
  - VPC with private and public subnets across two Availability Zones.
  - Internet Gateway and route tables for network routing.
- Scalable Web Application:
  - EC2 instances with a web server.
  - Application Load Balancer (ALB) for distributing traffic.
- Secure Configuration:
  - Security groups for controlled access.
  - IAM roles for instance profiles.
- Reusable Terraform Modules:
  - Separate modules for networking, compute, and storage.

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

| Step          | Command/Action | Expected Output  |
| ------------- | -------------- | -----------------|
| Verify ALB Health Status       | 1. Go to AWS Management Console. <br>2. Navigate to EC2 > Load Balancers. <br>3. Select ALB (`alb-dev-apse2-01`). <br>4. Check the Resource Map for registered target's health status. | Registered targets should be Healthy.
| Check Web Server Status        | Run the following on the EC2 instance: <pre> <p>sudo systemctl status httpd </p></pre>        |   Web server should be Active (running).
| Test the Website Locally       | Run the following on the EC2 instance: <pre> <p>curl http://localhost </p></pre>              |   `Welcome to Terraform Web App!`
| Test Public IP from EC2        | Run the following on the EC2 instance: <pre> <p>curl http://&lt;Public-IP&gt;</p></pre>       |   `Welcome to Terraform Web App!`
| Test ALB DNS Name from EC2     | Run the following on the EC2 instance: <pre> <p>curl http://&lt;ALB-DNS-Name&gt;</p></pre>    |   `Welcome to Terraform Web App!`
| Test Public IP from External   | Run the following on an external machine: <pre> <p>curl http://&lt;Public-IP&gt;</p></pre>    |   `Welcome to Terraform Web App!`
| Test ALB DNS Name from EC2     | Run the following on an external machine: <pre> <p>curl http://&lt;ALB-DNS-Name&gt;</p></pre> |   `Welcome to Terraform Web App!`

## Cleanup

Destroy resources

  ```bash
  terraform destroy
  ```
