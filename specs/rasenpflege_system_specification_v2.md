# Intelligentes Rasenpflege-System (IRPS) - Systemspezifikation V2.0

## Dokumentenhistorie
- **V1.0**: 2025-09-01 - Initiale Spezifikation
- **V2.0**: 2025-09-01 - Konsolidierte Version mit eingearbeiteten Review-Ergebnissen, Testcase-Anforderungen und regulatorischen Updates

## 1. Systemübersicht

### 1.1 Systemzweck
Das Intelligente Rasenpflege-System (IRPS) ist ein autonomer, roboterbasierter Pflegecomplex für Rasenflächen, der über standardisiertes Mähen hinaus selektive Düngung, bedarfsgerechte Bewässerung und präventive Unkrautbekämpfung durch präzise Kartierung und situative Applikation ermöglicht.

### 1.2 Systemgrenzen

#### 1.2.1 Innerhalb der Systemgrenzen
- Autonomer Pflegeroboter mit Multifunktions-Payload
- Basisstation mit Lade- und Nachfüllinfrastruktur  
- Cloud-Backend für Datenanalyse und OTA-Updates
- Mobile Applikation für Nutzerinteraktion
- Integration zu bestehenden Bewässerungsanlagen
- Winterlagerungs- und Wartungsmodus

#### 1.2.2 Außerhalb der Systemgrenzen
- Externe Bewässerungsinfrastruktur (wird angesteuert)
- Wetterdatenlieferanten (werden konsumiert)
- Herstellung/Lieferung von Düngemitteln
- Grundlegende Rasenanlage und -geometrie
- Schneeräumung, Laubbeseitigung, Vertikutieren

### 1.3 System-Architektur-Anforderungen

#### 1.3.1 Produkt-Portfolio-Struktur
- **System MUSS in drei Architektur-Klassen entwickelt werden**: Entry-Level, Mid-Range, Premium
- **Gemeinsame Architektur-Basis**: Modulare Plattform für alle Klassen
- **Skalierbare Leistungsstufen**: Angepasst an Flächengrößen und Funktionsumfang
- **Einheitliche Software-Architektur**: Identische APIs und Schnittstellen über alle Klassen
- **Upgrade-Pfade**: Migration zwischen Klassen durch Hardware-/Software-Erweiterungen

#### 1.3.2 Flächenkapazität pro Architektur-Klasse
- **Entry-Level**: 200-800m² Zielmarkt
- **Mid-Range**: 800-1.500m² Zielmarkt  
- **Premium**: 1.500-2.500m² Zielmarkt (einzelner Durchgang)
- **Skalierung**: Multi-Roboter-Koordination für >2.500m² (V2.0)

#### 1.3.3 Architektur-Klassen-Differenzierung

| Merkmal | Entry-Level | Mid-Range | Premium |
|---------|-------------|-----------|----------|
| **Zielgruppe** | Kleine Gärten | Standard-Haushalte | Große Privatgärten |
| **Funktionsumfang** | Mähen + Basis-Analyse | + Selektive Düngung | + Vollausstattung |
| **Autonomie-Grad** | Semi-autonom | Voll-autonom | Intelligente Schwärme |
| **Integration** | Basis Smart-Home | Erweiterte Integration | Vollständiges Ecosystem |
| **Wartung** | Nutzer-Wartung | Service-unterstützt | Prädiktive Wartung |

#### 1.3.4 Klimatische Betriebsbedingungen
**Aktiver Betrieb:**
- **Temperatur Standard**: 0°C bis +45°C
- **Temperatur Erweitert**: -5°C bis +45°C (Höhenlagen-Modus)
- **Experimentell**: -10°C Kurzzeitbetrieb bei Sonneneinstrahlung (degradierte Batterieleistung akzeptiert)
- **Luftfeuchtigkeit**: 10-95% nicht-kondensierend
- **Windgeschwindigkeit**: <15km/h (Präzisionsmodus), <25km/h (Normalbetrieb), >25km/h (Abbruch)

**Lagerung/Wintermodus:**
- **Temperatur**: -20°C bis +60°C
- **Luftfeuchtigkeit**: 5-95% nicht-kondensierend
- **Batteriemanagement**: Automatische Erhaltungsladung bei 60-80%
- **Konservierung**: Automatische Systemversiegelung und Korrosionsschutz

## 2. Stakeholder & Compliance

### 2.1 Primäre Akteure
- **Endnutzer (Privatperson)**: Hausbesitzer mit 500-2.500m² Rasenfläche
- **Endnutzer (Gewerblich)**: Facility Manager, Hausmeister, Gartenbau-Services
- **Wartungstechniker**: Autorisiertes Servicepersonal
- **Haustiere**: Hunde, Katzen, Kleintiere (Sicherheitsrelevant)

### 2.2 Sekundäre Akteure
- **Cloud-Service**: Backend-Infrastruktur für Datenverarbeitung
- **Bewässerungsanlage**: Externe Sprinklersysteme (Hunter, Rain Bird, Gardena)
- **Wetterservice**: Meteorologische Datenlieferanten
- **Smart-Home-Systeme**: HomeKit, Alexa, Google Home, IFTTT
- **Regulatory Bodies**: Sicherheits-, EMV-, Umwelt-, Datenschutzbehörden

### 2.3 Regulatorische Anforderungen
- **EN 50636-2-107:2015+A3:2021**: Sicherheit für Roboter-Rasenmäher (inkl. Tierschutz)
- **ISO 13849-1**: Maschinensicherheit - Sicherheitsbezogene Teile von Steuerungen
- **IEC 60335-2-107**: Elektrische Sicherheit für Haushaltsgeräte
- **GDPR/DSGVO**: Datenschutz-Grundverordnung (Privacy-by-Design)
- **CE/FCC**: Elektromagnetische Verträglichkeit
- **IP65**: Staub- und Wasserschutz

### 1.4 Logische System-Architektur-Anforderungen

| Req-ID | Anforderung | Priorität | Anwendung |
|--------|-------------|-----------|----------|
| AR-001 | Modulare Hardware-Plattform für alle drei Klassen | MUSS | Kosteneinsparung |
| AR-002 | Einheitliche Software-Architektur (ROS 2 basiert) | MUSS | Wartbarkeit |
| AR-003 | Standardisierte Schnittstellen zwischen Subsystemen | MUSS | Erweiterbarkeit |
| AR-004 | Fail-Safe-Architektur für sicherheitskritische Funktionen | MUSS | Sicherheit |
| AR-005 | Edge-First-Computing mit Cloud-Augmentation | MUSS | Offline-Fähigkeit |
| AR-006 | Plugin-Architektur für Behandlungsmodule | SOLL | Flexibilität |
| AR-007 | Mikroservice-basierte Cloud-Architektur | SOLL | Skalierbarkeit |
| AR-008 | Container-basierte Software-Deployment | SOLL | DevOps |
| AR-009 | API-First-Design für Third-Party-Integration | SOLL | Ecosystem |
| AR-010 | Event-driven-Architecture für Echtzeit-Reaktionen | SOLL | Performance |

## 3. Funktionale Anforderungen

### 3.1 Navigation & Kartierung

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| FR-001 | RTK-GPS Navigation mit ±2cm Genauigkeit | MUSS | Test, Messung |
| FR-002 | Visual-SLAM als Backup bei GPS-Ausfall | MUSS | Test |
| FR-003 | Hinderniserkennung <30cm Entfernung | MUSS | Test |
| FR-004 | Personenerkennung (Erwachsene, Kinder >50cm) | MUSS | Sicherheitstest |
| FR-005 | Tiererkennung (Hunde, Katzen, Igel) | MUSS | EN 50636-2-107 |
| FR-006 | Kartierung <45min für 1000m² | SOLL | Performance-Test |
| FR-007 | Setup-Zeit <30min für Erstinstallation | SOLL | Usability-Test |
| FR-008 | Multi-Roboter-Koordination | KANN | V2.0 |

### 3.2 Mähfunktion

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| FR-010 | Mähgeschwindigkeit ≥500m²/h | MUSS | Messung |
| FR-011 | Zonenspezifische Schnitthöhen (3-7cm, ±5mm) | MUSS | Test |
| FR-012 | 98% Flächenabdeckung, <10% Überlappung | MUSS | Analyse |
| FR-013 | Mulchverteilung gleichmäßig | MUSS | Inspektion |
| FR-014 | Automatische Fortsetzung nach Ladung | MUSS | Test |
| FR-015 | Adaptive Modi: "Schnell" vs "Präzise" vs "Leise" | MUSS | Test |
| FR-016 | Kantenbearbeitung <5cm Randabstand | SOLL | Messung |

### 3.3 Analyse & Kartierung

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| FR-020 | NDVI-Analyse (Gesund >0.7, Mangel <0.5) | MUSS | Kalibrierung |
| FR-021 | Bodenfeuchtemessung ±5% Genauigkeit | MUSS | Vergleichstest |
| FR-022 | Chlorophyll-Gehalt-Messung | SOLL | Spektralanalyse |
| FR-023 | Temperaturkompensation für Sensoren | MUSS | Klimakammer |
| FR-024 | Krankheits-/Schädlingserkennung | KANN | KI-Validation |

### 3.4 Selektive Behandlung

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| FR-030 | Düngung mit ±2cm Positionsgenauigkeit | MUSS | Messung |
| FR-031 | 15-25% Düngemittel-Einsparung | MUSS | Feldtest |
| FR-032 | Tankkapazität: 500ml Flüssigdünger | MUSS | Spezifikation |
| FR-033 | Automatische Applikationssystem-Spülung | MUSS | Test |
| FR-034 | Wind-Abbruch bei >15km/h (Präzision) / >25km/h (Normal) | MUSS | Sensortest |

### 3.5 Bewässerungsintegration

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| FR-040 | Ventilsteuerung 24V AC kompatibel | MUSS | Integration |
| FR-041 | Zielfeuchte 60% ±10% erreichbar | MUSS | Feldtest |
| FR-042 | 15-25% Wassereinsparung | SOLL | Vergleich |
| FR-043 | Regenprognose-Integration | MUSS | Test |
| FR-044 | Durchfluss-Monitoring | SOLL | Sensor |

### 3.6 Unkrautbekämpfung

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| FR-050 | KI-Erkennung >90% Precision, >85% Recall | MUSS | ML-Test |
| FR-051 | <5% False Positives | MUSS | Validierung |
| FR-052 | 7+ Unkrautarten unterscheidbar | MUSS | Testset |
| FR-053 | Spot-Treatment ±1cm Genauigkeit | MUSS | Messung |
| FR-054 | Mechanische Entfernung Option | SOLL | Test |
| FR-055 | 60-80% Herbizid-Reduktion | SOLL | Vergleich |

## 4. Sicherheitsanforderungen

### 4.1 Personen- und Tierschutz

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| SR-001 | Hardware-Notaus-Taster am Gerät | MUSS | EN 50636-2-107 |
| SR-002 | App-Notaus <2s Reaktionszeit | MUSS | Test |
| SR-003 | Sprachbefehl "STOP" | MUSS | Test |
| SR-004 | Mähwerk-Sofortstopp bei Anheben | MUSS | Sicherheitstest |
| SR-005 | Kipp-Abschaltung bei >35° Neigung | MUSS | Test |
| SR-006 | Personenerkennung 50cm Kinder-Dummy | MUSS | EN 50636-2-107 |
| SR-007 | Tiererkennung (Igel-Test nach Oxford-Standard) | MUSS | Zertifizierung |
| SR-008 | Akustisches Warnsignal 60-80dB @1m | MUSS | Messung |
| SR-009 | Sensor-Reaktionszeit <500ms | MUSS | Test |
| SR-010 | Redundante Sicherheitssensoren | MUSS | ISO 13849-1 |

### 4.2 System- und Datensicherheit

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| SR-020 | GPS-Tracking bei Diebstahl | MUSS | Test |
| SR-021 | PIN-Code/Biometrie für Aktivierung | MUSS | Test |
| SR-022 | Verschlüsselte Datenübertragung (TLS 1.3) | MUSS | Audit |
| SR-023 | GDPR-konforme Datenspeicherung | MUSS | Compliance |
| SR-024 | Privacy-by-Design Architektur | MUSS | Review |
| SR-025 | Lokale Datenverarbeitung Option | SOLL | Test |
| SR-026 | OTA-Updates mit Signaturprüfung | MUSS | Security-Audit |

## 5. Leistungsanforderungen

### 5.1 Performance

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| PR-001 | Batterie-Autonomie ≥4h Normalbetrieb | MUSS | Test |
| PR-002 | Batterie-Autonomie ≥3h bei -5°C | SOLL | Klimakammer |
| PR-003 | Ladezeit <2h für 80% | MUSS | Messung |
| PR-004 | Max. Steigung 35° für 10min | MUSS | Feldtest |
| PR-005 | 2500m² in einem Durchgang | SOLL | Test |
| PR-006 | Behandlungsgeschwindigkeit ≥200m²/h | MUSS | Messung |

### 5.2 Reaktionszeiten

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| PR-010 | App-Latenz <2s (WiFi) | MUSS | Test |
| PR-011 | Cloud-Analyse <10s | MUSS | Test |
| PR-012 | Gewitter-Rückkehr <5min | MUSS | Test |
| PR-013 | Kaltstart bei -5°C <5min | SOLL | Klimakammer |
| PR-014 | System-Boot <30s bei Normaltemperatur | MUSS | Test |

## 6. Zuverlässigkeit & Wartung

### 6.1 Verfügbarkeit

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| RR-001 | Systemverfügbarkeit >95% (Saison) | MUSS | Monitoring |
| RR-002 | MTBF >1000 Betriebsstunden | MUSS | Langzeittest |
| RR-003 | MTTR <24h für kritische Defekte | MUSS | Service-SLA |
| RR-004 | Degraded-Mode bei Sensorausfall | MUSS | Test |
| RR-005 | Backup-Betrieb ohne Cloud | MUSS | Test |

### 6.2 Wartungsintervalle

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| RR-010 | Mähwerk-Service nach 200h | MUSS | Counter |
| RR-011 | Sensor-Kalibrierung nach 1000 Zyklen | MUSS | Automatisch |
| RR-012 | Täglicher Selbsttest | MUSS | Log |
| RR-013 | Wöchentliche Sensor-Kalibrierung | SOLL | Automatisch |
| RR-014 | Automatische Ersatzteil-Bestellung | KANN | IoT |

## 7. Umweltanforderungen

### 7.1 Betriebsumgebung

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| ER-001 | IP65 Schutzklasse | MUSS | Zertifizierung |
| ER-002 | Salznebeltest 48h bestanden | MUSS | Test |
| ER-003 | UV-Beständigkeit 500h | MUSS | Test |
| ER-004 | Vibrationsfestigkeit nach IEC 60068 | MUSS | Test |
| ER-005 | Schockfestigkeit 1m Fallhöhe | SOLL | Test |

### 7.2 Akustik & Emissionen

| Req-ID | Anforderung | Priorität | Verifizierung |
|--------|-------------|-----------|---------------|
| ER-010 | Lärmemission <60dB(A) @1m Tag | MUSS | Messung |
| ER-011 | Lärmemission <50dB(A) @1m Nacht | MUSS | Messung |
| ER-012 | EMV nach EN 55014-1/2 | MUSS | Zertifizierung |
| ER-013 | Adaptive Motorsteuerung tageszeitabhängig | MUSS | Test |

## 8. Use Cases (Aktualisiert)

### 8.1 UC01 - Initiale Rasenflächenkartierung (erweitert)

**Änderungen zu V1.0:**
- Setup-Zeit-Anforderung: <30 Minuten gesamt
- Kartierungszeit: <45 Minuten für 1000m²
- Tier-Erkennungszonen markieren
- Hangneigungsmessung und Gefahrenzonen

### 8.2 UC02 - Autonomes Präzisionsmähen (erweitert)

**Änderungen zu V1.0:**
- Adaptive Modi wählbar: "Schnell" / "Präzise" / "Leise"
- 98% Flächenabdeckung mit <10% Überlappung
- Automatische Fortsetzung nach Unterbrechung
- Tier-/Personenerkennung mit Warnsignal

### 8.3 UC03 - Selektive Bodenanalyse (erweitert)

**Änderungen zu V1.0:**
- NDVI-Schwellwerte konkretisiert
- Temperaturkompensation bei Extremwetter
- Degraded-Mode bei Sensorausfall definiert

### 8.4 UC04 - Bedarfsgerechte Düngung (erweitert)

**Änderungen zu V1.0:**
- Wind-Limits: <15km/h Präzision, <25km/h Normal, >25km/h Abbruch
- Tankkapazität 500ml spezifiziert
- Automatische Systemspülung nach jedem Einsatz

### 8.5 UC05 - Bewässerungssteuerung (präzisiert)

**Änderungen zu V1.0:**
- Zielfeuchte 60% ±10% definiert
- Integration spezifischer Hersteller (Hunter, Rain Bird, Gardena)
- Durchfluss-Monitoring ergänzt

### 8.6 UC06 - Unkrautbekämpfung (konkretisiert)

**Änderungen zu V1.0:**
- KI-Performance-Metriken definiert
- 7+ Unkrautarten spezifiziert
- Erfolgsmonitoring nach 7-14 Tagen

### 8.7 UC07 - Systemwartung (quantifiziert)

**Änderungen zu V1.0:**
- Konkrete Wartungsintervalle definiert
- Degraded-Mode-Verhalten spezifiziert
- Automatische Ersatzteilbestellung

### 8.8 UC08 - Wetter-Integration (erweitert)

**Änderungen zu V1.0:**
- Wind-Grenzwerte definiert
- Gewitter-Notfall-Protokoll (<5min)
- Frost-/Wintermodus spezifiziert

### 8.9 UC09 - Nutzer-Interaktion (erweitert)

**Änderungen zu V1.0:**
- GDPR-konforme Datenverarbeitung
- Sprachsteuerung für Notfall
- Presence-Detection-Integration

### 8.10 UC10 - Externe Integration (erweitert)

**Änderungen zu V1.0:**
- IFTTT-Support ergänzt
- Setup-Zeit <10min pro System
- Anwesenheitserkennung-Kopplung

### 8.11 UC11 - Winterlagerung (NEU)

**Beschreibung**: System bereitet sich automatisch auf Winterlagerung vor

**Hauptszenario**:
1. System erkennt Ende der Vegetationsperiode (Temp. <8°C konstant)
2. Finale Reinigung und Systemspülung
3. Batterie auf 60-80% Erhaltungsladung
4. Mechanische Versiegelung gegen Feuchtigkeit
5. Korrosionsschutz-Aktivierung
6. Periodische Selbsttests während Lagerung
7. Automatischer Frühjahrs-Check bei Temperaturanstieg

**Postconditions**:
- System konserviert für -20°C bis +60°C Lagerung
- Batterie-Gesundheit erhalten
- Sofort betriebsbereit im Frühjahr

### 8.12 UC12 - Multi-Roboter-Koordination (NEU, V2.0)

**Beschreibung**: Mehrere Roboter arbeiten koordiniert auf großen Flächen

**Hauptszenario**:
1. Master-Roboter erstellt Gesamtkarte
2. Arbeitszonen-Aufteilung nach Effizienz
3. Echtzeit-Koordination über Mesh-Netzwerk
4. Kollisionsvermeidung zwischen Robotern
5. Load-Balancing bei unterschiedlichen Batterieständen
6. Synchronisierte Behandlungsaktivitäten

## 9. Systemschnittstellen (erweitert)

### 9.1 Hardware-Schnittstellen
- **Ladestation**: Induktive Ladung, automatisches Docking
- **Notaus-Taster**: Mechanisch, fail-safe
- **Bewässerung**: 24V AC Ventile, Flow-Sensor
- **Wartung**: USB-C für lokale Diagnose
- **Sensoren**: I2C/SPI/UART für Erweiterungen

### 9.2 Software-Schnittstellen
- **OTA-Updates**: Signierte Firmware-Pakete
- **Cloud-APIs**: RESTful mit OAuth 2.0
- **Smart-Home**: HomeKit, Matter, Zigbee, MQTT
- **Voice-Control**: Alexa, Google Assistant, Siri
- **Automation**: IFTTT, Node-RED kompatibel
- **Wetter**: OpenWeatherMap, AccuWeather, DWD

### 9.3 Kommunikation
- **WiFi 6**: Dual-Band, WPA3
- **4G/5G**: Fallback mit eSIM
- **Bluetooth 5.2**: Setup und Nahbereich
- **LoRaWAN**: Sensor-Mesh optional
- **RTK-Korrektur**: NTRIP-Protocol

## 10. Testkriterien-Mapping

### 10.1 Kritische Tests (Release-Blocker)
- TC-SYS-001: Erstinstallation <30min
- TC-SAF-001: Alle Notaus-Funktionen
- TC-SAF-002: Personen-/Tiererkennung
- TC-ENV-001: Temperaturbereich-Tests
- TC-ENV-002: IP65-Zertifizierung

### 10.2 Akzeptanzkriterien V1.0
- Alle MUSS-Anforderungen: 100% erfüllt
- Alle Sicherheitstests: 100% PASS
- Performance-Ziele: >90% erreicht
- Verfügbarkeit: >95% im 7-Tage-Test
- Regulatory Compliance: Vollständig

## 11. Risiko-Mitigation Updates

### 11.1 Neu identifizierte Risiken
- **Tierverletzungen**: Oxford-Igel-Test implementieren
- **Extremkälte-Betrieb**: Batterie-Heizung für <0°C
- **Datenschutz-Verstöße**: Privacy-by-Design, lokale Verarbeitung
- **Vandalismusschäden**: Mechanischer Schutz, Alarm

### 11.2 Mitigationsstrategien
- Redundante Sicherheitssensoren
- Degraded-Mode für alle kritischen Komponenten
- OTA-Security-Updates binnen 24h
- Lokaler Betrieb ohne Cloud möglich

## 12. Compliance & Zertifizierung

### 12.1 Erforderliche Zertifikate
- CE-Kennzeichnung (EU)
- FCC Part 15 (USA)
- EN 50636-2-107:2015+A3:2021 (Sicherheit)
- IP65 (Umweltschutz)
- GDPR-Compliance-Zertifikat

### 12.2 Optionale Zertifikate
- "Hedgehog-Friendly" (Oxford-Standard)
- Blauer Engel (Umwelt)
- TÜV-Geprüft (Sicherheit)
- Energy Star (Effizienz)

## Anhang A: Requirements Traceability Matrix

[Vollständige RTM mit Mapping: Requirement ↔ Use Case ↔ Test Case ↔ Risiko]

## Anhang B: Glossar & Abkürzungen

- **IRPS**: Intelligentes Rasenpflege-System
- **RTK**: Real-Time Kinematic (GPS)
- **NDVI**: Normalized Difference Vegetation Index
- **MTBF**: Mean Time Between Failures
- **MTTR**: Mean Time To Repair
- **OTA**: Over-The-Air (Updates)
- **GDPR**: General Data Protection Regulation
- **SLAM**: Simultaneous Localization and Mapping

---

**Erstellt**: 2025-09-01  
**Version**: 2.0  
**Status**: Konsolidiert und reviewt  
**Freigabe**: Bereit für Architektur-Definition

Commit!