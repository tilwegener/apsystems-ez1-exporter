# Wechselrichter-Integration mit APsystemsEZ1M

Dieses Python-Skript dient zur Kommunikation mit einem APsystems Wechselrichter (Modell EZ1-M). Es ermöglicht die Verbindung zum Wechselrichter, den Abruf von Daten sowie die Übertragung dieser Daten mittels PHP API an eine MySQL Datenbank.

## Funktionen

- Datenerfassung vom Wechselrichter.
- Übertragung der gesammelten Daten an eine PHP API.
- Eintragung der gesammelten Daten in eine MySQL Datenbank.

## Voraussetzungen

### Installierte Software:
- Python 3.11 oder höher
- Folgende Python-Bibliotheken:
  - `requests`
  - `asyncio`
  - `argparse`
  - `json`
- Bibliothek für die Wechselrichter-Kommunikation: `APsystemsEZ1` (https://github.com/SonnenladenGmbH/APsystems-EZ1-API)

### Hardware:
- Wechselrichter der Marke APsystems, Modell EZ1-M im lokalen Modus und im Netzwerk erreichbar.
  - Den lokalen Modus kann man nur in Version >=1.6.0 aktivieren, bei vielen Herstellern wie z.B Zendure kann ein Update auf höhere Versionen nur durch den APSystems Support (diy_support.emea@apsystems.com) angestoßen werden.
- Raspberry Pi oder Linux Server
- Webserver mit PHP 8.2
- MySQL Datenbank

## Installation

1. Klone das Repository:
   ```bash
   git clone https://github.com/tilwegener/apsystems-ez1-exporter.git
   cd apsystems-ez1-exporter
   ```

2. Installiere die benötigten Python-Bibliotheken:
   ```bash
   pip install -r requirements.txt
   ```

## Nutzung

### Verbindung testen
Um zu prüfen, ob der Wechselrichter erreichbar ist, führe folgenden Befehl aus:
```bash
python3 apsystems-ez1-exporter.py --test
```
Dabei wird eine Verbindung zum Wechselrichter hergestellt und das Ergebnis in der Konsole ausgegeben.

### Datenverarbeitung (zukünftige Funktionen)
Das Skript kann erweitert werden, um gesammelte Daten zu analysieren oder an die API zu senden.

## Konfiguration

### API
Die API-URL und der API-Schlüssel können direkt im Skript geändert werden:
```python
api_url = "https://public.api.deine-domain.de/api.php"
api_key = "geheimer-api-schlüssel"
```

### Wechselrichter
Die IP-Adresse und der Port des Wechselrichters werden ebenfalls im Skript definiert:
```python
inverter_ip = "192.168.XXX.XXX"
```

## Fehlerbehebung

### Häufige Fehler:
- **`ConnectionRefusedError`, `No route to host` oder `timeout`:** Der Wechselrichter ist nicht erreichbar bzw. derzeit ausgeschalten. Stelle sicher, dass die IP-Adresse und der Port korrekt sind.
- **Bibliotheken nicht installiert:** Stelle sicher, dass alle benötigten Bibliotheken mit `pip install -r requirements.txt ` installiert wurden.

## Lizenz

Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).

## Mitwirken

Beiträge sind willkommen! Erstelle einfach ein Issue oder sende einen Pull-Request.

## Autor

Copyright (c) 2025 Til Wegener
