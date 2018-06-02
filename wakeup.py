import time
import paho.mqtt.client as paho

broker="192.168.1.200"
port=1883
client1=paho.Client("control1")
client1.connect(broker,port)

client1.publish("blue1","127")
for i in range(0,127):
        client1.publish("red1",str(127-i))
        client1.publish("green1",str(127-(i/2)))
        time.sleep(.3)

client1.publish("red1","0")
for i in range(0,127):
        client1.publish("green1",str(min(64,127-i)))
        client1.publish("blue1",str(127-i))
        time.sleep(.3)
client1.publish("red1","0")
client1.publish("blue1","0")
client1.publish("green1","0")
