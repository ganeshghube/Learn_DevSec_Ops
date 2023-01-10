output printname{
	value = "Hello, ${var.username}"
}

#Execute it as 
#terraform plan -var "<VARIABLE_NAME>=<VARIABLE_VALUE>"
#terraform plan -var "username=Learning-Terraform"