ssh scadabr@192.168.8.1 /home/scadabr/Mitigations/AddStaticArpEntry.sh
ssh openplc@192.168.8.2 /home/openplc/Mitigations/AddStaticArpEntry.sh

# Clear Host ARP table so it doesn't get confused
sudo arp -d 192.168.8.1
