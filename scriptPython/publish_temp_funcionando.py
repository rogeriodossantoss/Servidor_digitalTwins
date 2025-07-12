import time
import machine
from umqtt.simple import MQTTClient
import random
from machine import Pin
from time import sleep
import dht
import math

sensor = dht.DHT22(Pin(23))


# Com este arquivo vamos public as informações no bronker
# Default MQTT server to connect to
SERVER = "10.31.2.66"
PORT = 1883
CLIENT_ID = "teste"
TOPIC = "temperatura"
    
while True:
  mqttClient = MQTTClient(CLIENT_ID, SERVER, PORT, keepalive=60)
  mqttClient.connect()
  print(f"Connected to MQTT  Broker :: {SERVER}")  
  while True:
        try:
          sleep(2)
          sensor.measure()
          temp = sensor.temperature()
          hum = sensor.humidity()
          temp_f = temp * (9/5) + 32.0
          temperatura=temp
          print('Temperature: %3.1f C' %temp)
          print('Temperature: %3.1f F' %temp_f)
          print('Humidity: %3.1f %%' %hum)
          random_temp = temp
          print(f"Publishing temperature :: {random_temp}")
          mqttClient.publish(TOPIC, str(random_temp).encode())
          time.sleep(3)
        except OSError as e:
          print('Failed to read sensor.')    
        
