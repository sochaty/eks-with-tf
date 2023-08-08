
data "aws_subnets" "private-subnets" {
  filter {
    name   = "tag:Name"
    values = ["Private-Subnet-*"]
  }
  depends_on = [aws_subnet.private-subnet]
}

data "aws_subnets" "public-subnets" {
  filter {
    name   = "tag:Name"
    values = ["Public-Subnet-*"]
  }
  depends_on = [aws_subnet.public-subnet]
}

# data "aws_subnets" "db-subnets" {
#   filter {
#     name   = "tag:Name"
#     values = ["Db-Subnet-*"]
#   }
#   depends_on = [aws_subnet.public-subnet]
# }

resource "aws_subnet" "public-subnet" {
  count = length(var.vpc_public_subnets)

  cidr_block              = var.vpc_public_subnets[count.index]
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "${var.aws_region}${var.vpc_availability_zones[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-${var.aws_region}${var.vpc_availability_zones[count.index]}"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_subnet" "private-subnet" {
  count = length(var.vpc_private_subnets)

  cidr_block        = var.vpc_private_subnets[count.index]
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "${var.aws_region}${var.vpc_availability_zones[count.index]}"

  tags = {
    Name = "Private-Subnet-${var.aws_region}${var.vpc_availability_zones[count.index]}"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}

# resource "aws_subnet" "db-subnet" {
#   count = length(var.vpc_database_subnets)

#   cidr_block        = var.vpc_database_subnets[count.index]
#   vpc_id            = aws_vpc.vpc.id
#   availability_zone = "${var.aws_region}${var.vpc_availability_zones[count.index]}"

#   tags = {
#     Name = "Db-Subnet-${var.aws_region}${var.vpc_availability_zones[count.index]}"
#   }
#   depends_on = [
#     aws_vpc.vpc
#   ]
# }