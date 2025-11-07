#First we will create a virtual private cloud which has both a public and a private subnet

#VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.100.0.0/16"

    tags = {
        Name = "my_vpc"
    }

}

#Public subnets
resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.100.1.0/24"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.100.2.0/24"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "public-subnet-2"
    }
}


#private subnets

resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.100.3.0/24"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "private-subnet-1"
    }
}

resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.100.4.0/24"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "private-subnet-2"
    }
}