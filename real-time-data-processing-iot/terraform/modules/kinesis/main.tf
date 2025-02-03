resource "aws_kinesis_stream" "iot_stream" {
  name        = var.kinesis_stream_name
  shard_count = 1
}
