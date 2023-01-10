
#We can pass the list variable from the command line using below syntax.
#terraform plan -var 'username=["valueone","valuetwo","value3"]'


output printname {
	value = "${var.username}"
}


output printname1 {
	value = "First User ${(var.username[0])}"
}

output printname2 {
	value = "Second User ${(var.username[1])}"
}

output printname3 {
	value = "Third User ${(var.username[2])}"
}

