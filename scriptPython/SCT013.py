from machine import ADC, Pin
import time
import math

# Configurações
ADC_PIN = 34  # GPIO do ESP32 com ADC (use um pino válido no seu microcontrolador)
NUM_SAMPLES = 1000
VREF = 3.3  # Tensão de referência do ADC
ADC_RESOLUTION = 4095  # 12 bits para ESP32

# Calibração específica do seu sensor e circuito
SENSOR_SENSITIVITY = 100.0  # mV/A (ajuste conforme o modelo e resistor de carga)

adc = ADC(Pin(ADC_PIN))
adc.atten(ADC.ATTN_11DB)  # Para faixa de leitura até ~3.3V
adc.width(ADC.WIDTH_12BIT)

def read_current():
    readings = []
    for _ in range(NUM_SAMPLES):
        reading = adc.read()
        readings.append(reading)
        time.sleep_us(200)  # Amostragem rápida (~5kHz)

    # Calcula a média
    avg = sum(readings) / NUM_SAMPLES

    # Calcula a soma dos quadrados das diferenças (RMS)
    sq_diff = [(val - avg)**2 for val in readings]
    mean_sq = sum(sq_diff) / NUM_SAMPLES
    rms = math.sqrt(mean_sq)

    # Converte para tensão
    voltage = (rms / ADC_RESOLUTION) * VREF

    # Converte tensão RMS para corrente (baseado na sensibilidade)
    current = (voltage * 1000) / SENSOR_SENSITIVITY  # em Amperes
    return current

while True:
    corrente = read_current()
    print("Corrente RMS: {:.2f} A".format(corrente))
    time.sleep(1)
