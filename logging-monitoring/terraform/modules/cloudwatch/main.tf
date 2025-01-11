# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference
resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = var.alarm_name
  metric_name         = var.metric_name
  namespace           = "AWS/S3"

  comparison_operator = "GreaterThanThreshold"
  
  # Evaluation Periods: Checks if the metric exceeds the threshold for three consecutive 60-second periods.
  #   ensures that the metric consistently meets the threshold condition over a specified number of periods before triggering the alarm.
  evaluation_periods  = 1
  
  # Period: Time in seconds to evaluate the metric
  # E.g. if the period is 60, the alarm will evaluate the metric every 60 seconds
  period              = 30
  
  # Statistic: The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum
  # Sum: The sum of the metric values for the specified period
  statistic           = "Sum"         
  
  # Threshold defines the value the metric has to be above to trigger the alarm                     
  # E.g. if the threshold is 1, the alarm will trigger if the metric is above 1
  threshold           = 1

  # Actions: The actions to execute when this alarm transitions into an ALARM state from any other state.
  # E.g. if the alarm transitions to ALARM state, it will send a notification to the SNS topic
  alarm_actions = [ ]
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
  name   = var.iam_role_policy_name
  role   = aws_iam_role.cloudtrail_role.id

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