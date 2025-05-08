# RHEL AMI
data "aws_ami" "ami_info" {

    most_recent = true
    owners = ["973714476881"]

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

#973714476881 RHEL owner ID
#nexus AMI


#SolveDevOps-Nexus-Server-Ubuntu24.04-20250222-c47319d0-7c5dedd5-58ec-4c82-b20e-fb1f805a0304
#679593333241
# ami-0b0cb2e7c3da18418   nexus AMI