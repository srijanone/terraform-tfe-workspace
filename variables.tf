variable "name" {
  type        = string
  description = "(Required) Name of the workspace."
}

variable "organization" {
  type        = string
  description = "(Required) Name of the organization"
}
variable "oauth_token_id" {
  type        = string
  description = "Oauth token for VCS"
  default     = null
}

variable "auto_apply" {
  type        = bool
  description = "(Optional) Whether to automatically apply changes when a Terraform plan is successful. Defaults to false."
  default     = false
}

variable "file_triggers_enabled" {
  type        = bool
  description = "(Optional) Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. Defaults to true"
  default     = true
}

variable "operations" {
  type        = bool
  description = "(Optional) Whether to use remote execution mode. When set to false, the workspace will be used for state storage only. Defaults to true"
  default     = true
}

variable "queue_all_runs" {
  type        = bool
  description = "(Optional) Whether all runs should be queued. When set to false, runs triggered by a VCS change will not be queued until at least one run is manually queued. Defaults to true."
  default     = true
}

variable "ssh_key_id" {
  type        = string
  description = "(Optional) The ID of an SSH key to assign to the workspace."
  default     = null
}

variable "terraform_version" {
  type        = string
  description = "(Optional) The version of Terraform to use for this workspace. Defaults to the latest available version."
  default     = "0.12.29"
}

variable "trigger_prefixes" {
  type        = list
  description = "(Optional) List of repository-root-relative paths which describe all locations to be tracked for changes."
  default = [

  ]
}

variable "working_directory" {
  type        = string
  description = "(Optional) A relative path that Terraform will execute within. Defaults to the root of your repository."
  default     = null
}

variable "vcs_repo" {
  type        = map
  description = ""
  default = {

  }
}

########################### Variables ###########################

variable "variables" {
  type        = map(map(string))
  description = "Map of environment or Terraform variables to define in the workspace."
  default = {
  }
}
