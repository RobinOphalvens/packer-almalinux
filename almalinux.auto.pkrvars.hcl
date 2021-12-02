#####################
## Basic variables ##
#####################

# Build vars
name           = "almalinux_8.5"
version        = "1.0"
build_dir      = "./packer_builds"
scripts_dir    = "./scripts"
http_dir       = "./http"
templates_dir  = "./templates"
files_dir      = "./files"

# OS vars
iso_checksum   = "fddb5646627aecc572127ecf0b5a3b2b6dd4435f1a1b5ad42013c7fa1bff8ca8"
iso_name       = "AlmaLinux-8.5-x86_64-minimal.iso"
kickstart_path = "anaconda-ks.cfg"
template       = "AlmaLinux-8.5-x86_64"
mirror         = "https://alma.mirror.ate.info"
mirror_dir     = "8.5/isos/x86_64"

# VM vars
box_basename   = "almalinux_8"
cpus           = 2
memory         = 2048
disk_size      = "15G"
headless       = true
