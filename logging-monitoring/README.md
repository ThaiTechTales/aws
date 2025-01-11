# AWS Notification and Message Queue System

## Project Overview

This project demonstrates how to set up comprehensive logging and monitoring infrastructure on AWS. It includes enabling and managing AWS CloudTrail for API activity tracking and AWS CloudWatch for log monitoring and metric visualszation. All resources are provisioned using Terraform modules to promote reusability, maintainability, and modularity.

## Technologies Used

- **AWS CloudTrail:** Tracks user activity and API requests for auditing purposes.
- **AWS CloudWatch:** Collects monitoring and operational data, enabling log storage and metric analysis.
- **Terraform:** Infrastructure as Code (IaC) tool for automating resource provisioning.
- **Git:** For version control.

## Key Terms

- **API Activity**: Any interaction with AWS services, such as creating resources or retrieving data, typically recorded by CloudTrail for security and auditing purposes.

## Key Concepts

### AWS CloudTrail

CloudTrail logs all API calls across an AWS account.

- **How it works:** Captures API activity, stores logs in an S3 bucket, and integrates with CloudWatch for event monitoring.
- **Why use it:** Auditing, compliance, and troubleshooting purposes.
- **Where to use it:** Essential for security-focused applications and environments requiring strict audit trails.

### AWS CloudWatch

CloudWatch provides monitoring and operational data in the form of metrics, logs, and alarms.

- **How it works:** Resources send logs and metrics to CloudWatch, which are visualized and analyzed via dashboards and alarms.
- **Why use it:** Centralised monitoring, alerting capabilities, and integration with AWS services.
- **Where to use it:** Monitoring applications, responding to performance changes, and troubleshooting issues.

## Workflow

The following diagram represents the workflow of this project.

![Architecture Diagram](images/architecture-diagram/architecture-diagram.png)

## Key Terms

## Key Concepts

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

| Step          | Command/Action | Expected Output  |
| ------------- | -------------- | -----------------|
| Confirm email subscription    | Once resources are deployed, confirm subscription via email link.  | Email subscription is active.
| Publish a test message        | Run the following in terminal: <pre> <p>aws sns publish --topic-arn <SNS_TOPIC_ARN> --message "Test Message" </p></pre>              | Message ID is returned.


Setting alarm

aws cloudwatch set-alarm-state --alarm-name cloudwatch-alarm-logs-dev-apse2-cloudtrail-01 --state-reason "Testing the Amazon Cloudwatch alarm" --state-value ALARM  


turn on cloudtrail data event and now and future s3 then ls buckets

in s3 bucket...https://docs.aws.amazon.com/AmazonS3/latest/userguide/configure-request-metrics-bucket.html

cloud watch request metric

https://docs.aws.amazon.com/AmazonS3/latest/userguide/configure-request-metrics-bucket.html

## Cleanup

Destroy resources

  ```bash
  terraform destroy
  ```

## Screenshots
