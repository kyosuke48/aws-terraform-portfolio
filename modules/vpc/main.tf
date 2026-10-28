# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Public Subnet(ALB)
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1a_cidr
  availability_zone       = var.az_1a
  map_public_ip_on_launch = true 

  tags = {
    Name = "${var.project_name}-public-subnet-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1c_cidr
  availability_zone       = var.az_1c
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-1c"
  }
}

# Private Subnet (WEB)
resource "aws_subnet" "private_web_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_web_subnet_1a_cidr
  availability_zone       = var.az_1a
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-web-subnet-1a"
  }
}

resource "aws_subnet" "private_web_1c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_web_subnet_1c_cidr
  availability_zone       = var.az_1c
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-web-subnet-1c"
  }
}

# Private Subnet (AP)
resource "aws_subnet" "private_ap_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_ap_subnet_1a_cidr
  availability_zone       = var.az_1a
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-ap-subnet-1a"
  }
}

resource "aws_subnet" "private_ap_1c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_ap_subnet_1c_cidr
  availability_zone       = var.az_1c
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-ap-subnet-1c"
  }
}

# Private Subnet (DB)
resource "aws_subnet" "private_db_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet_1a_cidr
  availability_zone = var.az_1a
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-db-subnet-1a"
  }
}

resource "aws_subnet" "private_db_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet_1c_cidr
  availability_zone = var.az_1c
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-db-subnet-1c"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

# Route Table Association
# Public
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

# Private WEB
resource "aws_route_table_association" "private_web_1a" {
  subnet_id      = aws_subnet.private_web_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_web_1c" {
  subnet_id      = aws_subnet.private_web_1c.id
  route_table_id = aws_route_table.private.id
}

# Private AP
resource "aws_route_table_association" "private_ap_1a" {
  subnet_id      = aws_subnet.private_ap_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_ap_1c" {
  subnet_id      = aws_subnet.private_ap_1c.id
  route_table_id = aws_route_table.private.id
}

# Private DB
resource "aws_route_table_association" "private_db_1a" {
  subnet_id      = aws_subnet.private_db_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_db_1c" {
  subnet_id      = aws_subnet.private_db_1c.id
  route_table_id = aws_route_table.private.id
}

# --- SSM 用 Interface 型 VPC エンドポイント (3種) ---
locals {
  ssm_services = [
    "com.amazonaws.ap-northeast-1.ssm",
    "com.amazonaws.ap-northeast-1.ssmmessages",
    "com.amazonaws.ap-northeast-1.ec2messages"
  ]
}

resource "aws_vpc_endpoint" "ssm_endpoints" {
  for_each            = toset(local.ssm_services)
  vpc_id              = aws_vpc.main.id
  service_name        = each.value
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.private_ap_1a.id] # APサブネットに配置（同一VPC内から共通で解決可能）
  security_group_ids  = [var.endpoint_sg_id]
  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-vpc-${replace(each.value, "com.amazonaws.ap-northeast-1.", "")}"
  }
}
