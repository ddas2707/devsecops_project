data "aws_ami" "ubuntu" {
  /*
This tells Terraform:
“Go to AWS and fetch information about an AMI.
I’m naming this data source as ubuntu.”
This is NOT creating any resource.
It is only reading/fetching data.
*/
  most_recent = true # Fetch the most recent AMI matching the filters

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-noble-24.04-amd64-server-*",
      "ubuntu/images/hvm/ubuntu-noble-24.04-amd64-server-*",
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-*",
      "ubuntu/images/hvm-ebs-gp3/ubuntu-noble-24.04-amd64-server-*"
    ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  /*HVM = Hardware Virtual Machine
It is a modern virtualization type used by AWS EC2.
Think of HVM as:
“EC2 instance that runs directly on the hardware with full virtualization.*/

  owners = ["099720109477"] # Canonical's AWS account ID - no. who maintains Ubuntu AMIs
}



