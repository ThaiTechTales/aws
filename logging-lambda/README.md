# AWS Logging and Lambda Automation

## Project Overview

This project demonstrates an automated infrastructure deployment for AWS using Terraform modules. The setup includes:

1. Centralised Logging: Logging AWS Lambda function executions to CloudWatch Logs.
2. AWS Lambda Function: A Lambda function triggered by an S3 event, with its code stored in an S3 bucket.
3. Infrastructure-as-Code (IaC): Terraform modules to provision all required AWS resources.

## Technologies Used

- AWS: Cloud service provider.
  - S3: Object storage for Lambda code.
  - CloudWatch Logs: Centralized logging for AWS Lambda.
  - Lambda: Serverless compute service.
- Terraform: Infrastructure as Code (IaC) tool for AWS resource provisioning.
  - Modules: Reusable Terraform configurations.

## Key Concepts

### Terraform

Terraform is an open-source IaC tool that allows users to define and provision infrastructure in a declarative configuration language. By using modules, Terraform configurations become reusable and maintainable.

### S3

Amazon S3 provides scalable object storage. The Lambda function code is uploaded to an S3 bucket and fetched during deployment.

### IAM Roles

IAM roles in AWS are a way to grant temporary permissions to entities like AWS services, users, or applications to perform specific actions on your behalf.

### AWS Lambda

AWS Lambda is a serverless compute service that runs code in response to events. It scales automatically and charges only for compute time used. In this project, the Lambda function is triggered by S3 bucket events (e.g., object creation).

### CloudWatch Logs

Amazon CloudWatch Logs enable monitoring and storing of log data from AWS services. Here, it captures Lambda execution logs.

## Project Features

- **Event-driven Lambda:** A Lambda function triggered by S3 object events.
- **Centralised Logging:** Logging Lambda execution details to CloudWatch Logs.
- **Terraform Modules:** Separate modules for Lambda, S3, and IAM.
- **Secure Infrastructure:** IAM roles and policies for Lambda execution permissions.

## Workflow

1. **S3 Bucket Creation:** Terraform provisions an S3 bucket to store Lambda function code.
2. **IAM Role and Policy:** IAM module creates a role for the Lambda function, granting it permissions for S3 and CloudWatch.
3. **Lambda Deployment:** Terraform deploys the Lambda function using the code uploaded to the S3 bucket.
4. **Event Trigger:** An S3 bucket event triggers the Lambda function on object creation.
5. **Logging:** The Lambda function writes logs to CloudWatch Logs.

The following diagram represents the workflow of this project.

![Architecture Diagram](images/architecture-diagram/architecture-diagram.png)

## Requirements

- Terraform v1.5+
- AWS CLI
- AWS credentials configured.

## Usage & Testing

| Step          | Command/Action | Expected Output  |
| ------------- | -------------- | -----------------|
| Clone this repository        | Follow Github's cloning instructions | Cloned repository into local machine.
| Edit `terraform.tfvars` | Open terraform.tfvars and adjust accordingly          | Configured values.
| Initialise Terraform        | Run the following in terminal: <pre> <p>terraform init  </p></pre>              | Initialised Terraform configurations.
| Validate Terraform        | Run the following in terminal: <pre> <p>terraform validate  </p></pre>              | Validated Terraform configurations.
| Deploy S3 Bucket         | Run the following in terminal: <pre> <p>terraform apply -target=module.s3  </p></pre>              | Deployed S3 Bucket.
| Package Lambda Code        | Run the following in terminal: <pre> <p>zip lambda_function.zip lambda_function.py  </p></pre>              | A `.zip` file is created in `lambda_code/`.
| Upload Lambda Code to S3         | Run the following in terminal: <pre> <p>aws s3 cp ./lambda_code/lambda_function.zip s3://s3-dev-apse2-lambda-code-01/lambda_code/</p></pre>       |   File is uploaded successfully to S3.
| Deploy remaining resources (IAM and Lambda) | Run the following in terminal: <pre> <p>terraform plan<br>terraform apply</br></p></pre> | Plan and Applied Terraform configurations.
| Trigger Lambda by Uploading File      | Run the following in terminal: <pre> <p>aws s3 cp hello-world-01.txt s3://s3-dev-apse2-lambda-code-01/files/  </p></pre>    |   Lambda is triggered by the new file upload.
| Check Logs in CloudWatch      | <pr><p> <ol> <li> Log into AWS and navigate to CloudWatch<li> Select Log groups</li> <li>Find and select Log Group `/aws/lambda/lambda-function-dev-apse2-s3-01`</li> <li>View logs in CloudWatch Logs</li></ol></pre> |   Logs show the S3 event processed by Lambda.
| Clean Up        | Run the following in terminal: <pre> <p>terraform destroy</p></pre>  | Resources deleted.

## Screenshots

### S3 Bucket

The following screenshots shows the provisioned S3 Bucket and its objects.

![S3 Bucket](images/s3/s3.png)

### IAM Role

The following screenshots shows the provisioned IAM role and policy.

![IAM](images/iam/iam-role.png)

### Lambda

The following screenshots shows the provisioned Lambda code and its assigned role and permissions.

![Lambda](images/lambda/lambda.png)

### CloudWatch

The following screenshot shows CloudwWatch and the logged event triggered by uploading a file to the S3 bucket.

![CloudWatch](images/cloudwatch/cloudwatch.png)
