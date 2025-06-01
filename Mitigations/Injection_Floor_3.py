from time import sleep
from pymodbus.client import ModbusTcpClient
from bs4 import BeautifulSoup



modbusAddresses = {
    "Home_IR_Sensor":887,
}


def main():

    target = modbusAddresses['Home_IR_Sensor']
    val = 1

    client = ModbusTcpClient('192.168.8.2')
    client.connect()

    client.write_coil(target, val)

    client.close()
    
if __name__ == "__main__":
    main()
