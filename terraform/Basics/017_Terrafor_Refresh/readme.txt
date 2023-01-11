Terraform Refresh
The terraform refresh command is used to reconcile the state Terraform knows about (via its state file) with the real-world infrastructure. This can be used to detect any drift from the last-known state, and to update the state file.

This does not modify infrastructure but does modify the state file. If the state is changed, this may cause changes to occur during the next plan or apply.

By default, refresh requires no flags and looks in the current directory for the configuration and state file to refresh.



now let's run terraform refresh command in the folder that we created in last videos.

terraform refresh