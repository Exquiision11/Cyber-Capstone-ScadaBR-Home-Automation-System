from time import sleep
from pymodbus.client import ModbusTcpClient
from bs4 import BeautifulSoup


modbusAddresses = {
    "Home_Mag_Lock":92, 	
    "Home_Garage_Door":88,		
	"Home_Alarm_Disable":909,
	"Home_Side_Mag_Lock":883,
    "Home_Motion_Sensor":885,
    "Home_IR_Sensor":887,
}


def main():
    
    target = modbusAddresses['Home_Mag_Lock']
    val = 0
    
    target2 = modbusAddresses['Home_Garage_Door']
    val2 = 0
    
    target3 = modbusAddresses['Home_Side_Mag_Lock']
    val3 = 0
    
    target4 = modbusAddresses['Home_Motion_Sensor']
    val4 = 0
    
    target5 = modbusAddresses['Home_IR_Sensor']
    val5 = 0
    
    target6 = modbusAddresses['Home_Alarm_Disable']
    val6 = 0
    
    #target7 = 
    #val7 = 1

    client = ModbusTcpClient('192.168.8.2')
    client.connect()

    client.write_coil(target, val)
    client.write_coil(target2, val2)
    client.write_coil(target3, val3)
    client.write_coil(target4, val4)
    client.write_coil(target5, val5)
    client.write_coil(target6, val6)
    #client.write_coil(target7, val7)

    client.close()
    
if __name__ == "__main__":
    main()
