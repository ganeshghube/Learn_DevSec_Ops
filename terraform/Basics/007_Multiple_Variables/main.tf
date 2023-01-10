output printname{
	value = "Hello, ${var.username}"
}


output printage {
	value = "your age is ${var.age}"
}


output prinboth {
	value = "your name is ${var.username} and your age is ${var.age}"
}

#Run Belo and provide input 
#terraform plan 

#Run below with variables
#terraform plan -var "<VARIABLE_1_NAME>=<VARIABLE_1_VALUE>" -var "<VARIABLE_2_NAME>=<VARIABLE_2_VALUE>"
#terraform plan -var "username=Ganesh" -var "age=30"


