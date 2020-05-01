# TestVPN-scripts
A repo holding all scripts that run TestVPN

# Scripts Setup

debian/ubuntu dependencys:
```
sudo apt install git php apache2 php-sqlite3 openvpn
```

Place this repository at ``/var/www/``

```
cd /var/www/
git clone https://github.com/TestVPN/TestVPN-scripts
chown -R www-data:www-data TestVPN-scripts # give apache2 permission to access certs and database
chmod 770 TestVPN-scripts/ # give apache2 full read/write access but nobody else
cd html
git clone https://github.com/TestVPN/TestVPN-web
```

Then set the root path of apache to /var/www/html/TestVPN-web


Add this line to your ``visudo`` to allow the apache server to create a user.
```
www-data        ALL=NOPASSWD: /var/www/TestVPN-scripts/adduser-vpn.sh
```

# Web Setup

To setup the website that uses these scripts follow the README in this repo:
https://github.com/TestVPN/TestVPN-web

# Tests and troubleshooting

Make sure you have a TUN device.

```
cd /var/www/TestVPN-scripts
./test.sh
```

