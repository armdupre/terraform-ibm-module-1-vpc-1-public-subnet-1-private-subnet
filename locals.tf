locals {
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	Preamble = "${local.UserLoginTag}-${local.Tag}-${local.Version}"
	PrivateSubnetCidrBlock = "10.0.2.0/24"
	PrivateSubnetName = "${local.Preamble}-private-subnet"
	PrivateSubnetZone = var.PrivateSubnetZone
	PublicSecurityGroupName = "${local.Preamble}-public-security-group"
	PublicSubnetCidrBlock = "10.0.10.0/24"
	PublicSubnetName = "${local.Preamble}-public-subnet"
	PublicSubnetZone = var.PublicSubnetZone
	Tag = var.Tag
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	Version = var.Version
	VpcAddressPrefixName = "${local.Preamble}-vpc-address-prefix"
	VpcCidrBlock = "10.0.0.0/16"
	VpcName = "${local.Preamble}-vpc"
}