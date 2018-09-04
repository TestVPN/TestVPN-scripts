#!/bin/bash
if [[ "$#" -lt "1" ]]
then
	./list-web-users.sh
	echo "Usage: $0 <username>"
	exit
fi
username=$1;
aUsers=(`./list-web-users.sh`)
IsArray="0"
for user in "${aUsers[@]}"
do
	[[ "$username" == "$user" ]] && IsArray="1"
done

if [[ "$IsArray" == "0" ]]
then
	echo -e "[ \e[1;31m WARNING \e[0m ] '$1' doesn't exist in database!"
	echo "Do you want to delete vpn profile anyways? [y/n]"
	read -n 1 -p "" inp
	if [ "$inp" == "n" ]; then
	    printf "\n[TestVPN] stopped.\n"
	    exit
	elif [ "$inp" == "N" ]; then
	    printf "\n[TestVPN] stopped.\n"
	    exit
	fi
	echo ""
else
	echo -e "[ \e[1;32m OK \e[0m ] found user '$1' in database ..."
	echo "Deleting $username from web database..."
	echo "DELETE FROM Accounts WHERE Username = '$username';" | sqlite3 ../users.db
fi

echo "Deleting $username vpn files..."
for ((i=0;i<15;i++)) do
	#echo "del:  $username-$i"
	./deluser-vpn.sh $username-$i
done
