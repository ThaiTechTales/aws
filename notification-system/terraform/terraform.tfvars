# ----------------
# Provider: AWS
# ----------------
aws_region = "ap-southeast-2"

# -----------------------------------
# Simple Notification Service (SNS)
# -----------------------------------
sns_topic_name = "sns-dev-apse2-topic-notification-01"
email_address = "example@example.com"

# -----------------------------------
# Simple Queue Service (SQS)
# -----------------------------------
queue_name = "sqs-dev-apse2-queue-processing-01"
# dlq_name   = "sqs-dev-apse2-queue-dlq-01"

# ----------------
# S3 Bucket
# ----------------
bucket_name = "s3-dev-apse2-processed-logs-01"

# ----------------
# Lambda Function
# ----------------
role_name     = "role-dev-apse2-lambda-01"
policy_name   = "policy-dev-apse2-lambda-01"
function_name = "lambda-dev-apse2-processor-01"
handler       = "lambda_function.lambda_handler"
runtime       = "python3.9"
retention_in_days = 7