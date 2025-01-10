resource "aws_iam_role" "lambda_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = var.policy_name
  description = "Policy to allow Lambda access to SQS, SNS, and S3"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject", "s3:GetObject", "s3:ListBucket"],
        Resource = ["arn:aws:s3:::${var.s3_bucket_name}/*", 
                    "arn:aws:s3:::${var.s3_bucket_name}"] 
      },
      {
        Effect   = "Allow",
        Action   = ["sns:Publish"],
        Resource = var.email_topic_arn
      },
      {
        Effect   = "Allow",
        Action   = ["sqs:ReceiveMessage", "sqs:DeleteMessage", "sqs:GetQueueAttributes"],
        Resource = var.sqs_queue_arn
      },
      {
        Effect   = "Allow",
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = 30 # Seconds before the function times out
  
  filename         = data.archive_file.lambda_code.output_path
  source_code_hash = data.archive_file.lambda_code.output_base64sha256

  environment {
    variables = {
      S3_BUCKET   = var.s3_bucket_name
      EMAIL_TOPIC = var.email_topic_arn
    }
  }

  depends_on = [
      aws_iam_role_policy_attachment.attach_lambda_policy]
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/src/lambda_function.zip"
}

# Zip the Lambda function code only if the source code has changed
resource "null_resource" "package_lambda" {
  triggers = {
    source_hash = filesha256("${path.module}/src/lambda_function.py")
  }

  # Provisioner: Allows to run a command on the local machine
  provisioner "local-exec" {
    command = "zip -j ${path.module}/src/lambda_function.zip ${path.module}/src/*"
  }
}

# Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.retention_in_days  
}