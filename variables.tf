########################################
# General Vars
########################################

variable "external_id" {
  default     = ""
  description = "External ID associated with the IAM role to be assumed, if applicable"
  type        = string
}

variable "master_account" {
  description = "Master account that holds cross-account roles"
  type        = string
}

variable "max_session_duration" {
  default     = 7200
  description = "STS token max lifetime"
  type        = number
}

variable "role_prefix" {
  default     = ""
  description = "Optional prefix for IAM role names"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply across all roles"
  type        = map(string)
}

########################################
# IAM Role Configuration
########################################
variable "create_security_analyst_role" {
  default     = true
  description = "Create role with SecurityAudit managed policy attached"
  type        = bool
}

variable "create_standard_admin_role" {
  default     = true
  description = "Create StandardAdmin role"
  type        = bool
}

variable "standard_admin_role_name" {
  default     = "StandardAdmin"
  description = "Standard Admin role name"
  type        = string
}

variable "standard_admin_attach_poweruser" {
  default     = true
  description = "Attach AWS managed policy PowerUser to Standard Admin role"
  type        = bool
}

variable "standard_admin_additional_policies" {
  default     = []
  description = "List of additional policy ARNs to attach to standard admin role"
  type        = list(string)
}
