resource "aws_autoscaling_group" "slave_server_group" {
  name = "dcos-slaves"

  min_size = "${var.slave_instance_count}"
  max_size = "${var.slave_instance_count}"
  desired_capacity = "${var.slave_instance_count}"

  vpc_zone_identifier = ["${var.private_subnet_ids}"]
  launch_configuration = "${aws_launch_configuration.slave.id}"

  tag {
    key = "role"
    value = "mesos-slave"
    propagate_at_launch = true
  }
}
