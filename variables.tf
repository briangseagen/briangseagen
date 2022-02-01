variable "department" {
  type = string
}

variable "business_owner" {
  type = string
}

variable "ptso" {
  type = string
}

variable "default_region" {
  description = "Default Region"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "app_name" {
  description = "App Name"
  type        = string
  default     = "queuetrigger"
}

// Local debugging - this will be removed and moved to TF Cloud variable
variable "gh_token" {
  description = "GitHub token for auth"
  type        = string
  default     = "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"
}

variable "service_plan" {
  description = "plan to use - should use Consumption for development"
  type        = string
  default     = "api-appserviceplan-consumption"
}

variable "storage_account_name" {
  description = "Storage disk name, has to be only letters and between 3 and 24 chars"
  type        = string
  default     = "bgfuncdisk"
}

variable "ARM_THREEPOINTZERO_BETA_RESOURCES" {
  description = "To use beta features of Azurerm"
  type        = bool
  default     = true
}

resource "random_string" "random" {
  length  = 4
  upper   = false
  lower   = true
  number  = true
  special = false
}

