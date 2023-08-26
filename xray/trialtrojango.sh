MYIP=$(wget -qO- ipinfo.io/ip)
domain=$(cat /etc/xray/domain)
trgo="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan-go://${uuid}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojango#$user"
link1="trojan://${uuid}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojango#$user"
clear
echo "=========- TRIALL TROJAN-GO -========="
echo ""
echo -e "Remarks    : ${user}"
echo -e "IP/Host    : ${MYIP}"
echo -e "Address    : ${domain}"
echo -e "Port       : ${trgo}"
echo -e "Key        : ${uuid}"
echo -e "Encryption : none"
echo -e "Path       : /trojango"
echo ""
echo -e "━━━━━━━━━"
echo -e "Link TrGo  			: ${link}"
echo -e "━━━━━━━━━"
echo -e "Link TrGo (v2ray): ${link1}"
echo -e "━━━━━━━━━"
echo -e "Expired                  : $exp"
echo -e "━━━━━━━━━"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
