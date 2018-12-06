variable "prefix" {
  type        = "string"
  description = "Prefix to use for buckets, roles, policies, etc.."
}

variable "kms-key-arn" {
    type = "string"
    description = "KMS Key arn to use for build artifact encryption"
}