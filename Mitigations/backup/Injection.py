from pymodbus.client import ModbusTcpClient

client = ModbusTcpClient('192.168.8.2')
client.connect()
client.write_coil(803, 0)
result = client.read_coils(803,1)
print(result.bits[0])
client.close()