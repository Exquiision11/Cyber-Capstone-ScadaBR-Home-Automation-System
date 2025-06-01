from time import sleep
from pymodbus.client import ModbusTcpClient
from bs4 import BeautifulSoup


modbusAddresses = {
    "Home_Side_Mag_Lock":883,
    "Home_Motion_Sensor":885,
}


def main():

    target = modbusAddresses['Home_Side_Mag_Lock']
    val = 1
    
    target2 = modbusAddresses['Home_Motion_Sensor']
    val2 = 1

    client = ModbusTcpClient('192.168.8.2')
    client.connect()

    client.write_coil(target, val)
    client.write_coil(target2, val2)

    client.close()
    
if __name__ == "__main__":
    main()
