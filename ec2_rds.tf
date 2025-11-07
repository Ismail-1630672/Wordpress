#EC2 instance
resource "aws_instance" "wordpress" {
    ami = "ami-024294779773cf91a"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public1.id
    security_groups = [aws_security_group.allow_traffic.id]
    key_name = "ec2_instance" #first defined in aws console
    associate_public_ip_address = true

    tags = {
        Name = "EC2_instance"
    }
}

#relational database (RDS) subnet
resource "aws_db_subnet_group" "rds_subnet_group" {
    name = "rds-subnet-group"
    subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}


#security group for relational database (rds) of mysql
resource "aws_security_group" "rds_sg" {
    name = "RDS security group"
    description = "security group for rds instance"
    vpc_id = aws_vpc.my_vpc.id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["10.100.0.0/16"] #RDS not suppose to be publicly accessible, so allow traffic only from trusted private networks (keeps the RDS in private subnet) usually the vpc cidr block
    }

    tags = {
        Name = "RDS Security Group"
    }
}

#RDS instance
resource "aws_db_instance" "db_instance" {
    allocated_storage = 20
    db_name = "wordpressdb"
    engine = "mysql"
    engine_version = "8.0.42"
    storage_type = "gp2"
    identifier = "database-1"
    username = "admin"
    password = "Factorising1!"
    instance_class = "db.t4g.micro"
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
    vpc_security_group_ids = [aws_security_group.rds_sg.id]

    tags = {
        Name = "RDS instance"
    }
}