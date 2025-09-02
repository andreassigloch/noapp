# Konsolidierungs-Analyse: Inkonsistenzen zwischen Spezifikationsdokumenten

## 1. Versteckte Anforderungen aus Testcases (nicht in Hauptspezifikation)

### 1.1 Neue funktionale Anforderungen aus Tests

| Testcase | Versteckte Anforderung | Kritikalität | Einarbeitung erforderlich |
|----------|------------------------|--------------|--------------------------|
| TC-SYS-001 | Setup-Zeit <30 Minuten für Erstinstallation | HOCH | JA - Usability-Anforderung fehlt |
| TC-SYS-001 | Kartierung <45 Minuten für 1000m² | HOCH | JA - Performance-Metrik fehlt |
| TC-SYS-002 | 98% Flächenabdeckung ohne >10% Überlappung | HOCH | JA - Effizienzmetrik fehlt |
| TC-SYS-002 | Automatische Fortsetzung nach Ladung | MITTEL | JA - Continuity-Feature fehlt |
| TC-SYS-003 | NDVI-Schwellwerte: Gesund >0.7, Mangel <0.5 | HOCH | JA - Konkrete Metriken fehlen |
| TC-SYS-004 | Zielfeuchte 60% ±10% | MITTEL | JA - Bewässerungsziele fehlen |
| TC-SYS-005 | Erkennungsrate: >90% True Positives, <5% False Positives | HOCH | JA - KI-Performance-Metriken fehlen |
| TC-SYS-005 | 7 Arten Unkraut unterscheidbar | MITTEL | JA - Artenspezifikation fehlt |
| TC-SYS-006 | Wind-Grenze >25km/h für Düngung | HOCH | JA - Windparameter fehlt komplett |
| TC-SYS-006 | Gewitter-Rückkehr <5 Minuten | HOCH | JA - Notfall-Timing fehlt |
| TC-SAF-001 | Hardware-Notaus vorhanden | KRITISCH | JA - Hardware-Button nicht spezifiziert |
| TC-SAF-001 | Kipp-Abschaltung bei >35° | KRITISCH | JA - Hangstabilität (aus Review GAP-001) |
| TC-SAF-001 | Sprachbefehl "STOP" | MITTEL | JA - Voice-Control für Notfall fehlt |
| TC-SAF-002 | Kind-Dummy-Erkennung (50cm Höhe) | KRITISCH | JA - Personenschutz unterspecifiziert |
| TC-SAF-002 | Akustisches Warnsignal | HOCH | JA - Akustik-Anforderung fehlt |
| TC-PERF-001 | 2500m² in einem Durchgang | MITTEL | JA - Max-Fläche nicht definiert |
| TC-PERF-001 | Keine Überhitzung bei Maximallast | HOCH | JA - Thermomanagement fehlt |
| TC-PERF-002 | Sensor-Reaktion <500ms | HOCH | JA - Echtzeit-Anforderung fehlt |
| TC-ENV-001 | Kaltstart bei -10°C <5min | HOCH | JA - Startzeit-Anforderung fehlt |
| TC-ENV-002 | Salznebeltest 48h | MITTEL | JA - Korrosionsschutz fehlt |
| TC-ENV-002 | UV-Beständigkeit 500h | MITTEL | JA - UV-Schutz fehlt |
| TC-INT-001 | IFTTT-Integration | NIEDRIG | JA - Automation-Platform fehlt |
| TC-INT-001 | Presence-Detection-Kopplung | MITTEL | JA - Anwesenheitserkennung fehlt |

### 1.2 Neue nicht-funktionale Anforderungen aus Tests

| Bereich | Anforderung aus Test | Status in Spec |
|---------|---------------------|----------------|
| Wartung | Mähwerk-Schärfung nach 200h | Erwähnt in UC07, aber nicht als harte Anforderung |
| Wartung | Sensor-Kalibrierung nach 1000 Zyklen | Erwähnt in UC07, aber nicht quantifiziert |
| Diagnostik | Täglicher System-Check | Erwähnt, aber nicht als Pflicht |
| Diagnostik | Wöchentliche Sensor-Kalibrierung | Erwähnt, aber nicht verpflichtend |
| Chemikalien | 500ml Flüssigdünger Tank | Nicht spezifiziert |
| Integration | 10min Setup pro Smart-Home-System | Nicht spezifiziert |
| Regression | 48h-Dauertest erforderlich | Nicht als Anforderung definiert |

## 2. Inkonsistenzen zwischen Review und Spezifikation

### 2.1 Kritische Lücken aus Review (GAP-001 bis GAP-007)

| Gap-ID | Review-Finding | Status in Spec | Aktion |
|--------|---------------|----------------|--------|
| GAP-001 | Hangstabilität >35° fehlt | NICHT vorhanden | MUSS ergänzt werden |
| GAP-002 | GDPR/Datenschutz fehlt | NICHT vorhanden | MUSS ergänzt werden |
| GAP-003 | Multi-Roboter-Koordination | NICHT vorhanden | SOLL für V2.0 ergänzt werden |
| GAP-004 | OTA-Update-Mechanismus | USB-C erwähnt, aber kein OTA | MUSS ergänzt werden |
| GAP-005 | Winterlagerungsmodus | NICHT vorhanden | MUSS ergänzt werden |
| GAP-006 | Degraded-Mode bei Sensorausfall | Erwähnt in UC03-3a, aber nicht durchgängig | MUSS durchgängig definiert werden |
| GAP-007 | Vandalismusschutz | Nur Diebstahlschutz erwähnt | KANN ergänzt werden |

### 2.2 Anforderungskonflikte aus Review

| Konflikt | Lösung aus Review | Status in Spec | Aktion |
|----------|------------------|----------------|--------|
| CON-001 | Adaptive Modi "Schnell" vs "Präzise" | NICHT implementiert | MUSS ergänzt werden |
| CON-002 | Variable Motorsteuerung tageszeitabhängig | NICHT vorhanden | MUSS ergänzt werden |
| CON-003 | Beheizte Batterie/Wintermodus | NICHT vorhanden | MUSS ergänzt werden |
| CON-004 | Temperaturkompensation für Sensoren | NICHT vorhanden | MUSS ergänzt werden |

## 3. Widersprüche zwischen Dokumenten

### 3.1 Performance-Metriken

| Parameter | Spec | Review | Test | Konsolidierung |
|-----------|------|--------|------|---------------|
| Mähgeschwindigkeit | 500m²/h | 500m²/h | ≥500m²/h | ≥500m²/h |
| Kartierungszeit | Nicht definiert | - | <45min/1000m² | <45min/1000m² |
| Setup-Zeit | Nicht definiert | - | <30min | <30min |
| Flächenabdeckung | Nicht definiert | - | 98% | >98% |
| Überlappung | Nicht definiert | - | <10% | <10% |

### 3.2 Sicherheitsparameter

| Parameter | Spec | Review | Test | Konsolidierung |
|-----------|------|--------|------|---------------|
| Hangneigung | Nicht definiert | >35° (GAP-001) | 35° Kipptest, 40° Test | Max 35° Operation, Abschaltung >35° |
| Personenerkennung | <30cm Hindernis | - | 50cm Kind-Dummy | <30cm allgemein, Personenerkennung spezifisch |
| Notaus | <2s App | - | Hardware + App + Sprache | Alle drei Varianten |
| Wind-Limit | >15km/h | - | >25km/h | >15km/h für Präzision, >25km/h Abbruch |

## 4. Fehlende Systemgrenzen-Definitionen

### Aus Tests abgeleitet, aber nicht in Spec:
- Maximale Betriebsfläche (Test: 2500m²)
- Minimale Hindernishöhe für Erkennung (50cm)
- Unterstützte Unkrautarten (mindestens 7)
- Tank-Kapazitäten (500ml Flüssig-Dünger)
- Thermische Grenzen (Überhitzungsschutz)
- Korrosionsschutz-Level (48h Salznebel)

## 5. Priorisierte Konsolidierungsmaßnahmen

### 5.1 KRITISCH (Sofort einarbeiten)
1. **Sicherheit**: Hangstabilität >35°, Hardware-Notaus, Personenerkennung 50cm
2. **Compliance**: GDPR/Datenschutz-Anforderungen
3. **Updates**: OTA-Update-Mechanismus für Security-Patches
4. **Degraded-Mode**: Vollständige Definition für alle Sensorausfälle

### 5.2 HOCH (Vor V1.0)
1. **Performance**: Alle quantifizierten Metriken aus Tests
2. **Wetter**: Wind-Limits, Gewitter-Protokoll
3. **Winter**: Lagerungsmodus, Batterie-Heizung
4. **Adaptive Modi**: Schnell vs. Präzise

### 5.3 MITTEL (Für V1.0)
1. **Integration**: Setup-Zeiten, IFTTT, Presence-Detection
2. **Wartung**: Konkrete Intervalle und Schwellwerte
3. **Umwelt**: UV-/Korrosionsschutz

### 5.4 NIEDRIG (Für V2.0)
1. **Multi-Roboter**: Schwarm-Koordination
2. **Vandalismus**: Erweiterte Schutzmaßnahmen
3. **Voice-Control**: Über Notfall hinaus

## 6. Empfehlung für konsolidierte Spezifikation V2.0

### Struktur-Vorschlag:
1. **Hauptspezifikation V2.0**: 
   - Alle Use Cases mit ergänzten Anforderungen
   - Quantifizierte Performance-Metriken
   - Vollständige Sicherheitsanforderungen
   - Degraded-Mode-Definitionen

2. **Anhang A**: Requirements Traceability Matrix
   - Vollständige Mapping UC ↔ Requirements ↔ Tests
   - Priorisierung und Phasen

3. **Anhang B**: Test-Akzeptanzkriterien
   - Direkte Verlinkung zu Requirements
   - Pass/Fail-Kriterien

4. **Anhang C**: Compliance & Regulatorik
   - GDPR, CE, FCC, etc.
   - Sicherheitsnormen

---

**Analyse durchgeführt**: 2025-09-01  
**Inkonsistenzen gefunden**: 47  
**Kritische Lücken**: 12  
**Empfehlung**: Konsolidierte V2.0 vor Architektur-Definition erstellen