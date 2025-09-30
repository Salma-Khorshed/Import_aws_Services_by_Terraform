variable "vpcs" {
  description = "Map of VPCs to create or import"
  type = map(object({
    cidr = string
  }))
}

variable "tags" {
  description = "Common tags for all VPCs"
  type        = map(string)
  default     = {}
}

variable "nat_gateways" {
  description = "Map of NAT Gateways to manage"
  type = map(object({
    allocation_id = string
    subnet_id     = string
  }))
  default = {}
}

variable "subnets" {
  description = "Map of subnets to manage"
  type = map(object({
    vpc_id            = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "route_tables" {
  description = "Map of route tables to manage"
  type = map(object({
    vpc_id = string
  }))
  default = {}
}

variable "routes" {
  description = "Map of routes to manage"
  type = map(object({
    route_table_key        = string
    destination_cidr_block = string
    gateway_id             = optional(string)
    nat_gateway_id         = optional(string)
  }))
  default = {}
}

variable "route_table_associations" {
  description = "Map of route table associations"
  type = map(object({
    route_table_key = string
    subnet_id       = string
  }))
  default = {}
}

variable "internet_gateways" {
  description = "Map of Internet Gateways to manage"
  type = map(object({
    vpc_id = string
  }))
  default = {}
}