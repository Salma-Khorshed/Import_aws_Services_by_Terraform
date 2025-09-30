variable "security_groups" {
  description = "Map of security groups to manage"
  type = map(object({
    name        = string
    description = string
    vpc_id      = string
  }))
}

variable "tags" {
  description = "Tags to apply to security groups"
  type        = map(string)
  default     = {}
}
