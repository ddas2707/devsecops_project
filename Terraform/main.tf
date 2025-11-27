locals {
  instance_names = [
    "jenkins-server",
    "monitoring-server",
    "kubernetes-master-node",
    "kubernetes-worker-node"
  ]
}

resource "aws_instance" "ec2" {
  count                = var.ec2-instance-count
  ami                  = data.aws_ami.ubuntu.id
  subnet_id            = aws_subnet.public-subnet[count.index].id
  instance_type        = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.iam-instance-profile.name
  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }

  tags = {
    Name = "${local.org}-${local.project}-${local.env}-${local.instance_names[count.index]}"
    Env  = "${local.env}"
  }
}



/*
ec2_instance_type = {
  jenkins-server          = "t3a.large"
  monitoring-server       = "t3a.medium"
  kubernetes-master-node  = "t3a.medium"
  kubernetes-worker-node  = "t3a.medium"
}

variable "ec2_instance_type" {
  type = map(string)
}

resource "aws_instance" "ec2" {
  for_each = var.ec2_instance_type

  ami                  = data.aws_ami.ubuntu.id
  instance_type        = each.value
  subnet_id            = aws_subnet.public-subnet[0].id
  iam_instance_profile = aws_iam_instance_profile.iam-instance-profile.name

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }

  tags = {
    Name = "${local.org}-${local.project}-${local.env}-${each.key}"
    Env  = local.env
  }
}
*/
