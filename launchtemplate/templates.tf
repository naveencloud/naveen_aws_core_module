data "template_file" "asgsignal_lt_userdata" {
  template = file("${path.module}/files/userdata_asgsignal.sh")

  vars {
    cf_StackName      = var.cf_StackName
    region            = var.region
	cf_resource_id    = var.cf_resource_id
  }
}
