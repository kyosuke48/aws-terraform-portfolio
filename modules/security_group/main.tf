# ALB SG (Public)
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  vpc_id      = var.vpc_id
  description = "Security group for Application Load Balancer"

  # インターネットからのHTTP通信を許可
  ingress {
    description = "Allow HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

# Web SG (Private)
resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  vpc_id      = var.vpc_id
  description = "Security group for Web Server"

  ingress {
    description     = "Allow HTTP from ALB only"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id] #ALBからのみに制限
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-web-sg"
  }
}

# AP SG (Private) - Web SGからのみ8080許可
resource "aws_security_group" "ap" {
  name        = "${var.project_name}-ap-sg"
  vpc_id      = var.vpc_id
  description = "Security group for AP Server"

  ingress {
    description     = "Allow 8080 from Web SG only"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ap-sg"
  }
}

# DB SG (ap_sg からの 3306/TCP MySQL通信のみ許可)
resource "aws_security_group" "db" {
  name        = "${var.project_name}-db-sg"
  description = "Security group for DB Server"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL from AP SG only"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ap.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.project_name}-db-sg" }
}

# --- VPC Endpoint 用 Security Group ---
resource "aws_security_group" "endpoint_sg" {
  name        = "${var.project_name}-vpc-sg"
  description = "Security Group for SSM VPC Endpoints"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-vpc-sg"
  }
}


