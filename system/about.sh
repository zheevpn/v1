#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
aureb=$(cat /home/re_otm)
clear
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
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu



