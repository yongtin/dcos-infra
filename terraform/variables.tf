variable "aws_region" {
  description = "AWS Region to launch configuration in"
}

variable "vpc_id" {
  description = "vpc id for terraform to use"
}

variable "private_subnet_ids" {
  description = "private subnets for dcos (master/slaves)"
  type = "list"
}

variable "public_subnet_ids" {
  description = "public subnets for dcos (public slaves)"
  type = "list"
}

variable "iam_instance_profile" { # FIXME
  type = "map"
  default = {
    master_id = ""
    admin_id = ""
  }
}
###############################
### CONFIGURABLE PARAMETERS ###
###############################

variable "stack_name" {
  description = "DCOS stack name"
  default = "dcos"
}

variable "key_names" {
  description = "AWS key pair name for SSH access"
  type = "map"
  default = {
    us-east-1 = "us-east-1-dcos"
    eu-west-1 = "eu-west-1-dcos"
    us-west-1 = "us-west-1-dcos"
  }
}

variable "elb_version" {
  description = "Loadbalancer Version"
  default = "v1"
}

variable "slave_instance_count" {
  description = "Number of slave nodes to launch"
  default = 5
}

variable "public_slave_instance_count" {
  description = "Number of public slave nodes to launch"
  default = 2
}

variable "admin_locations" {
  description = "The IP range to whitelist for admin access. Must be a valid CIDR."
  type    = "list"
  default = ["10.0.0.0/16", "0.0.0.0/0"]
}


##################
### PARAMETERS ###
##################

variable "master_instance_type" {
  description = "Default instance type for masters"
  default = "m3.xlarge"
}

variable "slave_instance_type" {
  description = "Default instance type for slaves"
  default = "m3.xlarge"
}

variable "public_slave_instance_type" {
  description = "Default instance type for public slaves"
  default = "m3.xlarge"
}

variable "master_instance_count" {
  description = "Amount of requested Masters"
  default = 1
  #when override number of instances please use an other cluster_packages (see below)
}

variable "coreos_amis" {
  description = "AMI for CoreOS machine"
  default = {
    us-west-1       = "ami-ee57148e"
    ap-northeast-1  = ""
    ap-northeast-2  = ""
    us-gov-west-1   = ""
    us-west-2       = ""
    us-east-1       = "ami-6d138f7a"
    sa-east-1       = ""
    ap-southeast-2  = ""
    eu-west-1       = "ami-b7cba3c4"
    eu-central-1    = ""
    ap-southeast-1  = ""
  }
}

variable "authentication_enabled" {
  description = "authentication_enabled"
  default = true
}

variable "dcos_base_download_url" {
  description = "base url that is used to download the dcos"
  default = "https://downloads.dcos.io/dcos/stable"
}

