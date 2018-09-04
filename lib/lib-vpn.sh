#!/bin/bash
# Credits to:
# Copyright (c) 2013 Nyr. Released under the MIT License.
# https://github.com/Nyr/openvpn-install
# Modified by ChillerDragon:
# https://github.com/TestVPN/TestVPN-scripts

cert_path="/var/www/TestVPN-scripts/certs"

newclient () {
	# Generates the custom client.ovpn
	cp /etc/openvpn/client-common.txt $cert_path/$1.ovpn
	echo "<ca>" >> $cert_path/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/ca.crt >> $cert_path/$1.ovpn
	echo "</ca>" >> $cert_path/$1.ovpn
	echo "<cert>" >> $cert_path/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/issued/$1.crt >> $cert_path/$1.ovpn
	echo "</cert>" >> $cert_path/$1.ovpn
	echo "<key>" >> $cert_path/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/private/$1.key >> $cert_path/$1.ovpn
	echo "</key>" >> $cert_path/$1.ovpn
	echo "<tls-auth>" >> $cert_path/$1.ovpn
	cat /etc/openvpn/ta.key >> $cert_path/$1.ovpn
	echo "</tls-auth>" >> $cert_path/$1.ovpn
}

delclient () {
	local CLIENT=$1
	cd /etc/openvpn/easy-rsa/
	./easyrsa --batch revoke $CLIENT
	EASYRSA_CRL_DAYS=3650 ./easyrsa gen-crl
	rm -f pki/reqs/$CLIENT.req
	rm -f pki/private/$CLIENT.key
	rm -f pki/issued/$CLIENT.crt
	rm -f /etc/openvpn/crl.pem
	cp /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn/crl.pem
	# CRL is read with each client connection, when OpenVPN is dropped to nobody
	chown nobody:$GROUPNAME /etc/openvpn/crl.pem
	echo
	echo "Certificate for client $CLIENT revoked!"
}
