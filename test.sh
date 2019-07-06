#!/bin/bash

cd /var/www/TestVPN-scripts

Reset='\033[0m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'

function err() {
  echo -e "[${Red}error${Reset}] $1"
  exit 1
}

function log() {
  echo -e "[${Yellow}*${Reset}] $1"
}

function suc() {
  echo -e "[${Green}+${Reset}] $1"
}

if [[ "$EUID" -ne 0 ]]; then
  err "script has to be run as root."
  exit
fi

if [[ ! -e /dev/net/tun ]]; then
  err "no TUN device found."
  exit
fi

if [ ! -d /etc/openvpn/easy-rsa/ ]
then
  err "couldn't find directory /etc/openvpn/easy-rsa/"
fi

if [ ! -f /etc/openvpn/easy-rsa/easyrsa ]
then
  err "couldn't find binary /etc/openvpn/easy-rsa/easyrsa"
fi

suc "all tests passed."
