variable "repository_name" {
  description = "Name of the repository that is point of module"
  type        = string
}
variable "repository_description" {
  description = "Description that will be visible on board of projects inside GitHub"
  type        = string
}

variable "repository_private" {
  description = "Set repository visible outside of organization. (Default: true)"
  type        = bool
  default     = true
}

variable "archived" {
  description = "Set to true to archive repository. (Default: false)"
  type        = bool
  default     = false
}

variable "pull_teams" {
  description = "Teams ids that will have read-only access to the repository."
  type        = list(string)
  default     = []
}
variable "push_teams" {
  description = "Teams ids that will have read-write access to the repository."
  type        = list(string)
  default     = []
}
variable "admin_teams" {
  description = "Teams ids that will have admin access over the repository."
  type        = list(string)
  default     = []
}
variable "is_template" {
  description = "If set to true then repository can be used as a template for other repositories"
  type        = bool
  default     = false
}
variable "template" {
  description = "If passed, then repository will be created from the template."
  type = object({
    owner      = string
    repository = string
  })
  default = null
}
variable "allow_rebase" {
  description = "Allow developers to modify history of commits."
  type        = bool
  default     = false
}

variable "license_template" {
  description = "License template eg: \"mit\", \"mpl-2.0\"."
  type        = string
  default     = null
}

variable "has_issues" {
  description = "Enables GitHub Issues feature"
  type        = bool
  default     = false
}
variable "has_projects" {
  description = "Enables GitHub Projects feature"
  type        = bool
  default     = false
}
variable "has_wiki" {
  description = "Enables GitHub Wiki feature"
  type        = bool
  default     = false
}
