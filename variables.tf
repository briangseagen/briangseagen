variable "department" {
  type    = string
  default = "Eng"
}

variable "business_owner" {
  type    = string
  default = "BrianG"
}

variable "ptso" {
  type    = string
  default = "ptso"
}

variable "default_region" {
  description = "Default Region"
  type        = string
  default     = "WestUS2"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "app_name" {
  description = "App Name"
  type        = string
  default     = "HttpExample"
}

// Local debugging - this will be removed and moved to TF Cloud variable
variable "gh_token" {
  description = "GitHub token for auth"
  type        = string
}

variable "service_plan" {
  description = "plan to use - should use Consumption for development"
  type        = string
  default     = "api-appserviceplan-consumption"
}

variable "storage_account_name" {
  description = "Storage disk name, has to be only letters and between 3 and 24 chars"
  type        = string
  default     = "bgstorage"
}

variable "ARM_THREEPOINTZERO_BETA_RESOURCES" {
  description = "To use beta features of Azurerm"
  type        = bool
  default     = true
}
