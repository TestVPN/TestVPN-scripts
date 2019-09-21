#!/bin/bash

cd /var/www/TestVPN-scripts

Reset='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'

function err() {
  echo -e "[${Red}error${Reset}] $1"
}

function log() {
  echo -e "[${Yellow}*${Reset}] $1"
}

function suc() {
  echo -e "[${Green}+${Reset}] $1"
}

if [[ "$EUID" -ne 0 ]]; then
  err "script has to be run as root."
  exit 1
fi

if [[ ! -e /dev/net/tun ]]; then
  err "no TUN device found."
  exit 1
fi

if [ ! -d /etc/openvpn ]; then
    err "'/etc/openvpn' not found. Is openvpn installed?"
    exit 1
fi

if [ ! -d /etc/openvpn/server/easy-rsa ]; then
    err "'/etc/openvpn/server/easy-rsa' not found. Make sure to run install script:"
    err "wget https://git.io/vpn -O /tmp/openvpn-install.sh && bash /tmp/openvpn-install.sh"
    exit 1
fi

suc "all tests passed."
