# --------------------------------------------------
# SSM用 IAM Role & Profile
# --------------------------------------------------
resource "aws_iam_role" "ssm" {
  name = "portfolio-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm" {
  name = "portfolio-ssm-instance-profile"
  role = aws_iam_role.ssm.name
}

# --------------------------------------------------
# AMI データソース
# --------------------------------------------------
# Amazon Linux 2023 (Web / AP Server用)
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# AlmaLinux 9 (Zabbix Server用)
data "aws_ami" "almalinux9" {
  most_recent = true
  owners      = ["679593333241"] # AlmaLinux Official

  filter {
    name   = "name"
    values = ["AlmaLinux OS 9*x86_64*"]
  }
}

# --------------------------------------------------
# EC2 インスタンス
# --------------------------------------------------
# Web Server (Public Subnet)
resource "aws_instance" "web" {
  ami                  = data.aws_ami.al2023.id
  instance_type        = var.instance_type
  subnet_id            = var.public_subnet_id
  vpc_security_group_ids = [var.sg_web_id]
  iam_instance_profile   = aws_iam_instance_profile.ssm.name

  tags = {
    Name = "portfolio-web-server"
  }
}

# AP Server (Private Subnet)
resource "aws_instance" "ap" {
  ami                  = data.aws_ami.al2023.id
  instance_type        = var.instance_type
  subnet_id            = var.private_subnet_id
  vpc_security_group_ids = [var.sg_ap_id]
  iam_instance_profile   = aws_iam_instance_profile.ssm.name

  tags = {
    Name = "portfolio-ap-server"
  }
}

# Zabbix Server (Private Subnet)
resource "aws_instance" "zabbix" {
  ami                  = data.aws_ami.almalinux9.id
  instance_type        = var.instance_type
  subnet_id            = var.private_subnet_id
  vpc_security_group_ids = [var.sg_zabbix_id]
  iam_instance_profile   = aws_iam_instance_profile.ssm.name

  tags = {
    Name = "portfolio-zabbix-server"
  }
}

# Webサーバー用 Elastic IP
resource "aws_eip" "web" {
  instance = aws_instance.web.id
  domain   = "vpc"

  tags = {
    Name = "portfolio-web-eip"
  }
}
