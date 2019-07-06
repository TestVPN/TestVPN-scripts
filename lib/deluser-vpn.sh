#!/bin/bash
cd /var/www/TestVPN-scripts
source lib/lib-vpn.sh

if [[ "$#" -lt "1" ]]
then
    tail -n +2 /etc/openvpn/server/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2
    echo "Usage: $0 <username>"
    exit
fi
aUsers=(`tail -n +2 /etc/openvpn/server/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2`)
IsArray="0"
for user in "${aUsers[@]}"
do
	[[ "$1" == "$user" ]] && IsArray="1"
done

if [[ "$IsArray" == "0" ]]
then
	echo -e "[ \e[1;31m WARNING \e[0m ] '$1' doesn't exist!"
	exit
else
	echo -e "[ \e[1;32m OK \e[0m ] deleting user '$1' ..."
fi

#echo "[ChillerVPN] deleting user: $1";
delclient $1
cd $cert_path
rm $1.ovpn
#echo ""
#echo "[ChillerVPN] Done deleting user $1"
