# TestVPN-scripts
A repo holding all scripts that run TestVPN

# Setup

Place this repository at ``/var/www/``

```
cd /var/www/
git clone https://github.com/TestVPN/TestVPN-scripts
cd html
git clone https://github.com/TestVPN/TestVPN-web
apt install openvpn
```

Then set the root path of apache to /var/www/html/TestVPN-web


Add this line to your ``visudo`` to allow the apache server to create a user.
```
www-data        ALL=NOPASSWD: /var/www/TestVPN-scripts/adduser-vpn.sh
```
