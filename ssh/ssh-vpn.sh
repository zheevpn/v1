#!/bin/bash
#
# ==================================================

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
locality=none
organization=none
organizationalunit=none
commonname=none
email=andyyuda51@gmail.com

# simple password minimal
curl -sS https://raw.githubusercontent.com/Bringas-tunnel/v6/main/plugin/password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
chmod +x /usr/bin//etc/pam.d/common-password

# go to root
cd

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
chmod +x /usr/bin//etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

#install jq
apt -y install jq

#install shc
apt -y install shc

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config


install_ssl(){
    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            else
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            fi
    else
        yum install -y nginx certbot
        sleep 3s
    fi

    systemctl stop nginx.service

    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            else
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            fi
    else
        echo "Y" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
        sleep 3s
    fi
}

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
# nginx.conf
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/plugin/nginx.conf"
mkdir -p /home/vps/public_html
/etc/init.d/nginx restart

# install badvpn
cd
# newudgpw
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/plugin/newudpgw"
chmod +x /usr/bin//usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
/etc/init.d/ssh restart

echo "=== Install Dropbear ==="
# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart

cd
# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:22

[dropbear]
accept = 777
connect = 127.0.0.1:109

[ws-stunnel]
accept = 2096
connect = 700

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart


# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
# install Deflate
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
sleep 1
echo -e "[ ${green}INFO$NC ] Settings banner"
wget -q -O /etc/issue.net "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/issue.net"
chmod +x /usr/bin//etc/issue.net
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

#install bbr dan optimasi kernel
# wget https://raw.githubusercontent.com/artanodrop/v4/main/ssh/bbr.sh && chmod +x /usr/bin/bbr.sh && ./bbr.sh
######## install bbr ########
wget https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/bbr.sh && chmod +x /usr/bin/bbr.sh && ./bbr.sh

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
# menu
wget -O menu "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu.sh"
wget -O menu-trial "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-vless.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-trojan.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-ssh.sh"
wget -O menu-manager "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-manager.sh"
wget -O menu-set "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-domain.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-webmin.sh"
# theme
wget -O menu1 "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/theme/menu1.sh"
wget -O menu2 "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/theme/menu2.sh"
wget -O menu3 "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/theme/menu3.sh"
# menu ssh ovpn
wget -O usernew "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/tendang.sh"
wget -O xp "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/xp.sh"
wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/Bringas-tunnel/v6/ssh/user-lock.sh"
wget -q -O /usr/bin/unlock "https://raw.githubusercontent.com/Bringas-tunnel/v6/ssh/user-unlock.sh"
# sodosok
wget -O adds "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/adds.sh"
wget -O cekss "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/cekss.sh"
wget -O renewss "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/renewss.sh"
wget -O delss "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/delss.sh"
wget -O addssr "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/addssr.sh"
wget -O renewssr"https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/renewssr.sh"
wget -O ssrmu "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/ssrmu.sh"
wget -O ssr "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/sodosok/ssr.sh"
# xray
wget -O certv2ray "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/xray/certv2ray.sh"
# change port
wget -O port-ssl "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/prot/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/prot/port-ovpn.sh"
wget -O port-change "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/prot/port-change.sh"
# system
wget -O acs-set "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/acs-set.sh"
wget -O speedtest "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/speedtest_cli.py"
wget -O auto-reboot "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/restart.sh"
wget -O bw "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/bw.sh"
wget -O running "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/clearcache.sh"
wget -O about "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/about.sh"
wget -O jam "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/jam.sh"
wget -O add-host "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/add-host.sh"
wget -O status "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/status.sh"
wget -O slow "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/slow.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/system/update.sh"
# backup
wget -O sshws "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/ssh/sshws.sh"
wget -O menu-backup "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/menu/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/Bringas-tunnel/v6/main/backup/restore.sh"
# xolpanel
wget -q -O /usr/bin/xolpanel "https://raw.githubusercontent.com/Bringas-tunnel/xolpanel/main/xolpanel.sh"
# chmod menu
chmod +x /usr/bin/menu
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-trial
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-trgo
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-manager
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/menu-domain
chmod +x /usr/bin/menu-sodosok
#theme
chmod +x /usr/bin/menu1
chmod +x /usr/bin/menu2
chmod +x /usr/bin/menu3
# chmod sodosok
chmod +x /usr/bin/addss
chmod +x /usr/bin/cekss
chmod +x /usr/bin/delss
chmod +x /usr/bin/renewss
chmod +x /usr/bin/addssr
chmod +x /usr/bin/renewssr
chmod +x /usr/bin/delssr
chmod +x /usr/bin/ssr
# chmod system
chmod +x /usr/bin/running
chmod +x /usr/bin/clearcache
chmod +x /usr/bin/add-host
chmod +x /usr/bin/menu-webmin
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/about
chmod +x /usr/bin/auto-reboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/bw
chmod +x /usr/bin/status
chmod +x /usr/bin/acs-set
chmod +x /usr/bin/update
chmod +x /usr/bin/jam
# chmod xray
chmod +x /usr/bin/certv2ray
# chmod ssh
chmod +x /usr/bin/usernew
chmod +x /usr/bin/trial
chmod +x /usr/bin/renew
chmod +x /usr/bin/hapus
chmod +x /usr/bin/cek
chmod +x /usr/bin/xp
chmod +x /usr/bin/member
chmod +x /usr/bin/delete
chmod +x /usr/bin/usr/bin/autokill
chmod +x /usr/bin/usr/bin/ceklim
chmod +x /usr/bin/usr/bin/tendang
chmod +x /usr/bin/usr/bin/lock
chmod +x /usr/bin/usr/bin/unlock
chmod +x /usr/bin/sshws
# chmod prot
chmod +x /usr/bin/port-ssl
chmod +x /usr/bin/port-ovpn
chmod +x /usr/bin/port-change
# chmod backup
chmod +x /usr/bin/backup
chmod +x /usr/bin/restore
# chmod xolpanel
chmod +x /usr/bin//usr/bin/xolpanel
cd

cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 2 * * * root /sbin/reboot
END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

# remove unnecessary files
sleep 1
echo -e "[ ${green}INFO$NC ] Clearing trash"
apt autoclean -y >/dev/null 2>&1

if dpkg -s unscd >/dev/null 2>&1; then
apt -y remove --purge unscd >/dev/null 2>&1
fi

apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "$yell[SERVICE]$NC Restart All service SSH & OVPN"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx"
/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/ssh restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat "
/etc/init.d/squid restart >/dev/null 2>&1

screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile


rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh
rm -f /root/ssrmu.sh

# finihsing
clear
