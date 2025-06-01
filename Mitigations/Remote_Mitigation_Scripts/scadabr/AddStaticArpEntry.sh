# Flush Arp Cache
sudo ip link set arp off dev eth0 ; sudo ip link set arp on dev eth0

# Set Static ARP Entry
sudo arp -i eth0 -s 192.168.8.2 b8:27:eb:7d:5c:24 
