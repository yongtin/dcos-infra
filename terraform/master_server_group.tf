resource "aws_autoscaling_group" "master_server_group" {
  name = "dcos-masters-asg"

  min_size = "${var.master_instance_count}"
  max_size = "${var.master_instance_count}"
  desired_capacity = "${var.master_instance_count}"

  load_balancers = ["${aws_elb.internal_master.id}"]

  vpc_zone_identifier = ["${var.private_subnet_ids}"] 
  launch_configuration = "${aws_launch_configuration.master.id}"

  tag {
    key = "role"
    value = "mesos-master"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = false
  }
}
