
resource "aws_instance" "roboshop" {
    count = length(var.instances)
    ami             = var.ami_id #ami_id in variable.tf
    instance_type   = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    
    tags =  merge(var.common_tags,

    
    {

    Name = "${var.project}-${var.instances[count.index]}-${var.environment}",
    Component = var.instances[count.index]
    Environment = var.environment
    })

}

resource "aws_security_group" "allow_all" {
    name        =  "${var.project}-${var.sg_name}-${var.environment}" #"allow-all-dev"
    description =  var.sg_description

    ingress {
        from_port=var.from_port
        to_port=var.to_port
        protocol=var.protocol
        cidr_blocks=var.cidr_blocks
        ipv6_cidr_blocks=var.ipv6_cidr_blocks

    }
    egress {
        from_port=var.from_port
        to_port=var.to_port
        protocol=var.protocol
        cidr_blocks=var.cidr_blocks
        ipv6_cidr_blocks=var.ipv6_cidr_blocks

    }

    tags= merge(
        var.common_tags,
        {
            Name = "${var.sg_name}-${var.environment}"
        }
    )
}