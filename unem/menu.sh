#!/bin/bash
# ==========================================
ncrvpn="raw.githubusercontent.com/kuyaxxx/xray/main"
wget -O /usr/bin/menu "https://${ncrvpn}/unem/menu"
wget -O /usr/bin/traffic "https://${ncrvpn}/unem/traffic"
wget -O /usr/bin/menu-xray "https://${ncrvpn}/unem/menu-xray"
wget -O /usr/bin/add-xray "https://${ncrvpn}/unem/menu-xray/add-xray"
wget -O /usr/bin/menu-xray "https://${ncrvpn}/unem/menu-ssh"

#
chmod +x /usr/bin/menu
chmod +x /usr/bin/traffic
chmod +x /usr/bin/menu-xray
chmod +x /usr/bin/add-xray
chmod +x /usr/bin/menu-ssh
