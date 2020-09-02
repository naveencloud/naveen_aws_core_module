# Below is the resource to create AutoScaling group using CloudFormation which will allow to do Blue/Green deployment

resource "aws_cloudformation_stack" "core_asg_cfn_bg" {
  disable_rollback = "true"
  name = var.cf_stack_name
  template_body = data.template_file.core_asg_cfn.rendered
}