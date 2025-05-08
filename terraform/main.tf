
module "docker" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "docker"

  instance_type          = "t3.medium"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id] 
  subnet_id = "subnet-0e44ff59d27c4ce5d" #replace your Subnet
  ami = data.aws_ami.ami_info.id 
  key_name = aws_key_pair.tools.key_name
  user_data = file("docker.sh")
  tags = {
    Name = var.common-tags
  }
}

# Key Creation
resource "aws_key_pair" "tools" {
  key_name   = "tools"
  # you can paste the public key directly like this
  #public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL6ONJth+DzeXbU3oGATxjVmoRjPepdl7sBuPzzQT2Nc sivak@BOOK-I6CR3LQ85Q"
  public_key = file("~/devops/.ssh/nexus-key.pub")
  # ~ means windows home directory
}

# Security Group
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"
 
    #terraform block
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    # ingress {
    #     from_port        = 8080
    #     to_port          = 8080
    #     protocol         = "tcp"
    #     cidr_blocks      = ["0.0.0.0/0"]
    # }
    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "ChanduPriyaP"
    }
}



