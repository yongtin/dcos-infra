resource "aws_security_group" "admin" {
  name = "dcos-admin"
  description = "Enable admin access to servers ${var.stack_name}"

  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "admin_ingress_all" {
  security_group_id = "${aws_security_group.admin.id}"

  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  cidr_blocks = ["${var.admin_locations}"]
}

resource "aws_security_group_rule" "admin_egress_all" {
  security_group_id = "${aws_security_group.admin.id}"

  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
