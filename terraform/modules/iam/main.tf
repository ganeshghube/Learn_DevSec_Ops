resource "aws_iam_user" "user" {
 count = "${length(var.user_names)}"
 name = "${element(var.user_names, count.index)}"
}

resource "aws_iam_access_key" "newemp" {
  count = length(var.user_names)
  user = element(var.user_names,count.index)
}

 resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = false
  allow_users_to_change_password = true
}


resource "aws_iam_user_policy" "newemp_policy" {
  count = length(var.user_names)
  name = "${var.environment}-ec2"
  user = element(var.user_names,count.index)
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