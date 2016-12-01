resource "aws_launch_configuration" "slave" {
  security_groups = ["${aws_security_group.slave.id}"]
  image_id = "${lookup(var.coreos_amis, var.aws_region)}"
  instance_type = "${var.slave_instance_type}"
  key_name = "${lookup(var.key_names, var.aws_region)}"
  user_data = "${data.template_file.slave_user_data.rendered}"
  associate_public_ip_address = false

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "slave_user_data" {
  template = "${file("${path.module}/slave_user_data.yml")}"

  vars {
    dcos_bootstrap_url                   = "${var.dcos_bootstrap_url}"
    dcos_configuration_init_url          = "${var.dcos_configuration_init_url}"
    dcos_base_download_url               = "${var.dcos_base_download_url}"
    dcos_master_registry_image           = "${var.dcos_master_registry_image}"
  }
}
