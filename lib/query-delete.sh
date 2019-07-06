#!/bin/bash
echo "=============================="
echo "delete users with sql query!"
echo "warning powerfull script!"
echo "=============================="
echo "Create an sql query returning usernames."
echo "All those users and their configs will be deleted!"
echo ""
echo "examples:"
echo "SELECT Username FROM Accounts WHERE RegisterDate >= Datetime('2009-11-13 00:00:00');"
read -p "SQL> " query
aUsers=(`echo "$query" | sqlite3 ../users.db`)
echo "Selected users:"
for user in "${aUsers[@]}"
do
	echo $user
done
echo "---------------------"
echo "do you really want to delete these users? [Y/n]"
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
	./deluser-web.sh $user
done
