output "PrivateSubnet" {
	description = "Subnet resource associated with the private subnet"
	value = {
		"id" : ibm_is_subnet.PrivateSubnet.id
		"name" : ibm_is_subnet.PrivateSubnet.name
	}
}

output "PublicSecurityGroup" {
	description = "Security group resource associated with the public subnet"
	value = {
		"id" : ibm_is_security_group.PublicSecurityGroup.id
		"name" : ibm_is_security_group.PublicSecurityGroup.name
	}
}

output "PublicSubnet" {
	description = "Subnet resource associated with the public subnet"
	value = {
		"id" : ibm_is_subnet.PublicSubnet.id
		"name" : ibm_is_subnet.PublicSubnet.name
	}
}

output "Vpc" {
	description = "Vpc resource associated with the virtual network"
	value = {
		"id" : ibm_is_vpc.Vpc.id
		"name" : ibm_is_vpc.Vpc.name
	}
}