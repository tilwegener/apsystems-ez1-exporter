<?php

// API-Schlüssel definieren
define('API_KEY', 'geheimer-api-schlüssel');

// Verbindung zur Datenbank herstellen
$host = "localhost";  
$user = "datenbank_benutzer";   
$pass = "datenbank_passwort";   
$dbname = "datenbank_name";  

$db = new mysqli($host, $user, $pass, $dbname);

// Prüfen, ob die Verbindung erfolgreich war
if ($db->connect_error) {
    die("Verbindung fehlgeschlagen: " . $db->connect_error);
}

$input = file_get_contents('php://input');
$data = json_decode($input, true);

// Überprüfen, ob der API-Schlüssel korrekt ist
if (!isset($data['api_key']) || $data['api_key'] !== API_KEY) {
    http_response_code(403); // Antwort mit "403 Forbidden"
    die("Unbefugter Zugriff: Ungültiger API-Schlüssel.");
}

// Empfangen der Daten
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($data)) {
    $endpoint = $data['endpoint'];

    // Verarbeitung je nach Endpunkt
    if ($endpoint == "getOutputData") {
		
		$output = $data['data'];
		
        $p1 = $output['p1'];
        $e1 = $output['e1'];
        $te1 = $output['te1'];
        $p2 = $output['p2'];
        $e2 = $output['e2'];
        $te2 = $output['te2'];

        // Insert-Query für die Tabelle `output_data`
        $query = "INSERT INTO output_data (p1, e1, te1, p2, e2, te2) 
                  VALUES ('$p1', '$e1', '$te1', '$p2', '$e2', '$te2')";
        if ($db->query($query) === TRUE) {
            echo "Leistungsdaten erfolgreich gespeichert.";
        } else {
            echo "Fehler beim Speichern der Leistungsdaten: " . $db->error;
        }

    } elseif ($endpoint == "getAlarmInfo") {

		$alarm = $data['data'];
		
        $og = $alarm['offgrid'];
        $isce1 = $alarm['shortcircuit_1'];
        $isce2 = $alarm['shortcircuit_2'];
        $oe = $alarm['operating'];

        // Insert-Query für die Tabelle `alarm_data`
        $query = "INSERT INTO alarm_data (offgrid, shortcircuit_1, shortcircuit_2, operating) 
                  VALUES ('$og', '$isce1', '$isce2', '$oe')";
        if ($db->query($query) === TRUE) {
            echo "Alarmdaten erfolgreich gespeichert.";
        } else {
            echo "Fehler beim Speichern der Alarmdaten: " . $db->error;
        }

    } elseif ($endpoint == "getDeviceInfo") {
		
		$device = $data['data'];
		
        $deviceId = $device['deviceId'];
        $devVer = $device['devVer'];
        $ssid = $device['ssid'];
        $ipAddr = $device['ipAddr'];
        $minPower = $device['minPower'];
        $maxPower = $device['maxPower'];

        // Insert-Query für die Tabelle `device_info`
        $query = "INSERT INTO device_info (deviceId, devVer, ssid, ipAddr, minPower, maxPower) 
                  VALUES ('$deviceId', '$devVer', '$ssid', '$ipAddr', '$minPower', '$maxPower')";
        if ($db->query($query) === TRUE) {
            echo "Geräteinformationen erfolgreich gespeichert.";
        } else {
            echo "Fehler beim Speichern der Geräteinformationen: " . $db->error;
        }

    } elseif ($endpoint == "getTotalEnergyToday") {
		
		$total_energy_today = $data['data']['total_energy_today'];

        // Insert-Query für die Tabelle `total_energy_today`
        $query = "INSERT INTO total_energy_today (total_energy_today) 
                  VALUES ('$total_energy_today')";
        if ($db->query($query) === TRUE) {
            echo "Energie für heute erfolgreich gespeichert.";
        } else {
            echo "Fehler beim Speichern der Energie für heute: " . $db->error;
        }

    } elseif ($endpoint == "getTotalEnergyLifetime") {
		
		$total_energy_lifetime = $data['data']['total_energy_lifetime'];

        // Insert-Query für die Tabelle `total_energy_lifetime`
        $query = "INSERT INTO total_energy_lifetime (total_energy_lifetime) 
                  VALUES ('$total_energy_lifetime')";
        if ($db->query($query) === TRUE) {
            echo "Gesamt erzeugte Energie erfolgreich gesendet.";
        } else {
            echo "Fehler beim Speichern der Energie für heute: " . $db->error;
        }
	
	} elseif ($endpoint == "getDevicePowerStatus") {
		
		$device_power_status = $data['data']['device_power_status'];

        // Insert-Query für die Tabelle `device_power_status`
        $query = "INSERT INTO device_power_status (device_power_status) 
                  VALUES ('$device_power_status')";
        if ($db->query($query) === TRUE) {
            echo "Gerätestatus für heute erfolgreich gesendet.";
        } else {
            echo "Fehler beim Speichern der Energie für heute: " . $db->error;
        }
	
	} else {
        echo "Unbekannter Endpunkt.";
    }

    // Log-Daten speichern
    $log_data = json_encode($data);
    $log_query = "INSERT INTO data_log (endpoint, data) VALUES ('$endpoint', '$log_data')";
    if ($db->query($log_query) !== TRUE) {
        echo "Fehler beim Speichern der Log-Daten: " . $db->error;
    }

} else {
    echo "Keine gültigen Daten empfangen.";
}

// Verbindung schließen
$db->close();
?>
