module "iot_core" {
  source              = "./modules/iot-core"
  kinesis_stream_name = module.kinesis.kinesis_stream_name
}

module "kinesis" {
  source = "./modules/kinesis"
}

module "lambda" {
  source              = "./modules/lambda"
  kinesis_stream_arn  = module.kinesis.kinesis_stream_arn
  dynamodb_table_name = module.dynamodb.table_name
}

module "dynamodb" {
  source              = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
}

module "glue" {
  source              = "./modules/glue"
  dynamodb_table_name = module.dynamodb.table_name
}

module "redshift" {
  source = "./modules/redshift"
}
