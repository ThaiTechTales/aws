# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference
resource "aws_cloudwatch_metric_alarm" "s3_put_requests" {
  alarm_name  = var.alarm_s3_put_request_name
  metric_name = "PutRequests"
  namespace   = "AWS/S3"

  comparison_operator = "GreaterThanOrEqualToThreshold"

  # Specifies the number of consecutive periods over which the metric data is compared to the threshold.
  # E.g. if evaluation_periods is set to 1, the alarm will evaluate the metric data for one period (e.g., one 60-second interval if period is 60) and compare it to the threshold.
  # If evaluation_periods is set to 3, the alarm will evaluate the metric data over three consecutive periods (e.g., three 60-second intervals if period is 60) and compare the aggregated data to the threshold.
  evaluation_periods = 1

  #  Specifies the length of time in seconds over which the metric data is aggregated for each evaluation.
  #  E.g. if period is set to 60, the metric data is aggregated over 60-second intervals.
  period = 60

  # Statistic: The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum, etc.
  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html
  # Sum: The sum of the metric values for the specified period
  statistic = "Sum"

  # Threshold defines the value the metric has to be above to trigger the alarm                     
  # E.g. if the threshold is 1, the alarm will trigger if the metric is above 1
  threshold = 1

  # Actions: The actions to execute when this alarm transitions into an ALARM state from any other state.
  # E.g. if the alarm transitions to ALARM state, it will send a notification to the SNS topic
  alarm_actions = [var.sns_topic_cloudwatch]

  insufficient_data_actions = []
  ok_actions                = []

  # Dimensions is a map of key-value pairs to use for filtering the results of the metric query
  dimensions = {
    # BucketName is the name of the bucket to monitor
    BucketName = var.bucket_cloudwatch_alarm

    # FilterId is the name of the metric configuration to filter the results, configured in the aws_s3_bucket_metric resource
    FilterId = var.filter_id
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_delete_requests" {
  alarm_name          = var.alarm_s3_delete_request_name
  metric_name         = "DeleteRequests"
  namespace           = "AWS/S3"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  period              = 60
  statistic           = "Sum"
  threshold           = 1

  alarm_actions             = [var.sns_topic_cloudwatch]
  insufficient_data_actions = []
  ok_actions                = []

  dimensions = {
    BucketName = var.bucket_cloudwatch_alarm
    FilterId   = var.filter_id
  }
}

resource "aws_cloudwatch_log_metric_filter" "ec2_create" {
  name           = "EC2InstanceCreations"
  log_group_name = aws_cloudwatch_log_group.cloudtrail_log_group.id

  # The filter pattern is a valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events
  # $.eventName is a JSON selector that selects the value of the eventName field in the log event/
  # $: is the root of the log event
  # eventName: "RunInstances" is the key for the key-value pair we are looking for in the log event
  pattern = "{ $.eventName = \"RunInstances\" }"

  # Metric transformations are used to extract values from the log events and transform them into a CloudWatch metric
  metric_transformation {
    name      = "EC2InstanceCreations"
    namespace = "Custom/EC2"
    value     = "1" # The value to emit for the metric
  }
}

resource "aws_cloudwatch_log_metric_filter" "ec2_terminate" {
  name           = "EC2InstanceDeletions"
  log_group_name = aws_cloudwatch_log_group.cloudtrail_log_group.id
  pattern        = "{ $.eventName = \"TerminateInstances\" }"
  # Metric transformations are used to extract values from the log events and transform them into a CloudWatch metric
  metric_transformation {
    name      = "EC2InstanceDeletions"
    namespace = "Custom/EC2"
    value     = "1" # The value to emit for the metric
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_creation" {
  alarm_name          = var.alarm_ec2_create_name
  metric_name         = aws_cloudwatch_log_metric_filter.ec2_create.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.ec2_create.metric_transformation[0].namespace
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  period              = 60
  statistic           = "Sum"
  threshold           = 1

  alarm_actions             = [var.sns_topic_cloudwatch]
  insufficient_data_actions = []
  ok_actions                = []
}

resource "aws_cloudwatch_metric_alarm" "ec2_termination" {
  alarm_name          = var.alarm_ec2_terminate_name
  metric_name         = aws_cloudwatch_log_metric_filter.ec2_terminate.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.ec2_terminate.metric_transformation[0].namespace
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  period              = 60
  statistic           = "Sum"
  threshold           = 1

  alarm_actions             = [var.sns_topic_cloudwatch]
  insufficient_data_actions = []
  ok_actions                = []
}


resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization_alarm" {
  for_each            = var.instance_ids_map
  
  alarm_name          = "${var.alarm_ec2_cpu_utilization_name}-${each.value}-01"
  namespace           = "AWS/EC2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  
  # E.g. If...
  #   Evaluation period: 5
  #   Period: 60
  #   Threshold: 90
  #   In console, it'll show CPUUtilization >= 90 for 5 datapoints within 5 minutes
  # threshold           = 90
  # evaluation_periods  = 5
  # period              = 60

  # For testing purposes, the values are set low
  evaluation_periods  = 1
  period              = 1  
  threshold           = 60

  dimensions = {
    InstanceId = each.value
  }

  alarm_actions = [var.sns_topic_cloudwatch]
}

resource "aws_cloudwatch_log_group" "cloudtrail_log_group" {
  name              = var.log_group_name
  retention_in_days = 30
}

resource "aws_iam_role" "cloudtrail_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "cloudtrail_policy" {
  name = var.iam_role_policy_name
  role = aws_iam_role.cloudtrail_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "${aws_cloudwatch_log_group.cloudtrail_log_group.arn}:*"
      }
    ]
  })
}