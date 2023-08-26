#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
BICyan='\033[1;36m'
BIWhite='\033[1;37m'
BIYellow='\033[1;33m
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
# ==========================================
# Getting
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
email=$(cat /home/email)
clear
if [[ "$email" = "" ]]; then
echo "input Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "                                        ${BIWhite}${UWhite}PROCCES BACKUP${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/xray backup/xray
cp -r /root/nsdomain backup/nsdomain
cp -r /etc/slowdns backup/slowdns
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
# Getting
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "       ${BIWhite}${UWhite}DETAIL${NC}"
echo -e "${BICyan}┌──────────────────────────────────────────┐${NC}"
echo -e "IP VPS                : $IP"
echo -e "LINK BACKUP  : $link"
echo -e "TANGGAL         : $date"
echo -e "${BICyan}└──────────────────────────────────────────┘${NC}"
| mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "       ${BIWhite}${UWhite}DETAIL${NC}"
echo -e "${BICyan}┌──────────────────────────────────────────┐${NC}"
echo -e "IP VPS                : $IP"
echo -e "LINK BACKUP  : $link"
echo -e "TANGGAL         : $date"
echo -e "${BICyan}└──────────────────────────────────────────┘${NC}"
echo "Cek pesan Yang di Kirimkan Ke $email"
