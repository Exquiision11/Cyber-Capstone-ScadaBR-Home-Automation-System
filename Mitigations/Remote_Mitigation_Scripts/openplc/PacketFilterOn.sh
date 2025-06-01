sudo iptables -A INPUT -p tcp --dport 502 -s 192.168.8.1 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 502 -j DROP
