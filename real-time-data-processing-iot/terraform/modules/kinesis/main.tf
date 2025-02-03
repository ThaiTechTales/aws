resource "aws_kinesis_stream" "iot_stream" {
  name        = "iot-data-stream"
  shard_count = 1
}
