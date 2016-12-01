resource "aws_subnet" "dcos-public-subnet" {
  count = "${length(lookup(var.aws_availability_zones, var.aws_region))}"
  vpc_id = "${var.vpc_id}"
  cidr_block = "${lookup(var.aws_subnets_public_ip_ranges, var.aws_availability_zones[count.index - 1])}"

  tags {
    Application = "${var.stack_name}"
    Network = "Public"
  }
}
