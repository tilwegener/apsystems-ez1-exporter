--
-- Datenbank: `apsystems-ez1-exporter`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `alarm_data`
--

DROP TABLE IF EXISTS `alarm_data`;
CREATE TABLE `alarm_data` (
  `id` int(11) NOT NULL,
  `offgrid` float DEFAULT NULL,
  `shortcircuit_1` float DEFAULT NULL,
  `shortcircuit_2` float DEFAULT NULL,
  `operating` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_log`
--

DROP TABLE IF EXISTS `data_log`;
CREATE TABLE `data_log` (
  `id` int(11) NOT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `device_info`
--

DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info` (
  `id` int(11) NOT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `devVer` varchar(255) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `minPower` float DEFAULT NULL,
  `maxPower` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `device_power_status`
--

DROP TABLE IF EXISTS `device_power_status`;
CREATE TABLE `device_power_status` (
  `id` int(11) NOT NULL,
  `device_power_status` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `output_data`
--

DROP TABLE IF EXISTS `output_data`;
CREATE TABLE `output_data` (
  `id` int(11) NOT NULL,
  `p1` float DEFAULT NULL,
  `e1` float DEFAULT NULL,
  `te1` float DEFAULT NULL,
  `p2` float DEFAULT NULL,
  `e2` float DEFAULT NULL,
  `te2` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `total_energy_lifetime`
--

DROP TABLE IF EXISTS `total_energy_lifetime`;
CREATE TABLE `total_energy_lifetime` (
  `id` int(11) NOT NULL,
  `total_energy_lifetime` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `total_energy_today`
--

DROP TABLE IF EXISTS `total_energy_today`;
CREATE TABLE `total_energy_today` (
  `id` int(11) NOT NULL,
  `total_energy_today` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `alarm_data`
--
ALTER TABLE `alarm_data`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `data_log`
--
ALTER TABLE `data_log`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `device_info`
--
ALTER TABLE `device_info`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `device_power_status`
--
ALTER TABLE `device_power_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `output_data`
--
ALTER TABLE `output_data`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `total_energy_lifetime`
--
ALTER TABLE `total_energy_lifetime`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `total_energy_today`
--
ALTER TABLE `total_energy_today`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `alarm_data`
--
ALTER TABLE `alarm_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `data_log`
--
ALTER TABLE `data_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `device_info`
--
ALTER TABLE `device_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `device_power_status`
--
ALTER TABLE `device_power_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `output_data`
--
ALTER TABLE `output_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `total_energy_lifetime`
--
ALTER TABLE `total_energy_lifetime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `total_energy_today`
--
ALTER TABLE `total_energy_today`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
