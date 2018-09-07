#!/bin/bash
cd lib
pos=0
rows=2

function PrintMenu() {
	clear
	echo "==========================="
	echo "what do you want to delete?"
	echo "==========================="
	echo "e=select w,s=change q=quit"
	echo "==========================="
	if [[ "$pos" == "0" ]]
	then
		echo "[x] web (+configs)"
		echo "[ ] config"
		echo "[ ] config (all)"
	elif [[ "$pos" == "1" ]]
	then
		echo "[ ] web (+configs)"
		echo "[x] config"
		echo "[ ] config (all)"
	elif [[ "$pos" == "2" ]]
	then
		echo "[ ] web (+configs)"
		echo "[ ] config"
		echo "[x] config (all)"
	else
		echo "error $pos out of scope"
	fi
}

while true
do
	PrintMenu
	read -n 1 -p "" inp
	echo ""
	if [[ "$inp" == "w" ]]
	then
		if [[ "$pos" -gt "0" ]]
		then
			pos=$((pos - 1))
		fi
	elif [[ "$inp" == "s" ]]
	then
		if [[ "$pos" -lt "$rows" ]]
		then
			pos=$((pos + 1))
		fi
	elif [[ "$inp" == "e" ]]
	then
		if [[ "$pos" == "0" ]]
		then
			./deluser-web.sh $1
		elif [[ "$pos" == "1" ]]
		then
			./deluser-vpn.sh $1
		elif [[ "$pos" == "2" ]]
		then
			./deluser-all-vpn.sh
		else
			echo "error out of range"
		fi
		exit
	elif [[ "$inp" == "q" ]]
	then
		exit
	fi
done

