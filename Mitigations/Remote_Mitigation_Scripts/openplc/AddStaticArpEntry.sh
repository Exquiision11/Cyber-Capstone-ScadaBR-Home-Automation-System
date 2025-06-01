# Flush Arp Cache
sudo ip link set arp off dev eth0 ; sudo ip link set arp on dev eth0

# Set Static ARP Entry
sudo arp -i eth0 -s 192.168.8.1 b8:27:eb:17:03:e1 
