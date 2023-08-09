aws_region    = "us-east-1"
instance_type = "t3.micro"
instance_user = "ec2-user"
key_pair_name = "demokey1"

parameters = ["/eks-with-tf/environment", "/eks-with-tf/business_division",
"/eks-with-tf/vpc_public_subnets", "/eks-with-tf/vpc_name"]