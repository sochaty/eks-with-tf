resource "aws_iam_role" "cluster_iam_role" {
  name = "${var.iam_role.role_name}"

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

resource "aws_iam_role_policy_attachment" "eks_iam_policy" {
    count = length(var.iam_role.policy_list)
    
    policy_arn = var.iam_role.policy_list[count.index]    
    role       = aws_iam_role.cluster_iam_role.name
}