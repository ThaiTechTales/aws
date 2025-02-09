module "iot_core" {
  source              = "./modules/iot-core"
  kinesis_stream_name = module.kinesis.kinesis_stream_name
  role_name           = var.iot_role_name
  policy_name         = var.iot_policy_name
}

module "kinesis" {
  source              = "./modules/kinesis"
  kinesis_stream_name = var.kinesis_stream_name
}

module "lambda" {
  source              = "./modules/lambda"
  kinesis_stream_arn  = module.kinesis.kinesis_stream_arn
  dynamodb_table_name = module.dynamodb.table_name
  role_name           = var.lambda_role_name
  policy_name         = var.lambda_policy_name
}

module "dynamodb" {
  source              = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
}

module "glue" {
  source              = "./modules/glue"
  dynamodb_table_name = module.dynamodb.table_name
  role_name           = var.glue_role_name
  policy_name         = var.glue_policy_name
  crawler_name        = var.glue_crawler_name
}

module "redshift" {
  source                = "./modules/redshift"
  redshift_cluster_name = var.redshift_cluster_name
}
