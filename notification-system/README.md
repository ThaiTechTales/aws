# AWS Notification and Message Queue System with Terraform Modules

## Project Overview

This project demonstrates the creation of a scalable and efficient notification and messaging system using AWS services such as Simple Notification Service (SNS) and Simple Queue Service (SQS). All resources are provisioned using Terraform modules to promote reusability, maintainability, and modularity.

The project includes:

- SNS Topics for publishing messages.
- SQS Queues for decoupled, reliable message consumption.
- Subscription handling, dead-letter queues, and IAM roles for secure and fault-tolerant communication.
- A Lambda function consumes messages from the SQS queue, processes them, and sends the output to an email (via SNS) and an S3 bucket.

## Status

This project is complete and successfully provisions a highly available web application infrastructure on AWS.

## Technologies Used

- **AWS SNS:** Publish/subscribe messaging service for notification delivery.
- **AWS SQS:** Fully managed message queuing for reliable message delivery.
- **AWS Lambda:** A serverless compute service that runs code in response to events.
- **AWS S3:** Scalable object storage.
- **Terraform:** Infrastructure as Code (IaC) tool for AWS provisioning.
- **Git:** For version control of Terraform configurations.

## Project Features

- **Modular Design:** Terraform modules for reusability and scalability.
- **SNS Topic and SQS Queues:** Automated provisioning.
- **Subscriptions:** Linking SNS topics with SQS queues.
- **Dead-Letter Queues (DLQ):** For handling undelivered messages.
- **Lambda:** Processes messages from the SQS queue and routes them to the appropriate destinations.
- **S3:** Stores processed messages for durable and scalable data retention.

## Background

### Terraform

Terraform is an open-source IaC tool that allows users to define and provision infrastructure in a declarative configuration language. By using modules, Terraform configurations become reusable and maintainable.

### What is SNS?

Amazon Simple Notification Service (SNS) is a fully managed messaging service that allows publishers to send messages to multiple subscribers; it is a container of messages with a specific subject. Subscribers can be email addresses, AWS Lambda functions, HTTP endpoints, or other AWS services. It’s widely used for push notifications and broadcasting messages to multiple consumers. It is a push based system, that immediately and automatically pushes messages to subscribers.

**How it works:**

1. Publishers send messages to an SNS Topic.
2. Subscribers (e.g., SQS, Lambda, Email) receive notifications via the specified protocol.
3. Supports filtering, which allows certain subscribers to receive only relevant messages.

### What is SQS?

Amazon Simple Queue Service (SQS) is a fully managed message queuing service designed to decouple application components; it is used to process work in a specific order. It supports standard queues (at-least-once delivery) and FIFO queues (first-in-first-out). It as a poll based system to periodically check new messages.

**How it works**

1. Messages are sent to a queue.
2. Consumers poll the queue to process messages.
3. Dead-letter queues handle messages that cannot be processed successfully. When a process requests a message, it is locked, not deleted, ensuring failed processes allow the message to be reprocessed after the lock expires. In SQS, this is managed via Queue Retry, which controls retries before moving the message to a Dead Letter Queue (DLQ).

### Why Use SNS and SQS Together?

Combining SNS and SQS provides a powerful, decoupled architecture:

1. SNS broadcasts messages to multiple subscribers (e.g., SQS queues).
2. SQS ensures reliable message processing by decoupling message delivery and consumption.
3. Together, they provide scalability, reliability, and fault-tolerance.

## Workflow

1. SNS: Messages are published to an SNS topic.
2. SQS: An SQS queue subscribes to the SNS topic and buffers the messages for consumption.
3. Lambda: A Lambda function consumes messages from the SQS queue, processes them, and forwards results to an SNS topic for email delivery and an S3 bucket for storage.
4. Destinations:
    - Email: Receives a notification of the processed message.
    - S3 Bucket: Stores processed message content for later analysis.

## Requirements

- Terraform v1.5+
- AWS CLI
- AWS credentials configured.

## Usage

## Testing

## Cleanup

Destroy resources

  ```bash
  terraform destroy
  ```

## Screenshots
