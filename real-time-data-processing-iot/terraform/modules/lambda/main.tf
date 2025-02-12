resource "aws_iam_role" "lambda_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_kinesis_policy" {
  name = var.policy_name
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:GetItem"
        ],
        Effect   = "Allow",
        Resource = "*" # TODO: restrict to the DynamoDB table
      },
      {
        Action = [
          "kinesis:GetRecords",
          "kinesis:GetShardIterator",
          "kinesis:DescribeStream",
          "kinesis:DescribeStreamSummary",
          "kinesis:ListShards",
          "kinesis:ListStreams"
        ],
        Effect = "Allow",
        # Resource = "arn:aws:kinesis:ap-southeast-2:481390061994:stream/kinesis-dev-apse2-iotdata-01"
        Resource = "*" #TODO: restrict to the Kinesis stream
      }
    ]
  })
}

resource "aws_lambda_function" "iot_lambda" {
  function_name = "iot-data-processor"
  runtime       = "python3.8"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "${path.module}/../../../src/lambda_function.zip"


  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
    }
  }
}

# Creates a mapping between an event source and an AWS Lambda function. Lambda reads items from the event source and triggers the function.
resource "aws_lambda_event_source_mapping" "kinesis_trigger" {
  event_source_arn = var.kinesis_stream_arn
  function_name    = aws_lambda_function.iot_lambda.arn

  # Starting position is the position in the stream where the Lambda function should start reading  
  starting_position = "LATEST"
}


