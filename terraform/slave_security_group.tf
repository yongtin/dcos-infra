resource "aws_security_group" "slave" {
  name = "dcos-slave"
  description = "Mesos Slaves ${var.stack_name}"

  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "slave_egress_all" {
  security_group_id = "${aws_security_group.slave.id}"

  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "slave_ingress_slave" {
  security_group_id = "${aws_security_group.slave.id}"

  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  self = true
}

resource "aws_security_group_rule" "slave_ingress_master" {
  security_group_id = "${aws_security_group.slave.id}"

  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  source_security_group_id = "${aws_security_group.master.id}"
}

resource "aws_security_group_rule" "slave_ingress_public_slave" {
  security_group_id = "${aws_security_group.slave.id}"

  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  source_security_group_id = "${aws_security_group.public_slave.id}"
}
