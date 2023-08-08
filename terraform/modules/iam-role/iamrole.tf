resource "aws_iam_role" "cluster_iam_role" {
  for_each = { for role in var.cluster_roles : role.role_name => role }
  name     = each.value.role_name

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role" "nodegroup_iam_role" {
  for_each = { for role in var.nodegroup_roles : role.role_name => role }
  name     = each.value.role_name

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "cluster_iam_policy" {
  for_each = { for p in local.cluster_policies : "${p.role_name}-${p.policy_arn}" => p }

  policy_arn = each.value.policy_arn
  role       = each.value.role_name
  depends_on = [aws_iam_role.cluster_iam_role]
}

resource "aws_iam_role_policy_attachment" "nodegroup_iam_policy" {
  for_each = { for p in local.nodegroup_policies : "${p.role_name}-${p.policy_arn}" => p }

  policy_arn = each.value.policy_arn
  role       = each.value.role_name
  depends_on = [aws_iam_role.nodegroup_iam_role]
}