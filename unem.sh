#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                  MENU UTAMA $wh"
echo -e "$y               Script Mod By NCR $wh"
echo -e "$y                 @KuyaxBatox $wh"
echo -e "$y-------------------------------------------------$wh"
echo -e "$yy 1$y.  XRAY VMESS MENU$wh"
echo -e "$yy 1$y.  XRAY VLESS MENU$wh"
echo -e "$yy 3$y.  XRAY TROJAN MENU$wh"
echo -e "$yy 4$y.  TROJAN GO MENU$wh"
echo -e "$yy 96$y. CEK SEMUA IP PORT$wh"
echo -e "$yy 97$y. CEK SEMUA SERVICE VPN$wh"
echo -e "$yy 98$y. Settings (Pengaturan)$wh"
echo -e "$yy 99$y. Exit (Keluar)$wh"
echo -e "$y-------------------------------------------------$wh"
read -p "Select From Options [ 1 - 99 ] : " menu
case $menu in
1)
clear
vmessmenu
;;
2)
clear
vlessmenu
;;
3)
clear
trmenu
;;
4)
clear
trgomenu
;;
96)
clear
ports
;;
97)
clear
services
;;
98)
clear
setting
;;
99)
clear
exit
;;
*)
clear
menu
;;
esac
