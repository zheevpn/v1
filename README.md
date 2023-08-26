<h1 style="text-align:center">
👇 Command For Install 👇
</h1>

<p style="text-align:center">Step 1 👇</p>
<code><pre>apt update && apt upgrade && reboot</code></pre>

<p style="text-align:center"> Step 2 👇</p>
<code><pre>sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/zheevpn/v1/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh</code></pre>
