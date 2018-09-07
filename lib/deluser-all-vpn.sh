#!/bin/bash
cd /var/www/TestVPN-scripts
source lib/lib-vpn.sh

aUsers=(`tail -n +2 /etc/openvpn/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2`)
IsArray="0"
for user in "${aUsers[@]}"
do
	echo $user;
done

echo "do you really want to delete all these users? [y/n]"
read -n 1 -p "" inp
echo ""
if [ "$inp" == "n" ]; then
    printf "\n[TestVPN] stopped.\n"
    exit
elif [ "$inp" == "N" ]; then
    printf "\n[TestVPN] stopped.\n"
    exit
fi


for user in "${aUsers[@]}"
do
	./lib/deluser-vpn.sh $user;
done

echo "Done."
