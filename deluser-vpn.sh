#!/bin/bash
cd /var/www/TestVPN
source lib-vpn.sh

if [[ "$#" -lt "1" ]]
then
    echo "Usage: $0 <username>"
    exit
fi


echo "[ChillerVPN] deleting user: $1";
delclient $1
cd $cert_path
rm $1.ovpn
echo ""
echo "[ChillerVPN] Done deleting user $1"
