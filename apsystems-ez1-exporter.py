import requests
import argparse
import asyncio
import json
import socket
from APsystemsEZ1 import APsystemsEZ1M

# API-URL und API-Schlüssel
api_url = "https://public.api.deine-domain.de/api.php"
api_key = "geheimer-api-schlüssel"

# Wechselrichter IP-Adresse
inverter_ip = "192.168.XXX.XXX"

# Initialisiere den Wechselrichter
inverter = APsystemsEZ1M(inverter_ip, 8050)

def test_connection(ip, port=8050):
    """
    Testet die Verbindung zum Wechselrichter.
    """
    try:
        print(f"Teste Verbindung zu {ip}:{port}...")
        with socket.create_connection((ip, port), timeout=5):
            print(f"Verbindung zu {ip}:{port} erfolgreich.")
            return True
    except socket.timeout:
        print(f"Zeitüberschreitung beim Verbinden zu {ip}:{port}.")
    except ConnectionRefusedError:
        print(f"Verbindung zu {ip}:{port} wurde verweigert.")
    except OSError as e:
        print(f"Verbindungsfehler zu {ip}:{port}: {e}")
    return False

async def send_output_data():
    try:
        output_data = await inverter.get_output_data()
        payload = {
            'api_key': api_key,
            'endpoint': 'getOutputData',
            'data': {
                'p1': output_data.p1,
                'e1': output_data.e1,
                'te1': output_data.te1,
                'p2': output_data.p2,
                'e2': output_data.e2,
                'te2': output_data.te2
            }
        }
        response = requests.post(api_url, data=json.dumps(payload), headers={"Content-Type": "application/json"})
        if response.status_code == 200:
            print("Leistungsdaten erfolgreich gesendet.")
        elif response.status_code == 403:
            print("Authentifizierung fehlgeschlagen.")
        else:
            print("Fehler beim Senden der Leistungsdaten.")
    except Exception as e:
        print(f"Fehler beim Abrufen der Output-Daten: {e}")

async def send_alarm_data():
    try:
        alarm_data = await inverter.get_alarm_info()
        payload = {
            'api_key': api_key,
            'endpoint': 'getAlarmInfo',
            'data': {
                'offgrid': alarm_data.offgrid,
                'shortcircuit_1': alarm_data.shortcircuit_1,
                'shortcircuit_2': alarm_data.shortcircuit_2,
                'operating': alarm_data.operating
            }
        }
        response = requests.post(api_url, data=json.dumps(payload), headers={"Content-Type": "application/json"})
        if response.status_code == 200:
            print("Alarmdaten erfolgreich gesendet.")
        elif response.status_code == 403:
            print("Authentifizierung fehlgeschlagen.")
        else:
            print("Fehler beim Senden der Alarmdaten.")
    except Exception as e:
        print(f"Fehler beim Abrufen der Alarm-Daten: {e}")

async def send_device_info():
    try:
        device_info = await inverter.get_device_info()
        payload = {
            'api_key': api_key,
            'endpoint': 'getDeviceInfo',
            'data': {
                'deviceId': device_info.deviceId,
                'devVer': device_info.devVer,
                'ssid': device_info.ssid,
                'ipAddr': device_info.ipAddr,
                'minPower': device_info.minPower,
                'maxPower': device_info.maxPower
            }
        }
        response = requests.post(api_url, data=json.dumps(payload), headers={"Content-Type": "application/json"})
        if response.status_code == 200:
            print("Geräteinformationen erfolgreich gesendet.")
        elif response.status_code == 403:
            print("Authentifizierung fehlgeschlagen.")
        else:
            print("Fehler beim Senden der Geräteinformationen.")
    except Exception as e:
        print(f"Fehler beim Abrufen der Geräteinformationen: {e}")

async def send_total_energy_today():
    try:
        total_energy_today = await inverter.get_total_energy_today()
        payload = {
            'api_key': api_key,
            'endpoint': 'getTotalEnergyToday',
            'data': {
                'total_energy_today': total_energy_today
            }
        }
        response = requests.post(api_url, data=json.dumps(payload), headers={"Content-Type": "application/json"})
        if response.status_code == 200:
            print("Erzeugte Energie für heute erfolgreich gesendet.")
        elif response.status_code == 403:
            print("Authentifizierung fehlgeschlagen.")
        else:
            print("Fehler beim Senden der Energie für heute.")
    except Exception as e:
        print(f"Fehler beim Abrufen der Energie für heute: {e}")

async def send_total_energy_lifetime():
    try:
        total_energy_lifetime = await inverter.get_total_energy_lifetime()
        payload = {
            'api_key': api_key,
            'endpoint': 'getTotalEnergyLifetime',
            'data': {
                'total_energy_lifetime': total_energy_lifetime
            }
        }
        response = requests.post(api_url, data=json.dumps(payload), headers={"Content-Type": "application/json"})
        if response.status_code == 200:
            print("Gesamt erzeugte Energie erfolgreich gesendet.")
        elif response.status_code == 403:
            print("Authentifizierung fehlgeschlagen.")
        else:
            print("Fehler beim Senden der Energie für heute.")
    except Exception as e:
        print(f"Fehler beim Abrufen der Energie für heute: {e}")

async def send_device_power_status():
    try:
        device_power_status = await inverter.get_device_power_status()
        payload = {
            'api_key': api_key,
            'endpoint': 'getDevicePowerStatus',
            'data': {
                'device_power_status': device_power_status
            }
        }
        response = requests.post(api_url, data=json.dumps(payload), headers={"Content-Type": "application/json"})
        if response.status_code == 200:
            print("Gerätestatus für heute erfolgreich gesendet.")
        elif response.status_code == 403:
            print("Authentifizierung fehlgeschlagen.")
        else:
            print("Fehler beim Senden der Energie für heute.")
    except Exception as e:
        print(f"Fehler beim Abrufen der Energie für heute: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Sendet Daten vom Wechselrichter.")
    parser.add_argument('--daily', action='store_true', help="Sende Daten nur einmal täglich.")
    parser.add_argument('--minutely', action='store_true', help="Sende Daten alle 5 Minuten.")
    parser.add_argument('--test', action='store_true', help="Testet die Verbindung zum Wechselrichter.")
    args = parser.parse_args()

    async def main():
        if args.test:
            test_connection(inverter_ip)
        elif args.minutely:
            await send_output_data()
            await send_alarm_data()
            await send_total_energy_today()
            await send_total_energy_lifetime()
            # await send_device_power_status()
        elif args.daily:
            await send_device_info()
        else:
            print("Keine gültigen Argumente angegeben. Verwende --help für eine Übersicht.")

    asyncio.run(main())
