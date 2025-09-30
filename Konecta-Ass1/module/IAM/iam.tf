resource "aws_iam_user" "this" {
  for_each = toset(var.iam_users)

  name = each.key

  tags = var.tags
}

resource "aws_iam_group" "this" {
  for_each = var.iam_groups

  name = each.key
  path = lookup(each.value, "path", "/")

}