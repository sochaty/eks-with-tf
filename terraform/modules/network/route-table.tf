resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Private-Route-Table"
  }
}

resource "aws_route_table" "db-route-table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Db-Route-Table"
  }
}

resource "aws_route_table_association" "public-route-association" {
  count = length(var.vpc_public_subnets)

  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
}

resource "aws_route_table_association" "private-route-association" {
  count = length(var.vpc_private_subnets)

  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
}

resource "aws_route_table_association" "db-route-association" {
  count = length(var.vpc_database_subnets)

  route_table_id = aws_route_table.db-route-table.id
  subnet_id      = element(aws_subnet.db-subnet.*.id, count.index)
}