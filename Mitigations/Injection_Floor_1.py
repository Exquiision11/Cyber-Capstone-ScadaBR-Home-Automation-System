from time import sleep
from pymodbus.client import ModbusTcpClient
from bs4 import BeautifulSoup


modbusAddresses = {
    "Home_Mag_Lock":92, 	# unlock = 1, lock = 0
    "Home_Garage_Door":88,		# unlock = 1, lock = 0
	"Home_Alarm_Disable":909,
}


def main():

    target = modbusAddresses['Home_Alarm_Disable']
    val = 1
    
    target2 = modbusAddresses['Home_Mag_Lock']
    val2 = 1
    
    target3 = modbusAddresses['Home_Garage_Door']
    val3 = 1
    

    client = ModbusTcpClient('192.168.8.2')
    client.connect()

    client.write_coil(target, val)
    client.write_coil(target2, val2)
    client.write_coil(target3, val3)

    client.close()

if __name__ == "__main__":
    main()
