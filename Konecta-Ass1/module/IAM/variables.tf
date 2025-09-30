variable "iam_users" {
  description = "Set of IAM users to manage"
  type        = set(string)
}

variable "tags" {
  description = "Tags to apply to IAM users"
  type        = map(string)
  default     = {}
}

variable "iam_groups" {
  description = "Map of IAM groups to manage"
  type = map(object({
    path = optional(string)
  }))
  default = {}
}