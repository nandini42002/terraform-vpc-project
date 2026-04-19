# Terraform AWS VPC Project

## 📌 Description
This project creates AWS infrastructure using Terraform:
- VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

## 🛠️ Tools Used
- Terraform
- AWS

## 🚀 How to Use
1. terraform init
2. terraform plan
3. terraform apply

## 📷 Architecture
This project provisions a complete AWS network infrastructure using Terraform modules.

### 🏗️ Components:
- VPC (172.32.0.0/16)
- Public Subnet (172.32.10.0/24 - ap-south-1a)
- Private Subnet (172.32.20.0/24 - ap-south-1b)
- Internet Gateway (IGW)
- NAT Gateway (Elastic IP attached)
- Public Route Table → IGW
- Private Route Table → NAT Gateway

### 🔁 Traffic Flow:
- Public Subnet → Internet via Internet Gateway
- Private Subnet → Internet via NAT Gateway
                   🌐 Internet
                      |
              Internet Gateway
                      |
        -----------------------------
        |       Public Subnet       |
        |   172.32.10.0/24         |
        |   NAT Gateway            |
        -----------------------------
                      |
        -----------------------------
        |      Private Subnet       |
        |   172.32.20.0/24         |
        -----------------------------

## 👩‍💻 Author
Nandini
