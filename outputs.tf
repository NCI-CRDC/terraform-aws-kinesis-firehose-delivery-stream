output "arn" {
  value = aws_kinesis_firehose_delivery_stream.kinesis.arn
}

output "destination" {
  value = aws_kinesis_firehose_delivery_stream.kinesis.destination
}

output "id" {
  value = aws_kinesis_firehose_delivery_stream.kinesis.id
}

output "name" {
  value = aws_kinesis_firehose_delivery_stream.kinesis.name
}
  
output "version_id" {
  value = aws_kinesis_firehose_delivery_stream.kinesis.version_id
}
