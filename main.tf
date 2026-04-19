module "vpc" {
 source = "./modules/vpc/"
 cidr_block = "172.32.0.0/16"
 name = "task-vpc" 
}
module "public_subnet" {
 source = "./modules/public_subnet/"
 vpc_id = module.vpc.vpc_id
 cidr_block = "172.32.10.0/24"
 az = "ap-south-1a"
 name = "public_subnet"
}
module "private_subnet" {
 source = "./modules/private_subnet/"
 vpc_id = module.vpc.vpc_id
 cidr_block = "172.32.20.0/24"
 az = "ap-south-1b"
 name = "private-subnet"
}
module "IGW" {
 source = "./modules/IGW/"
 vpc_id = module.vpc.vpc_id
 name = "my-igw"
}
module "NAT_GW" {
 source = "./modules/NAT_GW/"
 subnet_id = module.public_subnet.subnet_id
 name = "my-nat-gw"
}
module "public_rt" {
  source    = "./modules/public_rt/"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.IGW.igw_id
  subnet_id = module.public_subnet.subnet_id
  name      = "my-public-rt"
}
module "private_rt" {
  source         = "./modules/private_rt/"
  vpc_id         = module.vpc.vpc_id
  nat_gw         = module.NAT_GW.nat_id
  subnet_id      = module.private_subnet.subnet_id
  name           = "my-private-rt"
}


