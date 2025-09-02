# IRPS System Test Specification

## 1. Test-Strategie & Scope

### 1.1 Test-Level-Definition
- **Unit Tests**: Komponenten-Level (Sensoren, Aktoren, Software-Module)
- **Integration Tests**: Subsystem-Interfaces (Roboter↔Cloud, App↔System)
- **System Tests**: End-to-End Use Cases
- **Acceptance Tests**: Nutzer-Szenarien in realer Umgebung
- **Performance Tests**: Last-, Stress- und Dauertests
- **Safety Tests**: Sicherheitskritische Funktionen

### 1.2 Test-Umgebungen
1. **Labor-Umgebung**: Kontrollierte Bedingungen, Messgeräte
2. **Test-Garten**: 1000m² mit definierten Hindernissen und Zonen
3. **Feldtest-Sites**: 3 reale Kundenumgebungen (Klein/Mittel/Groß)
4. **Klimakammer**: Temperatur-/Feuchtigkeits-Tests
5. **EMV-Labor**: Elektromagnetische Verträglichkeit

## 2. System-Level Testcases

### 2.1 TC-SYS-001: Erstmalige Systemkonfiguration und Kartierung

**Referenz**: UC01  
**Priorität**: Kritisch  
**Vorbedingungen**: 
- Fabrikneuer Roboter
- Test-Garten 1000m² mit 5 Hindernissen, 3 Zonen
- RTK-GPS-Referenzstation aktiv

**Testschritte**:
1. Roboter aus Verpackung entnehmen und Basisstation aufstellen
2. Mobile App installieren und Roboter via Bluetooth koppeln
3. WiFi-Credentials eingeben und Cloud-Verbindung herstellen
4. Kartierungsmodus starten und Roboter losschicken
5. Nach Abschluss: Karte in App überprüfen und Zonen annotieren
6. Manuelle Korrektur einer Grenze durchführen
7. Finale Karte speichern

**Erwartete Ergebnisse**:
- Setup-Zeit <30 Minuten
- Kartierung komplett in <45 Minuten für 1000m²
- GPS-Genauigkeit: 95% der Punkte <2cm Abweichung
- Alle 5 Hindernisse korrekt erkannt
- Zonenklassifikation korrekt

**Pass/Fail-Kriterien**:
- PASS: Alle Schritte erfolgreich, Zeiten eingehalten
- FAIL: Setup >45min, GPS-Abweichung >2cm, Hindernisse übersehen

---

### 2.2 TC-SYS-002: Autonomes Mähen mit Hindernisumfahrung

**Referenz**: UC02  
**Priorität**: Kritisch  
**Vorbedingungen**:
- System kartiert und konfiguriert
- Batterie 100% geladen
- 3 neue temporäre Hindernisse platziert

**Testschritte**:
1. Mähauftrag via App starten (Schnitthöhe Zone 1: 3cm, Zone 2: 4cm, Zone 3: 5cm)
2. Roboter-Navigation und Mähvorgang beobachten
3. Nach 50% Fortschritt: Spielzeug in Fahrtweg legen
4. Reaktion auf neues Hindernis dokumentieren
5. Batterie auf 20% entladen lassen
6. Rückkehr zur Ladestation beobachten
7. Nach Aufladung: Automatische Fortsetzung prüfen

**Erwartete Ergebnisse**:
- Mähgeschwindigkeit ≥500m²/h
- Schnitthöhen ±5mm genau
- Hinderniserkennung <30cm, sanftes Ausweichen
- Automatische Ladung bei <25% Batterie
- Lückenlose Fortsetzung nach Ladung
- 98% Flächenabdeckung ohne >10% Überlappung

**Pass/Fail-Kriterien**:
- PASS: Alle Parameter erfüllt, keine Kollisionen
- FAIL: Kollision mit Hindernis, Schnitthöhe >5mm Abweichung

---

### 2.3 TC-SYS-003: Nährstoffkartierung und selektive Düngung

**Referenz**: UC03, UC04  
**Priorität**: Hoch  
**Vorbedingungen**:
- Testfläche mit 3 vordefinierten Mangel-Bereichen präpariert
- Düngemittel-Tank gefüllt (500ml Flüssigdünger)
- Multispektral-Sensoren kalibriert

**Testschritte**:
1. Analyse-Modus starten für Nährstoffkartierung
2. Roboter scannt komplette Fläche mit Multispektral-Sensoren
3. NDVI-Karte in App überprüfen (Mangelbereiche sichtbar?)
4. Düngungsplan automatisch erstellen lassen
5. Düngungsvorgang starten und beobachten
6. Applizierte Mengen pro Zone dokumentieren
7. Nach 14 Tagen: Kontroll-Scan durchführen

**Erwartete Ergebnisse**:
- Alle 3 Mangelbereiche korrekt identifiziert (>90% Übereinstimmung)
- NDVI-Werte: Gesund >0.7, Mangel <0.5
- Selektive Applikation nur in Mangelbereichen (±5cm)
- Düngemittel-Verbrauch 20% unter Vollflächenbehandlung
- Verbesserung der NDVI-Werte nach 14 Tagen >15%

**Pass/Fail-Kriterien**:
- PASS: Mangelerkennung >90%, Einsparung >15%
- FAIL: Falsch-positive >10%, Überdüngung gesunder Bereiche

---

### 2.4 TC-SYS-004: Intelligente Bewässerungssteuerung

**Referenz**: UC05  
**Priorität**: Hoch  
**Vorbedingungen**:
- Externe Sprinkleranlage integriert (3 Zonen)
- Bodenfeuchte-Referenzmessungen durchgeführt
- Wetterprognose: Regen in 24h

**Testschritte**:
1. Feuchtigkeitskartierung durchführen (morgens)
2. Trockene Bereiche identifizieren (<30% Feuchte)
3. Bewässerungsplan erstellen (Ziel: 60% Feuchte)
4. Externe Sprinkler-Steuerung aktivieren
5. Roboter-eigene Mikrobewässerung für Spot-Treatment
6. Nach 2h: Feuchtigkeitskontrolle
7. Regenprognose-Reaktion überprüfen

**Erwartete Ergebnisse**:
- Feuchtigkeitsmessung ±5% genau
- Ventilsteuerung funktioniert für alle 3 Zonen
- Zielfeuchte 60% ±10% erreicht
- Wassermenge dokumentiert und <80% vs. Timer-Steuerung
- Bewässerung stoppt/reduziert bei Regenprognose

**Pass/Fail-Kriterien**:
- PASS: Zielfeuchte erreicht, Wassereinsparung >15%
- FAIL: Überwässerung >70%, keine Wetterreaktion

---

### 2.5 TC-SYS-005: KI-basierte Unkrauterkennung und Bekämpfung

**Referenz**: UC06  
**Priorität**: Mittel  
**Vorbedingungen**:
- 10 definierte Unkraut-Testpflanzen platziert (5 Löwenzahn, 3 Klee, 2 Giersch)
- 5 Nicht-Unkraut-Pflanzen als Negativ-Kontrolle
- Spot-Treatment-System mit Testflüssigkeit gefüllt

**Testschritte**:
1. Unkraut-Scan-Modus aktivieren
2. Roboter scannt Testbereich mit HD-Kameras
3. KI-Erkennungsergebnisse in App prüfen
4. Behandlungsstrategie auswählen (mechanisch für Löwenzahn, chemisch für Rest)
5. Selektive Behandlung durchführen
6. Behandlungspräzision messen (Treffgenauigkeit)
7. Nach 7 Tagen: Erfolg evaluieren

**Erwartete Ergebnisse**:
- Erkennungsrate: >90% True Positives, <5% False Positives
- Arten-Klassifikation >85% korrekt
- Spot-Treatment-Genauigkeit ±1cm
- Keine Behandlung der Kontrollpflanzen
- Behandlungserfolg >80% nach 7 Tagen

**Pass/Fail-Kriterien**:
- PASS: Precision >90%, Recall >85%, keine Kontrollpflanzen behandelt
- FAIL: False Positives >10%, Behandlung ungenau >2cm

---

### 2.6 TC-SYS-006: Extremwetter-Verhalten

**Referenz**: UC08  
**Priorität**: Hoch  
**Vorbedingungen**:
- Wetter-API-Mock für Extremszenarien
- Windmaschine für >25km/h verfügbar
- Beregnungsanlage für Starkregen-Simulation

**Testschritte**:
1. Szenario 1: Starkregen-Warnung → Roboter-Reaktion?
2. Szenario 2: Wind >25km/h während Düngung → Abbruch?
3. Szenario 3: Frost-Warnung → Wintermodus-Aktivierung?
4. Szenario 4: Hitze >40°C → Pausierung wegen Sensor-Drift?
5. Szenario 5: Gewitter-Warnung → Rückkehr zur Station?

**Erwartete Ergebnisse**:
- Starkregen: Sofortiger Stopp, Rückkehr zur Station
- Starker Wind: Düngung/Spraying pausiert
- Frost: Automatischer Übergang in Schonmodus
- Hitze: Sensor-Rekalibrierung, reduzierte Aktivität
- Gewitter: Notfall-Rückkehr <5 Minuten

**Pass/Fail-Kriterien**:
- PASS: Alle Szenarien korrekt behandelt
- FAIL: Fortsetzung trotz Gefährdung, keine Reaktion

---

### 2.7 TC-SYS-007: Multi-Tag-Dauertest

**Referenz**: NFR-004, NFR-005  
**Priorität**: Kritisch  
**Vorbedingungen**:
- 7-Tage-Testprogramm definiert
- Alle Funktionen aktiviert
- Monitoring-System läuft

**Testschritte**:
1. Tag 1-2: Normalbetrieb (Mähen täglich, Analyse kontinuierlich)
2. Tag 3: Düngung morgens, Bewässerung abends
3. Tag 4: Unkrautbekämpfung, danach Mähen
4. Tag 5: Simulierter Sensorausfall → Degraded Mode?
5. Tag 6: Wartungsmodus, Selbstdiagnose
6. Tag 7: Stress-Test mit allen Funktionen parallel
7. Kontinuierlich: Verfügbarkeit, Fehler, Performance loggen

**Erwartete Ergebnisse**:
- Systemverfügbarkeit >95% über 7 Tage
- Keine kritischen Ausfälle
- Degraded Mode funktioniert bei Sensorausfall
- Selbstdiagnose erkennt simulierte Probleme
- Performance-Degradation <10% am Tag 7

**Pass/Fail-Kriterien**:
- PASS: Verfügbarkeit >95%, keine Totalausfälle
- FAIL: Systemausfall >4h, Datenverlust

## 3. Sicherheits-Testcases

### 3.1 TC-SAF-001: Notfall-Stopp-Funktionen

**Priorität**: Kritisch  
**Testschritte**:
1. Hardware-Notaus während Fahrt betätigen
2. App-Notaus während Düngung aktivieren
3. Sprachbefehl "STOP" während Mähen
4. Roboter anheben während Betrieb
5. Kipptest bei 40° Neigung

**Erwartete Ergebnisse**:
- Alle Stopps <2 Sekunden
- Mähwerk stoppt sofort bei Anheben
- Kipp-Abschaltung bei >35°

---

### 3.2 TC-SAF-002: Personenerkennung und -schutz

**Priorität**: Kritisch  
**Testschritte**:
1. Kind-Dummy (50cm) in Fahrtweg stellen
2. Haustier-Dummy bewegt sich in Arbeitsbereich
3. Erwachsener nähert sich von hinten
4. Fuß unter Mähwerk-Simulation

**Erwartete Ergebnisse**:
- Stopp <30cm vor Person/Tier
- Akustisches Warnsignal
- Mähwerk-Sofortstopp bei Kontakt

## 4. Performance-Testcases

### 4.1 TC-PERF-001: Maximallast-Test

**Testschritte**:
1. 2500m² Fläche in einem Durchgang mähen
2. Gleichzeitig: Analyse, Kartierung, Cloud-Sync
3. Maximale Steigung 35° für 10 Minuten
4. Höchste Düngemittel-Ausstoßrate

**Erwartete Ergebnisse**:
- Keine Überhitzung
- Batterie hält >3h
- Keine Systemabstürze

---

### 4.2 TC-PERF-002: Latenz-Tests

**Testschritte**:
1. App-Befehl → Roboter-Reaktion messen
2. Sensor-Input → Ausweichmanöver messen
3. Cloud-Analyse → Ergebnis in App messen

**Erwartete Ergebnisse**:
- App-Latenz <2s (WiFi)
- Sensor-Reaktion <500ms
- Cloud-Analyse <10s

## 5. Umgebungs-Testcases

### 5.1 TC-ENV-001: Klimakammer-Tests

**Testschritte**:
1. -10°C für 4h, dann Kaltstart
2. +45°C für 4h unter Last
3. 95% Luftfeuchtigkeit für 24h
4. Temperaturwechsel -5°C → +35°C in 30min

**Erwartete Ergebnisse**:
- Start bei -10°C <5min
- Keine Überhitzung bei +45°C
- Keine Kondensationsschäden
- Keine mechanischen Spannungsrisse

---

### 5.2 TC-ENV-002: Wetterbeständigkeit IP65

**Testschritte**:
1. Strahlwasser aus 3m für 3min
2. Staubkammer 8h
3. Salznebeltest 48h
4. UV-Bestrahlung 500h

**Erwartete Ergebnisse**:
- Kein Wassereintritt
- Keine Funktionsbeeinträchtigung
- Keine Korrosion
- <10% Farbverblassung

## 6. Integrations-Testcases

### 6.1 TC-INT-001: Smart-Home-Integration

**Testschritte**:
1. HomeKit-Integration einrichten
2. Alexa-Sprachbefehle testen
3. IFTTT-Automation erstellen
4. Presence-Detection koppeln

**Erwartete Ergebnisse**:
- Setup <10min pro System
- Sprachbefehle funktionieren
- Automationen triggern korrekt

---

### 6.2 TC-INT-002: Bewässerungsanlagen-Integration

**Testschritte**:
1. Hunter-System verbinden
2. Rain Bird API testen
3. Gardena-Gateway koppeln
4. Ventil-Steuerung synchronisieren

**Erwartete Ergebnisse**:
- Alle Systeme erkannt
- Ventile individuell steuerbar
- Durchfluss-Monitoring aktiv

## 7. Regression-Test-Suite

### 7.1 Smoke-Test-Set (täglich)
- TC-SYS-001 (Teilschritte 3-5)
- TC-SYS-002 (Teilschritte 1-3)
- TC-SAF-001 (Schritt 1)
- TC-PERF-002 (alle Schritte)

### 7.2 Vollständige Regression (Release)
- Alle System-Testcases
- Alle Sicherheits-Testcases
- Performance-Baseline
- 48h-Dauertest

## 8. Akzeptanzkriterien

### 8.1 MVP-Release-Kriterien
- Alle Kritisch-Priorität Tests: PASS
- Sicherheitstests: 100% PASS
- Performance: >90% der Ziele erreicht
- Verfügbarkeit: >95% im 7-Tage-Test

### 8.2 Produktions-Release-Kriterien
- Alle Hoch-Priorität Tests: PASS
- Feldtests: 3 Sites erfolgreich
- Regression: Keine kritischen Bugs
- Dokumentation: Vollständig

## 9. Test-Metriken & Reporting

### 9.1 KPIs
- **Test-Abdeckung**: >95% der Requirements
- **Defect-Density**: <5 Bugs/KLOC
- **Test-Effizienz**: >80% Automatisierung
- **MTBF**: >1000h nachgewiesen

### 9.2 Reporting-Struktur
- **Daily**: Smoke-Test-Results
- **Weekly**: Test-Progress, Defect-Trends
- **Sprint-End**: Coverage-Report, Risk-Update
- **Release**: Final Test Report, Certification

## 10. Test-Automatisierung

### 10.1 Automatisierbare Tests (80%)
- Navigation und Pfadplanung (Simulation)
- Sensor-Datenverarbeitung (Unit)
- API-Integration (Integration)
- Performance-Messungen (Load)

### 10.2 Manuelle Tests (20%)
- Physische Sicherheitstests
- Nutzer-Experience-Tests
- Umgebungstests (Wetter, Temperatur)
- Wartungs-Szenarien

---

**Erstellt**: 2025-09-01  
**Version**: 1.0  
**Test-Manager**: QA Systems Engineering  
**Nächster Review**: Nach Architektur-Definition