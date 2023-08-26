#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}DOMAIN${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] Change Domain"
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] Domain Cert"
echo -e "     ${BICyan}[${BIWhite}03${BICyan}] Back To Menu"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p " Select menu : " xyz
echo -e ""
case $xyz in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
3) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan" ; sleep 1 ; menu-domain ;;
esac
