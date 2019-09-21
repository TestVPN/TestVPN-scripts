#!/bin/bash
cd /var/www/TestVPN-scripts
source lib/lib-vpn.sh

function log() {
  echo "[TestVPN] $1"
}

if [[ "$#" -lt "1" ]]
then
    echo "Usage: $0 <username>"
    exit 1
fi

if [ ! -d /etc/openvpn/server/easy-rsa/ ]
then
  log "Error: couldn't find directory /etc/openvpn/server/easy-rsa/"
  exit 1
fi

if [ ! -f /etc/openvpn/server/easy-rsa/easyrsa ]
then
  log "Error: couldn't find binary /etc/openvpn/server/easy-rsa/easyrsa"
  exit 1
fi

log "adding new user: $1";

cd /etc/openvpn/server/easy-rsa/
./easyrsa build-client-full $1 nopass
newclient $1
echo ""
log "Client $1 added, configuration is available at: $cert_path/$1.ovpn"
