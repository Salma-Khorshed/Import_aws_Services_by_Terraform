resource "aws_vpc" "default-vpc-use1" {
  for_each = var.vpcs

  cidr_block           = each.value.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = each.key
    },
    var.tags
  )
}

resource "aws_nat_gateway" "this" {
  for_each = var.nat_gateways

  allocation_id = each.value.allocation_id
  subnet_id     = each.value.subnet_id

  tags = merge(
    {
      Name = each.key
    },
    var.tags
  )
}

resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id            = each.value.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    {
      Name = each.key
    },
    var.tags
  )
}

resource "aws_route_table" "this" {
  for_each = var.route_tables

  vpc_id = each.value.vpc_id

  tags = merge(
    {
      Name = each.key
    },
    var.tags
  )
}

resource "aws_route" "this" {
  for_each = var.routes

  route_table_id         = aws_route_table.this[each.value.route_table_key].id
  destination_cidr_block = each.value.destination_cidr_block
  gateway_id             = lookup(each.value, "gateway_id", null)
  nat_gateway_id         = lookup(each.value, "nat_gateway_id", null)
}

resource "aws_route_table_association" "this" {
  for_each = var.route_table_associations

  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.this[each.value.route_table_key].id
}

resource "aws_internet_gateway" "this" {
  for_each = var.internet_gateways

  vpc_id = each.value.vpc_id

  tags = merge(
    {
      Name = each.key
    },
    var.tags
  )
}

