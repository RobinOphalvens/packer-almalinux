# packer-almalinux
Packer template to generate a cloud-init ready Libvirt image.

Basically a port of [maartenbeeckmans](https://github.com/maartenbeeckmans) [packer-rockylinux](https://github.com/maartenbeeckmans/packer-rockylinux) template for AlmaLinux.


## Prerequisites

* Ready to use QEMU/KVM hypervisor on the system
* Either a root or a non-root user with the latter being able to interact with libvirt.

## Usage

1. Clone the repo
2. `make init`
3. `make validate`
4. `make build`

## Contributing

PRs are welcome.

## License

GPL v3
