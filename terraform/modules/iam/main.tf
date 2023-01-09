resource "aws_iam_user" "user" {
 count = "${length(var.user_names)}"
 name = "${element(var.user_names, count.index)}"
}

