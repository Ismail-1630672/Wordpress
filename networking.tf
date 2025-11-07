#Internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "internet-gateway"
    }
}

#elastic IP, a static public IP useful for high availability
resource "aws_eip" "eip" {
    domain = "vpc"
}

#NAT gateway
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.public1.id

    tags = {
        Name = "nat-gw"
    }
}

#public route table
resource "aws_route_table" "publicrt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "public-rt"
    }
}


#private route table
resource "aws_route_table" "privatert" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id

    }

    tags = {
        Name = "private-rt"
    }
}

