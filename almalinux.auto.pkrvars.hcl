#####################
## Basic variables ##
#####################

# Build vars
name           = "almalinux_8.4"
version        = "1.0"
build_dir      = "./packer_builds"
scripts_dir    = "./scripts"
http_dir       = "./http"
templates_dir  = "./templates"
files_dir      = "./files"

# OS vars
iso_checksum   = "b4572a1bf791ed8e7469d6ab0beece1d1eacc5ab39bb8b8f4bf78111a20b5c23"
iso_name       = "alma-8.4-x86_64-boot.iso"
kickstart_path = "anaconda-ks.cfg"
template       = "AlmaLinux-8.4-x86_64-minimal.iso"
mirror         = "https://alma.mirror.ate.info"
mirror_dir     = "8.4/isos/x86_64"

# VM vars
box_basename   = "almalinux_8"
cpus           = 2
memory         = 2048
disk_size      = "15G"
headless       = true
