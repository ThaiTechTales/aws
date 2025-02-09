# ----------------
# Provider: AWS
# ----------------
aws_region = "ap-southeast-2"

# ----------------
# CloudTrail
# ----------------
cloudtrail_name = "cloudtrail-logs-dev-apse2-01"

# ----------------
# CloudWatch
# ----------------
log_group_name = "cloudwatch-logs-dev-apse2-cloudtrail-01"

alarm_s3_put_request_name      = "cloudwatch-alarm-logs-dev-apse2-s3-put-01"
alarm_s3_delete_request_name   = "cloudwatch-alarm-logs-dev-apse2-s3-delete-01"
alarm_ec2_create_name          = "cloudwatch-alarm-logs-dev-apse2-ec2-create-01"
alarm_ec2_terminate_name       = "cloudwatch-alarm-logs-dev-apse2-ec2-terminate-01"
alarm_ec2_cpu_utilization_name = "cloudwatch-alarm-logs-dev-apse2-ec2-cpu-utilization"

iam_role_name        = "role-dev-apse2-cloudwatch-01"
iam_role_policy_name = "policy-dev-apse2-cloudwatch-01"

# ----------------
# S3 Bucket
# ----------------
bucket_cloudtrail       = "s3-dev-apse2-cloudtrail-01"
bucket_cloudwatch_alarm = "s3-dev-apse2-cloudwatch-alarm-test-01"
filter_id               = "EntireBucket"

# ----------------
# SNS
# ----------------
topic_name    = "sns-dev-apse2-cloudwatch-01"
email_address = "lethai@live.com.au"

# ----------------
# EC2
# ----------------
ami_id        = "ami-0d6560f3176dc9ec0" # Amazon Linux 2 AMI
instance_type = "t2.micro"