resource "aws_security_group" "this" {
  for_each = var.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id

  tags = merge(
    {
      Name = each.value.name
    },
    var.tags
  )
}
