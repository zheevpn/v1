clear
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"

echo ""
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}BACKUP ${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] Backup Data Vps"         "${BICyan}[${BIWhite}03${BICyan}] Auto Backup Data"
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] Restore Data Vps"        "${BICyan}[${BIWhite}04${BICyan}] Back To Menu"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"

echo
echo -e "${BlueCyan}"
read -p    "selected Menu [ 1 / 4 ]└╼>>>   " bro

if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "backup" | lolcat
backup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script Bringas-tunnel"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Restore" | lolcat
restore
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script Bringas-tunnel"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
autobackup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script Bringas-tunnel"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
menu
fi
