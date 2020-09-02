# VPC Flow log IAM Role and Policy to Publish log to Cloudwatch

resource "aws_iam_role" "vpcflowlog_iamrole" {
  assume_role_policy = templatefile("${path.module}/files/iamassumerolepolicy.json", {})
  name               = "${var.vpc_name}-flowlog-iamrole"
}


resource "aws_iam_role_policy" "ecs_taskexecution_iamrolepolicy" {
  name = "${var.vpc_name}-flowlog-iamrole-policy"
  role = aws_iam_role.vpcflowlog_iamrole.id
  policy = templatefile("${path.module}/files/iamrolepolicy.json", {})
}
