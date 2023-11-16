variable "InboundIPv4CidrBlock" {
	type = string
	description = "IP Address /32 or IP CIDR range connecting inbound to ILU App"
	validation {
		condition = length(var.InboundIPv4CidrBlock) >= 9 && length(var.InboundIPv4CidrBlock) <= 18 && can(regex("(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})", var.InboundIPv4CidrBlock))
		error_message = "InboundIPv4CidrBlock must be a valid IP CIDR range of the form x.x.x.x/x."
	}
}

variable PrivateSubnetZone {
	default = "us-south-1"
	type = string
}

variable PublicSubnetZone {
	default = "us-south-1"
	type = string
}

variable "Tag" {
	default = "ibm"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	description = "Email address tag of user creating the stack"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "example"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "demo"
	description = "Versioning of the application using the deployment"
	type = string
}