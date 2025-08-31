resource "aws_vpc" "name_vpc" {
  cidr_block = var.name_cidr
  tags = {
    Name = var.name_vpc
  }
}

resource "aws_subnet" "name_subnet" {
  vpc_id            = aws_vpc.name_vpc.id   
  cidr_block        = var.name_subnet_cidr
  availability_zone = var.name_availability_zone

  tags = {
    Name = var.name_subnet
  }
}

resource "aws_internet_gateway" "name_igw" {
  vpc_id = aws_vpc.name_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "name_route_table" {
  vpc_id = aws_vpc.name_vpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.name_igw.id
  }

  tags = {
    Name = var.route_name
  }
}

resource "aws_route_table_association" "name_assocation" {
  subnet_id      = aws_subnet.name_subnet.id
  route_table_id = aws_route_table.name_route_table.id
}
resource "aws_security_group" "name_security_group" {
  name        = "allow-all-traffic"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.name_vpc.id
  tags = {
    Name = var.security_group_name
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

data "aws_ami" "name_ami" {
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250821"]
  }
}

resource "aws_key_pair" "name_key_pair" {
  key_name   = var.instance_key
  public_key = file("C:/Users/vishw/.ssh/id_ed25519.pub")
}

resource "aws_instance" "name_instance" {
  ami                         = data.aws_ami.name_ami.id
  instance_type               = var.instance_type
    key_name                   = aws_key_pair.name_key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.name_subnet.id
  vpc_security_group_ids      = [aws_security_group.name_security_group.id]
  tags = {
    Name = var.instance_name
  }
}
