resource "aws_glue_catalog_database" "iot_db" {
  name = "iot_glue_db"
}

resource "aws_glue_crawler" "dynamodb_to_redshift" {
  name          = var.crawler_name
  database_name = aws_glue_catalog_database.iot_db.name
  role          = aws_iam_role.glue_role.arn

  dynamodb_target {
    path = var.dynamodb_table_name
  }
}

resource "aws_iam_role" "glue_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "glue.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "glue_policy" {
  name = var.policy_name
  role = aws_iam_role.glue_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:ListTables",
          "dynamodb:DescribeTable",
          "dynamodb:Scan",
          "dynamodb:Query"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "glue:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
