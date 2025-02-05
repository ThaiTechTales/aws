resource "aws_iam_role" "iot_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "iot.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "iot_kinesis_policy" {
  name = var.policy_name
  role = aws_iam_role.iot_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "kinesis:PutRecord",
          "kinesis:PutRecords"
        ],
        Effect   = "Allow",
        Resource = "*" #TODO: restrict to the Kinesis stream
      }
    ]
  })
}

# Topic Rule to forward messages from IoT Core to Kinesis
resource "aws_iot_topic_rule" "iot_to_kinesis" {
  name    = var.policy_name
  enabled = true

  # sql is used to select the messages to forward
  sql         = "SELECT * FROM 'iot/sensors'"
  sql_version = "2016-03-23"

  kinesis {
    stream_name = var.kinesis_stream_name
    role_arn    = aws_iam_role.iot_role.arn
  }
}

