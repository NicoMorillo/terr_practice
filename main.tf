provider "aws" {
    region = "eu-west-2"
    access_key = "**********"
    secret_key = "********************"
}

resource "aws_instance" "EC2-instance" {
    ami = "ami-0015a39e4b7c0966f"
    instance_type = "t2.micro"

    tags = {
        # Name = "ubuntu"
    }  
}

resource "aws_vpc" "firts_vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "production"
    }
}


resource "aws_subnet" "subnet-1"{
    vpc_id = aws_vpc.firts_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = { 
        Name = "prod-subnet"
    }
}
resource "aws_vpc" "second_vpc"{
    cidr_block = "10.1.0.0/16"
    tags = {
        Name = "dev"
    }
}
resource "aws_subnet" "subnet-2"{
    vpc_id = aws_vpc.second_vpc.id
    cidr_block = "10.1.1.0/24"

    tags = { 
        Name = "dev-subnet"
    }
}