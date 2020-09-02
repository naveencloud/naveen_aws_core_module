# TASK Execution IAM Role and Policy used by ECS Agent or Fargate to pull Image from ECR and Publish log to Cloudwatch

resource "aws_iam_role" "ec2instance_iamrole" {
  assume_role_policy = templatefile("${path.module}/files/iamassumerolepolicy.json", {})
  name               = "${var.ec2_name}-iamrole"
}


resource "aws_iam_role_policy" "ec2instance_iamrolepolicy" {
  name = "${var.ec2_name}-iamrole-policy"
  role = aws_iam_role.ec2instance_iamrole.id
  policy = templatefile("${path.module}/files/iamrolepolicy.json", {})
}
