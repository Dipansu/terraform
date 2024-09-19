data "aws_s3_bucket" "selected" {
  #depends_on = [module.s3creation]
  bucket     = "my-tf-test-bucket-test-mybucketnew-10010012213"

}

resource "aws_iam_user" "lb" {
  name = "testuser"
  path = "/system/"

  tags = {
    tag-key = "terraform"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}
data "aws_iam_policy_document" "iam_ro" {
  #depends_on = [module.s3creation]
  statement {
    effect  = "Allow"
    actions = ["s3:*"]
    #resources = [data.aws_s3_bucket.example.arn]
    #resources = [data.aws_s3_bucket.selected.arn]
    #resources = "${aws_s3_bucket.example.arn}"
    #resources = [module.s3creation.s3_arn]
    resources = [var.resource_module]
  }
}

resource "aws_iam_user_policy" "iam_ro" {
  name   = "testpolicy"
  user   = aws_iam_user.lb.name
  policy = data.aws_iam_policy_document.iam_ro.json
}