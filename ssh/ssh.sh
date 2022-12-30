#!/bin/bash
ncrvpn="https://raw.githubusercontent.com/kuyaxxx/xray/main/ssh"
#
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=infinity
organizationalunit=infinity
commonname=localhost
email=novi.cahyo.r@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "${ncrvpn}/password"
chmod +x /etc/pam.d/common-password

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target

END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local


# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

#OpenSSH
echo "Port 169" >> /etc/ssh/sshd_config
echo "Port 99" >> /etc/ssh/sshd_config
echo "Port 3369" >> /etc/ssh/sshd_config
echo "Port 2269" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart
wget -qO- -O /etc/ssh/sshd_config "${ncrvpn}/sshd_config"
systemctl restart sshd

#Dropbear
apt -y install dropbear
wget -O /etc/default/dropbear "${ncrvpn}/dropbear"
chmod 644 /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# Ganti Banner
wget -O /etc/issue.net "${ncrvpn}/issue.net"
/etc/init.d/ssh restart
/etc/init.d/dropbear restart

#echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
#echo "0 18 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root clearlog && reboot" >> /etc/crontab
#echo "0 13 * * * root clearlog && restart" >> /etc/crontab
