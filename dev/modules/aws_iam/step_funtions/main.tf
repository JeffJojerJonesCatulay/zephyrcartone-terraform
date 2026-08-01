resource "aws_iam_role" "sfn_role" {
  name               = var.name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "states.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sfn_role_policy_attachment" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.sfn_role.name
  policy_arn = each.value
}