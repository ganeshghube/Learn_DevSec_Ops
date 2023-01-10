# Type constraints are created from a mixture of type keywords and type constructors. The supported type keywords are:

# string
# number
# bool
# The type constructors allow you to specify complex types such as collections:

# list
# map
# If both the type and default arguments are specified, the given default value must be convertible to the specified type.


# Execute with following command 
# terraform plan -var "variablename=variablevalue" -var "variable2name=varible2value"

# terraform plan -var "username=Learning-Terraform" -var "age=23"

# This will fail and throw error
# terraform plan -var "username=Learning-Terraform" -var "age=whatisage"


variable username {
    type = string
    default = "ganesh"
}

variable age {
    type = number
    default = "30"
}


