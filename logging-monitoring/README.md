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


Exactly! Here's a detailed breakdown of how CloudTrail Event History and Trails work, and how they interact with each other:

CloudTrail Event History
Always Active:
CloudTrail Event History is a default feature in AWS that records the last 90 days of management events for free.
It tracks management events (API calls related to creating, modifying, or deleting AWS resources) across all regions, even if no CloudTrail trail is configured.
Events Recorded:
Read Management Events: E.g., DescribeInstances, ListBuckets.
Write Management Events: E.g., RunInstances, CreateBucket, DeleteBucket.
Access:
Accessible via the CloudTrail Console under Event History.
You can filter by:
Event source: AWS service (e.g., ec2.amazonaws.com).
Event name: Specific API action (e.g., CreateBucket).
Time range: Last 90 days.

CloudTrail Trails
A trail allows you to manage how and where CloudTrail records and stores logs for longer-term tracking, detailed logging, and specific customisation. Here's what a trail does:

1. Extended Log Management
Default Event Logging:
A trail ensures all management events (read and write) are stored beyond 90 days in a destination like S3, CloudWatch Logs, or both.
Customisable Data Retention:
Logs stored in S3 can have lifecycle policies for longer-term storage (e.g., archival to Glacier).
CloudWatch Logs can be used for real-time monitoring and log processing.
2. Captures Additional Events
Data Events:
By default, CloudTrail Event History does not log data events (e.g., GetObject or PutObject for S3, or Invoke for Lambda).
A trail can be configured to capture data events, which include actions on S3 objects, DynamoDB items, and Lambda functions.
Insight Events:
Detects unusual activity patterns (e.g., an unusual spike in API calls).
3. Customisable Filtering
Trails allow you to filter which events are logged and stored:
Management Events:
Capture only read, write, or both types of events.
Data Events:
Select specific buckets, Lambda functions, or all resources.
Regions:
Choose specific regions or make the trail multi-region.
This ensures you only log and store the events you care about, reducing unnecessary costs.
4. Log Destinations
S3:
Store logs in an S3 bucket for long-term retention.
Example use case: Compliance audits or archival storage.
CloudWatch Logs:
Enable real-time log analysis, set up alarms, and integrate with AWS services like EventBridge for automation.


S3 Predefined metrics
https://docs.aws.amazon.com/AmazonS3/latest/userguide/metrics-dimensions.html

## Cleanup

Destroy resources

  ```bash
  terraform destroy
  ```

## Screenshots
