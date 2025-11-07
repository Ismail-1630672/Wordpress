#Route table association, connects route tables to subnets

#public route table association
resource "aws_route_table_association" "publicone" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.publicrt.id
}

resource "aws_route_table_association" "publictwo" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.publicrt.id
}

#private route table association
resource "aws_route_table_association" "privateone" {
    subnet_id = aws_subnet.private1.id
    route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "privatetwo" {
    subnet_id = aws_subnet.private2.id
    route_table_id = aws_route_table.privatert.id
}

#security group, controls inbound and outbound traffic out of instance based on rules
resource "aws_security_group" "allow_traffic" {
    vpc_id = aws_vpc.my_vpc.id
    name = "allow_traffic"
    description = "allow ssh and http traffic"

    #inbound rules, traffic coming into resource such as EC2 instance
    ingress {
        description = "Allow SSH" #ssh used to remotely connect to instances
        protocol = "tcp"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"] #allows traffic from anywhere on the internet

    }
    #allows anyone on the internet to access resource such as EC2 instance via port 22 using TCP

    ingress {
        description = "Allow HTTP"
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"] #allows traffic from anhwhere on the internet
    }
    #allows anyone on the internet to access resource such as EC2 instance via port 80 using TCP

    #outbound rules, controls traffic coming out of the resource such as EC2 instance
    egress {
        from_port = 0 #means all ports
        to_port = 0 #means all ports
        protocol = "-1" #means all protocols such as tcp, udp etc
        cidr_blocks = ["0.0.0.0/0"] #allow outbound traffic to any ipv4 address
        ipv6_cidr_blocks = ["::/0"] #allow outbound traffic to any ipv6 address

    }

    #this outbound rule allows the resource/instance to send traffic to anywhere on the internet whether ipv4 or ipv6

    tags = {
        Name = "Allow_ssh_and_http"
    }
}
