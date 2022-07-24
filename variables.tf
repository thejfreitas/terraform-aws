# In my local environment I am using a .tfvars file to store my AWS profile by setting:
# AWS_PROFILE = "aws-profile"
variable "AWS_PROFILE" {
  type        = string
  default     = "your-aws-profile"
  description = "Profile to use for AWS API calls"
}

variable "AWS_DEFAULT_REGION" {
  type        = string
  default     = "us-east-1"
  description = "DEfault region to use for AWS API calls"
}
