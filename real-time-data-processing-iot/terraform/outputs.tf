output "iot_topic_rule_arn" {
  value = module.iot_core.iot_topic_rule_arn
}

output "kinesis_stream_arn" {
  value = module.kinesis.kinesis_stream_arn
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}
