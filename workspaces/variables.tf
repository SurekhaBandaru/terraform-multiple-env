#file can be anything.tf
variable "ami_id" {
  type        = string
  default = "ami-09c813fb71547fc4f"
  description = "AMI ID of Redhat 9"
}

variable "instance_type" {
 default = { # as we are working on worspaces we have given in the following way, if workspace is dev, terraform pick ups dev related variable
  dev="t3.micro",
  prod="t3.small"
 }
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name  = "Roboshop",
    Purpose = "EC2 instance name"
    
  }
}

variable "instances" {
default = ["mongodb", "redis"]
}

variable "sg_name" {
  type = string
  default = "allow-all"
  description = "Security group name"
  
}

variable "sg_description" {
  type = string
  default = "Allow all in and out traffic"
  description = "Description of security group"
  
}

variable "from_port" {
  type = number
  default = 0
  description = "From port value"
}

variable "to_port" {
  type = number
  default = 0
  description = "To port value"
}

variable "protocol" {
  type = string
  default = "-1"
  description = "protocol info"
  
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  type = list(string)
  default = ["::/0"]
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name = "allow_all"
  }
}

variable "zone_id" {
  default = "Z04486643GN3RHKI6IXZK"
}

variable "domain_name" {
  default = "devopspract.site"
}

variable "common_tags" {
  default = {
    Project = "Roboshop"
    Terraform = true
  }

  }

variable "project" {
    default = "roboshop"
  }