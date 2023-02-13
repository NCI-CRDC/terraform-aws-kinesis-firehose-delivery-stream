variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "buffer_interval" {
  type        = number
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination"
  default     = 60
}

variable "buffer_size" {
  type        = number
  description = "Buffer incoming data to the specified size, in MBs, before delivering it to the destination"
  default     = 1
}

variable "content_encoding" {
  type        = string
  description = "Kinesis Data Firehose uses the content encoding to compress the body of a request before sending the request to the destination - valid values are NONE and GZIP"
  default     = "GZIP"
}

variable "destination" {
  type        = string
  description = "the destination to where the data is delivered. The only options are 'extended_s3', 'redshift', 'elasticsearch', and 'http_endpoint'"
  default     = "http_endpoint"
}

variable "http_endpoint_access_key" {
  type        = string
  description = "The access key required for Kinesis Firehose to authenticate with the HTTP endpoint selected as the destination"
  sensitive   = true
}

variable "http_endpoint_name" {
  type        = string
  description = "The HTTP endpoint name"
  default     = "New Relic"
}

variable "http_endpoint_url" {
  type        = string
  description = "The HTTP endpoint URL to which Kinesis Firehose sends your data"
  default     = "https://aws-api.newrelic.com/cloudwatch-metrics/v1"
}

variable "resource_suffix" {
  type        = string
  description = "a suffix to append to the resource name after the stack name"
}

variable "role_arn" {
  type        = string
  description = "The arn of the role for cloudwatch metric stream to assume"
}

variable "s3_backup_mode" {
  type        = string
  description = "Defines how documents should be delivered to Amazon S3. Valid values are 'FailedDataOnly' and 'AllData'"
  default     = "FailedDataOnly"
}

variable "s3_bucket_arn" {
  type        = string
  description = "The arn of the S3 bucket where failed message deliveries to New Relic are delivered"
}

variable "s3_compression_format" {
  type        = string
  description = "File compression format - values are 'GZIP', 'ZIP', 'Snappy', & 'HADOOP_SNAPPY'"
  default     = "UNCOMPRESSED"
}

variable "s3_error_output_prefix" {
  type        = string
  description = "Prefix added to failed records before writing them to S3 - immediately follows bucket name"
  default     = null
}

variable "s3_object_prefix" {
  type        = string
  description = "The 'YYYY/MM/DD/HH' time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix"
  default     = null
}