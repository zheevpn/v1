#!/bin/bash
# color validation
BICyan='\033[1;36m'
BIWhite='\033[1;37m'
NC='\033[0m'
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/zheevpn/myip/main/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
exit 0
fi
echo -e "check"
clear
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan} │  ${BICyan}[${BIWhite}01${BICyan}] Create Shadowsock   ""${BICyan}[${BIWhite}04${BICyan}] Check Shadowsock"
echo -e "${BICyan} │  ${BICyan}[${BIWhite}02${BICyan}] Delete Shadowsock   ""${BICyan}[${BIWhite}05${BICyan}] Triall Shadowsock"
echo -e "${BICyan} │  ${BICyan}[${BIWhite}03${BICyan}] Renew Shadowsock    ""${BICyan}[${BIWhite}06${BICyan}] Back to Menu"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo - ""
read -p "select Menu --- >>>  " opt
case $opt in
1) clear ; addss ; exit ;;
2) clear ; delss ; exit ;;
3) clear ; renewss ; exit ;;
4) clear ; cekss ; exit ;;
5) clear ; adds ; exit ;;
6) clear ; menu ;;
fi
