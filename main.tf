resource "ibm_is_vpc" "Vpc" {
	name = local.VpcName
	address_prefix_management = "manual"
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
}

resource "ibm_is_vpc_address_prefix" "VpcAddressPrefix" {
	name = local.VpcAddressPrefixName
	zone = local.PublicSubnetZone
	vpc  = ibm_is_vpc.Vpc.id
	cidr = local.VpcCidrBlock
}

resource "ibm_is_subnet" "PublicSubnet" {
	name = local.PublicSubnetName
	vpc  = ibm_is_vpc.Vpc.id
	zone = local.PublicSubnetZone
	ipv4_cidr_block = local.PublicSubnetCidrBlock
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
	depends_on = [
		ibm_is_vpc_address_prefix.VpcAddressPrefix
	]
}

resource "ibm_is_subnet" "PrivateSubnet" {
	name = local.PrivateSubnetName
	vpc  = ibm_is_vpc.Vpc.id
	zone = local.PrivateSubnetZone
	ipv4_cidr_block = local.PrivateSubnetCidrBlock
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
	depends_on = [
		ibm_is_vpc_address_prefix.VpcAddressPrefix
	]
}

resource "ibm_is_security_group" "PublicSecurityGroup" {
	name = local.PublicSecurityGroupName
	vpc  = ibm_is_vpc.Vpc.id
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
}

resource "ibm_is_security_group_rule" "PublicIngress1" {
	group = ibm_is_security_group.PublicSecurityGroup.id
	direction = "inbound"
	remote = ibm_is_security_group.PublicSecurityGroup.id
}

resource "ibm_is_security_group_rule" "PublicIngress22" {
	group = ibm_is_security_group.PublicSecurityGroup.id
	direction = "inbound"
	remote = local.InboundIPv4CidrBlock
	tcp {
		port_min = 22
		port_max = 22
	}
}

resource "ibm_is_security_group_rule" "PublicIngress80" {
	group = ibm_is_security_group.PublicSecurityGroup.id
	direction = "inbound"
	remote = local.InboundIPv4CidrBlock
	tcp {
		port_min = 80
		port_max = 80
	}
}

resource "ibm_is_security_group_rule" "PublicIngress443" {
	group = ibm_is_security_group.PublicSecurityGroup.id
	direction = "inbound"
	remote = local.InboundIPv4CidrBlock
	tcp {
		port_min = 443
		port_max = 443
	}
}

resource "ibm_is_security_group_rule" "PublicEgress1" {
	group = ibm_is_security_group.PublicSecurityGroup.id
	direction = "outbound"
	remote = "0.0.0.0/0"
}