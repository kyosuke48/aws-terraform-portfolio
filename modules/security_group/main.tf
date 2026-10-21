# Web SG (Public)
resource "aws_security_group" "web" {
  name        = "web-server-sg"
  vpc_id      = var.vpc_id
  description = "インターネットからのhttp接続及びZabbixによる監視の許可"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "portfolio-sg-web"
  }
}

# AP SG (Private) - Web SGからのみ8080許可
resource "aws_security_group" "ap" {
  name        = "ap-server-sg"
  vpc_id      = var.vpc_id
  description = "VPC内のZabbixによる監視の許可"

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "portfolio-sg-ap"
  }
}

# Zabbix SG (Private) - VPC内(10.0.0.0/16)のみ10050/10051許可
resource "aws_security_group" "zabbix" {
  name        = "zabbix-server-sg"
  vpc_id      = var.vpc_id
  description = "VPC内のZabbixによる監視の許可"

  ingress {
    from_port   = 10050
    to_port     = 10051
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "portfolio-sg-zabbix"
  }
}
