resource "aws_iam_user" "user" {
  for_each = toset(var.user_names)
  # note: each.key and each.value are the same for a set
  name                    = "${each.value}"
  force_destroy           = true
 }


resource "aws_iam_role" "role" {
  name = "${var.environment}-ec2-role"
  description = "${var.environment}-ec2-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_group" "group" {
  name = "${var.environment}-group"
}


resource "aws_iam_policy" "policy" {
  name        = "${var.environment}-policy"
  description = "${var.environment}-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_iam_policy_attachment" "test-attach" {
  
  name       = "${var.environment}-attach"
  users      = aws_iam_user.user.name
  roles      = aws_iam_role.role.name
  groups     = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}