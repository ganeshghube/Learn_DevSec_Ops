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
