###########
## Build ##
###########
build {
  sources = ["source.qemu.almalinux8"]
  provisioner "shell" {
    environment_vars    = ["HOME_DIR=/root",]
    start_retry_timeout = "15m"
    expect_disconnect   = true
    scripts             = [
      "${var.scripts_dir}/network.sh",
      "${var.scripts_dir}/dnf.sh",
    ]
  }
  provisioner "shell" {
    environment_vars    = ["HOME_DIR=/root",]
    expect_disconnect   = true
    start_retry_timeout = "15m"
    pause_before = "120s"
    scripts             = [
      "${var.scripts_dir}/profile.sh",
      "${var.scripts_dir}/qemu.sh",
      "${var.scripts_dir}/puppet.sh",
      "${var.scripts_dir}/cloud-init.sh"
    ]
  }
}
