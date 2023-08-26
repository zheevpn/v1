#!/bin/bash
IPVPS=$(curl -s ipinfo.io/ip )
BLACK='\033[1;90m'      # HITAM
RED='\033[1;91m'        # MERAH
GREEN='\033[1;92m'      # HIJAU
YELLOW='\033[1;93m'     # KUNING
BLUE='\033[1;94m'       # BIRU
PURPLE='\033[1;95m'     # UNGU
CYAN='\033[1;96m'       # Cyan
WHITE='\033[1;97m'      # White
#
##### UNDERLINE #####
#
Ublack='\033[4;90m'      # HITAM
Ured='\033[4;91m'        # MERAH
Ugreen='\033[4;92m'      # HIJAU
Uyellow='\033[4;93m'     # KUNING
Ublue='\033[4;94m'       # BIRU
Upurple='\033[4;95m'     # UNGU
Ucyan='\033[4;96m'       # Cyan
Uwhite='\033[4;37m'       # White
# penutup warna
NC='\e[0m'
###################
# UNDERLINE code : 4
# TEXT TERANG code : 1
###################
# install UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
#
clear
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "                                               ${Uwhite} 𝗦𝗘𝗧𝗧𝗜𝗡𝗚 𝗠𝗔𝗡𝗔𝗚𝗘𝗥 ${NC}       "
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan} │${NC}   ${BICyan}[${BIWhite}01${BICyan}] BACKUP DATA             ${NC}""${BICyan}[${BIWhite}06${BICyan}] UPDATE SCRIPT      ${NC}"
echo -e "${BICyan} │${NC}   ${BICyan}[${BIWhite}02${BICyan}] CHECK BANDWITH    ${NC}""${BICyan}[${BIWhite}07${BICyan}] CHANGE THEME    ${NC}"
echo -e "${BICyan} │${NC}   ${BICyan}[${BIWhite}03${BICyan}] CHANGE DOMAIN      ${NC}""${BICyan}[${BIWhite}08${BICyan}] SETING REBOOT     ${NC}"
echo -e "${BICyan} │${NC}   ${BICyan}[${BIWhite}04${BICyan}] RESTART SERVICE     ${NC}""${BICyan}[${BIWhite}09${BICyan}] INSTALL BOT            ${NC}"
echo -e "${BICyan} │${NC}   ${BICyan}[${BIWhite}05${BICyan}] CLEAR CACHE             ${NC}""${BICyan}[${BIWhite}10${BICyan}] INSTALL UDP            ${NC}"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e "                                          ${GREEN} [ ketik angka 0 Back To Menu ]     ${NC}"
echo
read -p " select [ 1 / 10 ] ---- >>     " otw
echo -e ""
case $otw in
1) clear ; menu-backup ;;
2) clear ; bw ;;
3) clear ; menu-domain ;;
4) clear ; restart ;;
5) clear ; clearcache ;;
6) clear ; updatemenu ;;
7) clear ; menu-theme ;;
8) clear ; jam ;;
9) clear ; xolpanel ;;
10) clear ; clear ; wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
6969) clear ; wget https://raw.githubusercontent.com/zheevpn/v1/main/system/update.sh && chmod +x update.sh && ./update.sh && rm -f /root/update.sh ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "salah Pencet" ; sleep 1 ; menu-manager ;;
esac
