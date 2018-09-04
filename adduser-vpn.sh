#!/bin/bash
cd /var/www/TestVPN-scripts
source lib-vpn.sh

if [[ "$#" -lt "1" ]]
then
    echo "Usage: $0 <username>"
    exit
fi

echo "[ChillerVPN] adding new user: $1";

cd /etc/openvpn/easy-rsa/
./easyrsa build-client-full $1 nopass
newclient $1
echo ""
echo "[ChillerVPN] Client $1 added, configuration is available at: $cert_path/$1.ovpn"
