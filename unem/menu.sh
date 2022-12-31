#!/bin/bash
# ==========================================
ncrvpn="raw.githubusercontent.com/kuyaxxx/xray/main"
wget -O /usr/bin/menu "https://${ncrvpn}/unem/menu"
wget -O /usr/bin/add-xray "https://${ncrvpn}/unem/menu-xray/add-xray"
wget -O /usr/bin/del-xray "https://${ncrvpn}/unem/menu-xray/del-xray"

#
chmod +x /usr/bin/menu
chmod +x /usr/bin/add-xray
chmod +x /usr/bin/del-xray
