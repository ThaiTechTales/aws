# Amazon Inspector

## Project Overview
This project implements a real-time serverless data pipeline to process IoT sensor data efficiently. IoT devices publish sensor data to AWS IoT Core, which routes it to Kinesis Data Streams. AWS Lambda processes and transforms this data before storing it in DynamoDB for real-time querying. AWS QuickSight visualises this data to provide insights. For deeper analytics, AWS Glue extracts, transforms, and loads (ETL) data into Amazon Redshift.

## Technologies Used

- **AWS IoT Core:** Securely connects IoT devices to AWS and routes their data to other services.
- **AWS Kinesis Data Streams:** A real-time data streaming service used for ingesting large volumes of sensor data.
- **AWS Lambda:** Processes the streamed data by transforming and filtering it before storage.
- **Amazon DynamoDB:** A NoSQL database for storing the processed IoT data for real-time querying.
- **AWS QuickSight:** Provides visual analytics and dashboards for real-time insights into the IoT data.
- **AWS Glue:** An ETL (Extract, Transform, Load) service that integrates with Amazon Redshift for deeper analytics.
- **Amazon Redshift:** A fully managed data warehouse used for complex queries and large-scale analytics.
- **IAM:** Identity and Access Management for defining roles and permissions.
- **Terraform:** Infrastructure as Code (IaC) tool for automating resource provisioning.
- **Git:** For version control.

## Key Terms

- **IoT Devices:** Physical devices embedded with sensors, software, and connectivity to exchange data with other devices or systems over the internet. Examples include temperature sensors, smart thermostats, and industrial machinery sensors.
- **AWS IoT Core:** A managed cloud service that allows IoT devices to securely connect and interact with AWS services and other devices. It handles device authentication, data routing, and communication protocols.
- **Kinesis Data Streams:** A real-time data streaming service that enables the continuous capture and processing of large volumes of data from multiple sources. It supports real-time analytics, data transformation, and event-driven applications.
- **AWS Lambda:** A serverless compute service that automatically runs code in response to events, such as data arriving in a Kinesis stream, without the need to manage servers. It scales automatically based on the workload.
- **Amazon DynamoDB:** A fully managed NoSQL database service that offers fast and predictable performance with seamless scalability. It stores the processed data in a key-value format for real-time querying.
- **AWS QuickSight:** A business intelligence service that allows users to create and share interactive dashboards and visualizations from various data sources, including DynamoDB.
- **AWS Glue:** A serverless ETL (Extract, Transform, Load) service that prepares and transforms data for analytics. It can move data from DynamoDB to Redshift for more complex querying.
- **Amazon Redshift:** A fast, scalable data warehouse service designed for large-scale data analysis and complex queries. It integrates with AWS Glue for deep analytical processing.
- **ETL (Extract, Transform, Load):** A process in data integration that involves extracting data from source systems, transforming it into a suitable format, and loading it into a target system for analysis.
- **Serverless Architecture:** A cloud computing execution model where the cloud provider dynamically manages the allocation of machine resources. Services like Lambda and DynamoDB enable applications to scale automatically without infrastructure management.
- **Event Source Mapping:** A mechanism in AWS Lambda that connects event sources like Kinesis streams to Lambda functions, automatically invoking the function when new data arrives.
- **IAM (Identity and Access Management):** A service that helps control access to AWS resources securely by defining roles and permissions for users, applications, and services.


## Key Concepts


## Requirements

- Terraform v1.5+
- AWS CLI
- AWS credentials configured.

## Usage

1. Clone this repository.

### Terraform

1. Edit `terraform.tfvars` with the desired AWS region and other variables.
2. Initialise Terraform:

   ```bash
   terraform init
3. terraform validate:

    ```bash
    terraform validate
    ```

4. Plan and apply the configuration:

    ```bash
    terraform plan
    terraform apply
    ```

### CloudFormation

1. Validate the CloudFormation template:


2. Create the CloudFormation stack:

## Testing

| Step          | Command/Action | Expected Output  |
| ------------- | -------------- | -----------------|
| View IAM Groups | Navigate to IAM Console, Click on Groups | IAM groups should be listed |
| View IAM Users | Navigate to IAM Console, Click on Users | IAM users should be listed |
| View IAM Roles | Navigate to IAM Console, Click on Roles | IAM roles should be listed |
| View IAM Policies | Navigate to IAM Console, Click on Policies | IAM policies should be listed |

## Cleanup

### Terraform

1. Destroy resources

    ```bash
    terraform destroy
    ```

### CloudFormation

1. Destroy resources


## Screenshots
