resource "aws_instance" "jenkins_ec2" {
  ami                         = "ami-0884d2865dbe9de4b"
  instance_type               = "t3.large"
  key_name                    = "ohio-dec-pem"
  subnet_id                   = aws_subnet.vpc_pub_sub1_us_east_2a.id
  vpc_security_group_ids      = [ aws_security_group.camunda_vpc_sg.id ]
  associate_public_ip_address = true
  user_data                   = file("shellscripts/userdata.sh")

  root_block_device {
    volume_size = 28
    tags = {
      Name = "Jenkins_Master_Storage"
    }
  }

  tags = {
    Name = "Jenkins_Master"
  }
  
}
