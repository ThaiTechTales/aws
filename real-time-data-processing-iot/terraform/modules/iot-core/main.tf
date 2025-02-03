resource "aws_iam_role" "iot_role" {
  name = "iot-role"
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

resource "aws_iot_topic_rule" "iot_to_kinesis" {
  name        = "iot_to_kinesis_rule"
  enabled     = true
  sql         = "SELECT * FROM 'iot/sensors'"
  sql_version = "2016-03-23"

  kinesis {
    stream_name = var.kinesis_stream_name
    role_arn    = aws_iam_role.iot_role.arn
  }
}

