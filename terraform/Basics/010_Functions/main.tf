output printfirst {
        value = "${join("--->",var.users)}"
}


output output_upper {
        value = "${upper(var.users[0])}"
}


output output_lower {
        value = "${lower(var.users[1])}"
}


output output_title {
        value = "${title(var.users[2])}"
}

output output_true {
        value = "${(var.enabled)}"
}


output output__min {
        value = "${min(12, 54, 3)}"
}


output output__max {
        value = "${max(12, 54, 3)}"
}

output output__log {
        value = "${log(50, 10)}"
}


output output__ceillog {
        value = "${ceil(log(15, 2))}"
}

output output__parseint {
        value = "${parseint("100", 10)}"
}

output output__signum {
        value = "${signum(344)}"
}



output print_chomp {
        value = "${chomp("hello\n")}"
}


output print_endwith {
        value = "${endswith("hello world", "world")}"
		#value = "${endswith("hello world", "hello")}"
}


output print_format {
        value = "${format("Hello, %s!", var.users[1])}"
}

output print_formatlist {
        #value = "${formatlist("Hello, %s!", ["Valentina", "Ander", "Olivia", "Sam"])}"
		value = "${formatlist("Hello, %s!", var.users)}"
}

output print_trim {
        #value = "${formatlist("Hello, %s!", ["Valentina", "Ander", "Olivia", "Sam"])}"
		value = "${trim("foobar", "far")}"
		#value = "${trim("foo", var.users[3])}"
}

output print_sort {
       
		#value = "${sort(["e", "d", "a", "x"])}"
		#value = "${sort(["ganesh", "dinesh", "yogesh", "deepesh"])}"
		value = "${sort(var.users)}"
}

