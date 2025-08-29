# S3 Backend Configuration (for reference - these cannot be used in backend config)
# You'll need to set these values directly in the backend block in providers.tf
# variable "terraform_state_bucket" {
#   description = "S3 bucket name for Terraform state storage"
#   type        = string
# }
#
# variable "terraform_state_region" {
#   description = "AWS region for S3 bucket"
#   type        = string
#   default     = "ap-southeast-1"
# }

# Basic OCI Configuration
variable "tenancy_id" {
  description = "OCI Tenancy OCID"
  type        = string
}

variable "user_id" {
  description = "OCI User OCID"
  type        = string
}

variable "api_fingerprint" {
  default     = null
  description = "Fingerprint of the API private key to use with OCI API."
  type        = string
}

variable "api_private_key" {
  default     = null
  description = "The contents of the private key file to use with OCI API, optionally base64-encoded. This takes precedence over private_key_path if both are specified in the provider."
  sensitive   = true
  type        = string
}

variable "region" {
  description = "OCI Region"
  type        = string
  default     = "ap-singapore-1"
}

variable "compartment_id" {
  description = "OCI Compartment OCID where NSG resides"
  type        = string
}

# NSG Configuration
variable "nsg_id" {
  description = "Manual NSG ID to update"
  type        = string
}

# Resource prefix variable removed - uniqueness handled by S3 backend state isolation

variable "ingress_cidr" {
  description = "Map of CIDR blocks to allow ingress with descriptive names"
  type        = string
}

variable "egress_cidrs" {
  description = "Map of CIDR blocks to allow egress with descriptive names"
  type        = map(string)
  default     = {}
}

variable "ingress_port" {
  description = "Port to allow for ingress rules"
  type        = number
  default     = 6443
}

variable "egress_port" {
  description = "Port to allow for egress rules"
  type        = number
  default     = 443
}

variable "protocol" {
  description = "Protocol for security rules (6 = TCP, 17 = UDP, 1 = ICMP)"
  type        = string
  default     = "6"
}
