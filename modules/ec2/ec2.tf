# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {

  tags    = {
    Name  = "default vpc"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


# create default subnet if one does not exit
resource "aws_default_subnet" "default_az1" {
  availability_zone =  data.aws_availability_zones.available_zones.names[0]
  tags   = {
    Name = "default subnet"
  }
}

# create security group for the ec2 instance
resource "aws_security_group" "ec2_security_group" {
  name        = "ec2 security group"
  description = "allow access on ports 80 and 22"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      =  ["0.0.0.0/0"]

  }

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "jenkins access"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "ec2 security group"
  }
}

resource "aws_key_pair" "jenkins-test1" {
  key_name   = "ssh-key"
  public_key = file("ssh-key.pub")
}

#resource "aws_eip" "openvpn-ip" {
#  vpc = true
#}

resource "null_resource" "openvpn-waiting-for-ip" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("ssh-key")
    host        = aws_eip.openvpn-ip.public_ip
  }
}


# launch the ec2 instance and install website
resource "aws_instance" "ec2-instance-using-terraform" {
  ami                    = var.ami-aws 
  instance_type          = "t2.micro"
  subnet_id              = aws_default_subnet.default_az1.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  key_name               = "ssh-key"
  user_data              = file("user_data.sh")


  tags = {
    Name = "ec2-instance-using-terraform"
  }
}
