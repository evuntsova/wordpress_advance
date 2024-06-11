# Create a VPC named ‘wordpress-vpc’ (add name tag).
resource "aws_vpc" "wordpress-vpc" {
    cidr_block = "10.0.0.0/24"
}
# Create an Internet Gateway named ‘wordpress_igw’ (add name tag).
resource "aws_internet_gateway" "wordpress_igw" {
    vpc_id = aws_vpc.wordpress-vpc.id
}
# Create a route table named ‘wordpess-rt’ and add Internet Gateway route to it (add name tag).
resource "aws_route_table" "wordpess-rt" {
    vpc_id = aws_vpc.wordpress-vpc.id
}
# Create 3 public and 3 private subnets in the us-east region (add name tag). Associate them with the ‘wordpess-rt’ route table. What subnets should be associated with the ‘wordpess-rt’ route table? What about other subnets? Use AWS documentation.
resource "aws_subnet" "public_sub_1" {
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "public_sub_2" {
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "public_sub_3" {
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = "10.0.3.0/24"
}

resource "aws_subnet" "public_sub_4" {
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = "10.0.4.0/24"
}

resource "aws_subnet" "public_sub_5" {
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = "10.0.5.0/24"
}

resource "aws_subnet" "public_sub_6" {
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = "10.0.6.0/24"
}
# Create a security group named ‘wordpress-sg’ and open HTTP, HTTPS, SSH ports to the Internet (add name tag). Define port numbers in a variable named ‘ingress_ports’.
resource "aws_security_group" "wordpress-sg" {
  name        = "wordpress-sg"
  description = "Allow SSH, HTTP, HTTPS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.wordpress-vpc.id

  tags = {
    Name = "allow_SSH"
  }
}

resource "aws_vpc_security_group_rule" "ssh" {
    type              = "ingress"
    security_group_id = aws_security_group.wordpress-sg.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 22
    ip_protocol       = "tcp"
    to_port           = 22
}
# Create a key pair named ‘ssh-key’ (you can use your public key).

# Create an EC2 instance named ‘wordpress-ec2’ (add name tag). Use Amazon Linux 2 AMI (can store AMI in a variable), t2.micro, ‘wordpress-sg’ security group, ‘ssh-key’ key pair, public subnet 1.

# Create a security group named ‘rds-sg’ and open MySQL port and allow traffic only from ‘wordpress-sg’ security group (add name tag).

# Create a MySQL DB instance named ‘mysql’: 20GB, gp2, t2.micro instance class, username=admin, password=adminadmin. Use ‘aws_db_subnet_group’ resource to define private subnets where the DB instance will be created.

#  

# You have to install wordpress on 'wordpress-ec2'. Desired result: on wordpress-ec2-public-ip/blog address, you have to see wordpress installation page. You can install wordpress manually or through user_data. 
