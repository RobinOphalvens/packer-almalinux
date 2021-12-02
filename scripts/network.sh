#!/bin/bash -eux

retry() {
  local COUNT=1
  local RESULT=0
  while [[ "${COUNT}" -le 10 ]]; do
    [[ "${RESULT}" -ne 0 ]] && {
      [ "`which tput 2> /dev/null`" != "" ] && tput setaf 1
      echo -e "\n${*} failed... retrying ${COUNT} of 10.\n" >&2
      [ "`which tput 2> /dev/null`" != "" ] && tput sgr0
    }
    "${@}" && { RESULT=0 && break; } || RESULT="${?}"
    COUNT="$((COUNT + 1))"

    # Increase the delay with each iteration.
    DELAY="$((DELAY + 10))"
    sleep $DELAY
  done

  [[ "${COUNT}" -gt 10 ]] && {
    [ "`which tput 2> /dev/null`" != "" ] && tput setaf 1
    echo -e "\nThe command failed 10 times.\n" >&2
    [ "`which tput 2> /dev/null`" != "" ] && tput sgr0
  }

  return "${RESULT}"
}


error() {
        if [ $? -ne 0 ]; then
                printf "\n\napt failed...\n\n";
                exit 1
        fi
}

# Setup

# Setup systemd-networkd
# We later overwrite this with puppet
retry mkdir -p /etc/systemd/network
cat <<-EOF >> /etc/systemd/network/wired.network
[Match]
Name=en* eth*

[Network]
Address=2a01:4f9:6a:531c::2/64
Gateway=fe80::1
DNS=2606:4700:4700::1111
DNS=2606:4700:4700::1001
EOF

retry systemctl enable --now systemd-resolved
retry ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
retry systemctl disable --now NetworkManager
retry systemctl enable --now systemd-networkd
