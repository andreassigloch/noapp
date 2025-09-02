# Intelligentes Rasenpflege-System (IRPS) - Systemspezifikation

## 1. Systemübersicht

### 1.1 Systemzweck
Das Intelligente Rasenpflege-System (IRPS) ist ein autonomer, roboterbasierter Pflegecomplex für Rasenflächen, der über standardisiertes Mähen hinaus selektive Düngung, bedarfsgerechte Bewässerung und präventive Unkrautbekämpfung durch präzise Kartierung und situative Applikation ermöglicht.

### 1.2 Systemgrenzen
**Innerhalb der Systemgrenzen:**
- Autonomer Pflegeroboter mit Multifunktions-Payload
- Basisstation mit Lade- und Nachfüllinfrastruktur
- Cloud-Backend für Datenanalyse und Steuerung
- Mobile Applikation für Nutzerinteraktion
- Integration zu bestehenden Bewässerungsanlagen

**Außerhalb der Systemgrenzen:**
- Externe Bewässerungsinfrastruktur (wird angesteuert)
- Wetterdatenlieferanten (werden konsumiert)
- Herstellung/Lieferung von Düngemitteln
- Grundlegende Rasenanlage und -geometrie

## 2. Akteure (Stakeholder)

### 2.1 Primäre Akteure
- **Endnutzer (Privatperson)**: Hausbesitzer mit 500-2.500m² Rasenfläche
- **Endnutzer (Gewerblich)**: Facility Manager, Hausmeister, Gartenbau-Services
- **Wartungstechniker**: Autorisiertes Servicepersonal

### 2.2 Sekundäre Akteure  
- **Cloud-Service**: Backend-Infrastruktur für Datenverarbeitung
- **Bewässerungsanlage**: Externe Sprinklersysteme, Ventilsteuerung
- **Wetterservice**: Meteorologische Datenlieferanten
- **Regulatory Bodies**: Sicherheits-, EMV-, Umweltbehörden

## 3. Use Case Katalog

### 3.1 UC01 - Initiale Rasenflächenkartierung

**Beschreibung**: System erfasst erstmalig die zu bearbeitende Rasenfläche und erstellt eine präzise digitale Karte mit Geometrie, Hindernissen und Zonen.

**Primärakteur**: Endnutzer  
**Vorbedingungen**: 
- Roboter ist betriebsbereit und in der Basisstation positioniert
- GPS-Signal verfügbar (RTK-Korrekturdaten aktiv)
- Mobile App ist installiert und konfiguriert

**Hauptszenario**:
1. Nutzer startet "Erstmalige Kartierung" in der App
2. Roboter verlässt Basisstation und beginnt systematische Flächenerfassung
3. System erfasst via RTK-GPS (±2cm) und Sensoren Rasengrenzen
4. Roboter identifiziert und markiert Hindernisse (Bäume, Beete, Wege)
5. System klassifiziert Zonen nach Topologie und Vegetationsdichte
6. Nutzer validiert und korrigiert Karte via App-Interface
7. System speichert finale Basiskarte als Referenz

**Postconditions**: 
- Vollständige digitale Rasenkarte verfügbar
- Zonen für differenzierte Behandlung definiert
- Navigationsbasis für alle Folgeoperationen etabliert

**Alternative Szenarien**:
- 3a: GPS-Signal unzureichend → System wartet oder nutzt Visual SLAM als Backup
- 6a: Nutzer-Korrekturen erforderlich → Roboter fährt markierte Bereiche zur Verifikation ab

---

### 3.2 UC02 - Autonomes Präzisionsmähen

**Beschreibung**: Roboter führt bedarfsgerechtes Mähen mit zonenspezifischen Parametern durch.

**Primärakteur**: System (zeitgesteuert) / Endnutzer (manueller Trigger)  
**Vorbedingungen**:
- Rasenkarte verfügbar
- Batterie ausreichend geladen (>30%)
- Wetterbedingungen geeignet (kein Regen)
- Mähwerk funktionsfähig

**Hauptszenario**:
1. System prüft Mähbedarf basierend auf Wachstumsprognose und letztem Mähtermin
2. System plant optimale Route unter Berücksichtigung der Zonenprioritäten
3. Roboter verlässt Basisstation und navigiert zu Startbereich
4. System passt Schnitthöhe zonenspezifisch an (Sport-/Spiel-/Zierbereiche)
5. Roboter mäht systematisch mit Überlappungskontrolle und Mulchverteilung
6. Bei Hindernissen: Ausweichmanöver und Nachkartierung
7. Bei niedrigem Batteriestand: Automatische Rückkehr zur Ladestation
8. System dokumentiert gemähte Flächen und Zeitaufwand

**Postconditions**: 
- Rasenfläche entspricht definierten Schnitthöhen-Parametern
- Mulchmaterial gleichmäßig verteilt
- Mäh-Historie und Performance-Daten gespeichert

**Alternative Szenarien**:
- 2a: Ungünstige Wetterbedingungen → Verschiebung um definiertes Intervall
- 6a: Neue Hindernisse erkannt → Kartenupdation und Nutzerbenachrichtigung
- 7a: Notlage (Unfall, Diebstahl) → Sofortstopp und Alarm

---

### 3.3 UC03 - Selektive Bodenanalyse und Nährstoffkartierung

**Beschreibung**: System analysiert kontinuierlich Bodenzustand und Nährstoffbedarf für bedarfsgerechte Düngungsplanung.

**Primärakteur**: System (kontinuierlich)  
**Vorbedingungen**:
- Kalibrierte Multispektral-Sensoren
- Referenzdaten für Vegetationsindizes (NDVI) verfügbar
- Bodenfeuchtesensoren funktionsfähig

**Hauptszenario**:
1. Während regulärer Fahrten erfasst System kontinuierlich:
   - Vegetationsindizes (NDVI, GNDVI) via Multispektral-Kamera
   - Bodenfeuchte via Penetrometer-Sensoren
   - Chlorophyll-Gehalt via Spektralanalyse
2. System korreliert Sensordaten mit GPS-Koordinaten (±2cm Auflösung)
3. KI-Algorithmus identifiziert Mangel-/Stresszonen:
   - Stickstoffmangel (niedriger NDVI)
   - Wasserstress (niedrige Bodenfeuchte + hohe Pflanzentemperatur)
   - Krankheits-/Schädlingsbefall (anomale Spektralwerte)
4. System erstellt differenzierte Behandlungsempfehlung pro m²
5. Nutzer erhält Nährstoffkarte mit Handlungsempfehlungen via App
6. System plant automatisch selektive Düngungsrouten

**Postconditions**: 
- Aktuelle Nährstoff-/Feuchtigkeitskarte verfügbar
- Behandlungsbedarfs-Zonen identifiziert und quantifiziert
- Optimierte Dünge-/Bewässerungsplanung bereit

**Alternative Szenarien**:
- 3a: Sensoren verschmutzt/defekt → Wartungsalarm und Degraded-Mode
- 4a: Unplausible Messwerte → Wiederholung der Messung, Nutzerwarnung

---

### 3.4 UC04 - Bedarfsgerechte Selektive Düngung

**Beschreibung**: Roboter appliziert Düngemittel präzise nur in identifizierten Bedarfszonen.

**Primärakteur**: System / Endnutzer  
**Vorbedingungen**:
- Nährstoffkarte mit Behandlungsbedarfs-Zonen verfügbar
- Düngemitteltank gefüllt (entsprechend geplanter Ausbringungsmenge)
- Applikationssystem kalibriert und funktionsfähig
- Wetterbedingungen geeignet (kein Wind >15km/h, kein Regen prognostiziert)

**Hauptszenario**:
1. System berechnet exakte Düngemittelmengen pro Behandlungszone
2. Nutzer bestätigt Düngungsplan via App oder System startet automatisch
3. Roboter navigiert zu erster Behandlungszone
4. System aktiviert präzise Mikro-Dosieranlage (Granulat oder Flüssigdüngung)
5. Roboter appliziert Düngemittel rasterpunkt-genau (2cm x 2cm Auflösung)
6. System dokumentiert applizierte Mengen und GPS-Koordinaten
7. Nach Abschluss: Applikationssystem-Spülung und Reinigung
8. System erstellt Behandlungsprotokoll mit Verbrauchsstatistik

**Postconditions**: 
- Düngemittel präzise in Bedarfszonen ausgebracht
- 15-25% Düngemittel-Einsparung gegenüber Vollflächenbehandlung
- Lückenlose Dokumentation für Rückverfolgbarkeit

**Alternative Szenarien**:
- 1a: Unzureichende Düngemittel-Vorräte → Nutzerbenachrichtigung und Nachbestellempfehlung
- 4a: Verstopfung Applikationssystem → Automatische Reinigung, ggf. Serviceanforderung
- 4b: Wetterbedingungen verschlechtern sich → Behandlung unterbrechen und verschieben

---

### 3.5 UC05 - Intelligente Bewässerungssteuerung

**Beschreibung**: System koordiniert bedarfsgerechte Bewässerung durch Integration mit vorhandener Sprinkleranlage und/oder robotereigene Bewässerung.

**Primärakteur**: System  
**Vorbedingungen**:
- Feuchtigkeitskarte mit Bewässerungsbedarfs-Zonen verfügbar
- Integration zu Bewässerungsanlage konfiguriert (Ventilsteuerung)
- Wetterdaten-Feed aktiv
- Wasservorrat ausreichend (bei robotereigener Bewässerung)

**Hauptszenario**:
1. System analysiert Bewässerungsbedarf basierend auf:
   - Aktueller Bodenfeuchte-Kartierung
   - Wetterprognose (Niederschlag, Verdunstung)
   - Vegetationsstress-Indikatoren
2. System berechnet optimalen Bewässerungszeitpunkt und -dauer pro Zone
3. Für Zonen mit externer Sprinkleranlage:
   - System steuert Ventile zonenspezifisch an
   - Monitoring der Bewässerungsdauer und -intensität
4. Für Zonen ohne externe Abdeckung:
   - Roboter navigiert zu unterversorgten Bereichen
   - Präzise Mikro-Bewässerung durch robotereigenes System
5. System überwacht Bodenfeuchteanstieg und stoppt bei Zielwert-Erreichung
6. Dokumentation der Wassermengen und Behandlungsbereiche

**Postconditions**: 
- Optimale Bodenfeuchte in allen Bereichen erreicht
- 15-25% Wassereinsparung durch bedarfsgerechte Applikation
- Integrierte Bewässerungshistorie und Verbrauchsdaten

**Alternative Szenarien**:
- 2a: Regenprognose → Bewässerung wird automatisch verschoben/reduziert
- 3a: Externe Bewässerungsanlage nicht erreichbar → Nur robotereigene Bewässerung
- 5a: Bodenfeuchteziele nicht erreichbar → Nutzerwarnung wegen möglicher Leckage/Defekt

---

### 3.6 UC06 - Präventive Unkrautbekämpfung

**Beschreibung**: System identifiziert Unkrautbefall frühzeitig und führt selektive Bekämpfungsmaßnahmen durch.

**Primärakteur**: System  
**Vorbedingungen**:
- Kalibrierte KI-Modelle für Unkrauterkennung
- Hochauflösende Kamerasysteme funktionsfähig
- Bekämpfungsmittel-Vorrat ausreichend (mechanisch/biologisch/chemisch)

**Hauptszenario**:
1. Während regulärer Fahrten scannt System kontinuierlich die Vegetation:
   - Hochauflösende RGB-Kameras mit KI-Bildanalyse
   - Identifikation von Unkrautarten vs. Rasenspezies
2. System klassifiziert Unkrautbefall nach:
   - Art des Unkrauts (Löwenzahn, Klee, Giersch, etc.)
   - Ausbreitungsgrad und -geschwindigkeit
   - Behandlungspriorität
3. System wählt geeignete Bekämpfungsmethode:
   - Mechanisch: Präzise Ausreißung durch Roboterarm
   - Biologisch: Targeted Mikroorganismen-Applikation
   - Chemisch: Spot-Treatment mit Herbiziden (minimal-invasiv)
4. Roboter navigiert zu identifizierten Unkrautstellen
5. System appliziert selektive Behandlung (±1cm Genauigkeit)
6. Behandelte Bereiche werden markiert und überwacht
7. Erfolgsmonitoring nach 7-14 Tagen

**Postconditions**: 
- Unkrautbefall frühzeitig erkannt und selektiv behandelt
- 60-80% Reduktion von Herbizid-Einsatz durch Spot-Treatment
- Dokumentation der Behandlungsstellen und -erfolg

**Alternative Szenarien**:
- 2a: Unbekannte Unkrautart → Foto an Cloud-KI zur Identifikation
- 3a: Behandlungsmittel nicht verfügbar → Nutzerbenachrichtigung und alternative Methoden
- 7a: Behandlung nicht erfolgreich → Wiederholungsbehandlung oder Nutzer-Eskalation

---

### 3.7 UC07 - Systemwartung und Selbstdiagnose

**Beschreibung**: System überwacht kontinuierlich eigene Funktionsfähigkeit und führt präventive Wartungsmaßnahmen durch.

**Primärakteur**: System  
**Vorbedingungen**:
- Sensorik für Systemzustand-Monitoring aktiv
- Wartungsintervalle und -parameter definiert
- Ersatzteil-/Verbrauchsmaterial-Status bekannt

**Hauptszenario**:
1. System überwacht kontinuierlich kritische Parameter:
   - Batterie-Gesundheit und Ladezyklen
   - Motorlaufzeiten und Verschleiß
   - Sensor-Kalibrierung und Abweichungen
   - Mähwerk-Schärfe und Abnutzung
2. System führt automatische Funktionsprüfungen durch:
   - Täglicher System-Check vor Arbeitsbeginn
   - Sensor-Kalibrierung wöchentlich
   - Applikationssystem-Spülung nach jeder Behandlung
3. Bei Abweichungen von Normal-Parametern:
   - Automatische Korrekturmaßnahmen wo möglich
   - Nutzerbenachrichtigung bei kritischen Problemen
   - Service-Anforderung bei Hardware-Defekten
4. System plant präventive Wartungsarbeiten:
   - Mähwerk-Schärfung/Wechsel nach 200 Betriebsstunden
   - Sensor-Neukalibrierung nach 1000 Betriebszyklen
   - Filter-/Verbrauchsmaterial-Wechsel termingerecht
5. Erstellung von Wartungsprotokollen und Lebensdauer-Prognosen

**Postconditions**: 
- Optimale Systemverfügbarkeit durch präventive Wartung
- Reduzierte Ausfallzeiten und Service-Kosten
- Transparente Wartungsplanung für Nutzer

**Alternative Szenarien**:
- 2a: Kritischer Defekt erkannt → Sofortiger Stopp und Notfall-Protokoll
- 4a: Wartungsteile nicht verfügbar → Automatische Nachbestellung und Terminverschiebung

---

### 3.8 UC08 - Wetter-Integration und Adaptive Planung

**Beschreibung**: System passt alle Pflegeaktivitäten kontinuierlich an Wetterprognosen und aktuelle Bedingungen an.

**Primärakteur**: System  
**Vorbedingungen**:
- Wetter-API-Integration aktiv und kalibriert
- Lokale Sensoren für Temperatur, Luftfeuchte, Windgeschwindigkeit funktionsfähig
- Behandlungsparameter für verschiedene Wetterbedingungen definiert

**Hauptszenario**:
1. System konsumiert kontinuierlich Wetterdaten:
   - Aktuelle Bedingungen (Temperatur, Feuchte, Wind, Niederschlag)
   - 7-Tage-Prognose mit stündlicher Auflösung
   - Langzeittrends für saisonale Anpassungen
2. System validiert externe Daten mit lokalen Sensoren
3. Automatische Anpassung der Pflegeaktivitäten:
   - Mähen: Vermeidung bei Nässe, optimale Zeiten bei stabiler Wetterlage
   - Düngung: Schutz vor Auswaschung, Timing für optimale Aufnahme
   - Bewässerung: Kompensation von Niederschlagsdefiziten, Verdunstungsausgleich
   - Unkrautbekämpfung: Behandlung vor Regenerationsphasen
4. System erstellt adaptive Wochen-/Monatsplanung
5. Nutzerbenachrichtigung bei kritischen Wetteränderungen
6. Notfall-Protokolle bei Extremwetter (Sturm, Frost, Trockenheit)

**Postconditions**: 
- Optimale Timing aller Pflegeaktivitäten für maximale Wirksamkeit
- Schutz vor Wetter-bedingten Behandlungsfehlern
- Anpassung der Systemparameter an saisonale Veränderungen

**Alternative Szenarien**:
- 2a: Lokale Sensoren weichen stark von Prognose ab → Priorität auf lokale Messung
- 6a: Extremwetter-Warnung → Roboter fährt in Schutzposition, alle Behandlungen pausiert

---

### 3.9 UC09 - Nutzer-Interaktion und Reporting

**Beschreibung**: Nutzer erhält umfassende Transparenz über Systemaktivitäten und kann Einstellungen anpassen.

**Primärakteur**: Endnutzer  
**Vorbedingungen**:
- Mobile App installiert und mit System verbunden
- Nutzer-Account authentifiziert
- Cloud-Backend für Datenanalyse verfügbar

**Hauptszenario**:
1. Nutzer öffnet mobile App und erhält Dashboard-Übersicht:
   - Aktueller Systemstatus und nächste geplante Aktivitäten
   - Rasenzustand-Visualisierung (Nährstoff-, Feuchtigkeits-, Behandlungskarten)
   - Performance-Metriken (Effizienz, Einsparungen, Kosten)
2. Detailansichten verfügbar für:
   - Behandlungshistorie mit GPS-genauer Dokumentation
   - Verbrauchsstatistiken (Düngemittel, Wasser, Energie)
   - Systemgesundheit und Wartungsplanung
3. Nutzer kann Einstellungen anpassen:
   - Behandlungsintensität und -prioritäten
   - Zeitfenster für Roboter-Aktivitäten
   - Benachrichtigungs-Präferenzen
4. Manuelle Steuerungsmöglichkeiten:
   - Ad-hoc-Behandlungen (Mähen, Düngen, Bewässern)
   - Ausschluss-Zonen temporär definieren
   - Notfall-Stopp und System-Reset
5. Automatische Reports und Empfehlungen:
   - Wöchentliche Zusammenfassungen
   - Saisonale Optimierungsvorschläge
   - Kostenanalyse und Einsparpotentiale

**Postconditions**: 
- Vollständige Transparenz über Systemaktivitäten
- Nutzer-optimierte Systemkonfiguration
- Kontinuierliche Verbesserung durch Feedback-Loop

**Alternative Szenarien**:
- 1a: Keine Internetverbindung → Lokale Basisfunktionen verfügbar, Sync bei Verbindung
- 4a: Ungültige Nutzereingaben → Plausibilitätsprüfung und Korrekturvorschläge

---

### 3.10 UC10 - Integration Externe Systeme

**Beschreibung**: System integriert sich nahtlos in bestehende Garten- und Smart-Home-Infrastrukturen.

**Primärakteur**: System / Endnutzer  
**Vorbedingungen**:
- Kompatible externe Systeme identifiziert und verfügbar
- Netzwerk-Konnektivität und Protokoll-Support gewährleistet
- Nutzer-Autorisierung für System-Integration

**Hauptszenario**:
1. System erkennt verfügbare externe Integrationen:
   - Bewässerungsanlagen (Hunter, Rain Bird, Gardena)
   - Smart-Home-Systeme (HomeKit, Alexa, Google Home)
   - Wetter-Stationen und Boden-Sensoren
   - Sicherheitssysteme und Kameras
2. Nutzer konfiguriert gewünschte Integrationen via App
3. System etabliert sichere Kommunikationsverbindungen:
   - API-Integration für Cloud-basierte Services
   - Direct-Connect für lokale IoT-Geräte
   - Protokoll-Translation für Legacy-Systeme
4. Operative Integration:
   - Bewässerungsanlagen: Koordinierte Steuerung und Monitoring
   - Smart-Home: Sprachsteuerung und Automations-Integration
   - Sicherheit: Respektierung von Alarm-Modi und Anwesenheitserkennung
5. Kontinuierliche Synchronisation und Status-Updates
6. Backup-Betrieb bei Ausfall externer Systeme

**Postconditions**: 
- Nahtlose Integration in bestehende Infrastrukturen
- Erweiterte Funktionalität durch System-Vernetzung
- Robuster Betrieb auch bei partiellen Ausfällen

**Alternative Szenarien**:
- 1a: Externe Systeme nicht kompatibel → Alternative Lösungen vorschlagen
- 3a: Sicherheitsprobleme bei Integration → Isolierter Betrieb mit reduzierter Funktionalität
- 6a: Kritische externe Systeme ausgefallen → Automatischer Fallback auf autonomen Betrieb

## 4. Qualitätsanforderungen

### 4.1 Performance-Anforderungen
- **Kartierungsgenauigkeit**: RTK-GPS ±2cm, Hinderniserkennung 95%+ Präzision
- **Behandlungsgeschwindigkeit**: 500m²/h Mähen, 200m²/h selektive Behandlung
- **Batterie-Autonomie**: Min. 4h kontinuierlicher Betrieb bei Standard-Pflegemix
- **Reaktionszeit App**: <2s für Standardabfragen, <10s für Datenanalysen

### 4.2 Verfügbarkeits- und Zuverlässigkeitsanforderungen
- **Systemverfügbarkeit**: >95% während Vegetationsperiode
- **MTBF (Mean Time Between Failures)**: >1000 Betriebsstunden
- **MTTR (Mean Time To Repair)**: <24h für kritische Defekte
- **Datenintegrität**: 99.9% Verfügbarkeit der Behandlungshistorie

### 4.3 Sicherheitsanforderungen
- **Kollisionsvermeidung**: Stopp bei Hindernissen <30cm, Sensor-Redundanz
- **Notfall-Stopp**: <2s Reaktionszeit bei manueller Abschaltung
- **Chemikaliensicherheit**: Leckage-Erkennung, automatische Isolation
- **Diebstahlschutz**: GPS-Tracking, Alarm bei unbefugter Bewegung

### 4.4 Umweltanforderungen
- **Betriebstemperatur**: -10°C bis +45°C
- **Witterungsschutz**: IP65 (staubdicht, strahlwasserdicht)
- **Lärmemission**: <60dB(A) in 1m Entfernung (Tagbetrieb)
- **EMV-Konformität**: CE-Kennzeichnung, FCC-Zulassung

## 5. Systemschnittstellen

### 5.1 Hardware-Schnittstellen
- **Ladestation**: Induktive Ladung, Docking-Mechanik
- **Bewässerungsanlage**: 24V AC Ventilsteuerung, Flow-Monitoring
- **Externe Sensoren**: I2C/SPI für Boden-/Wetter-Sensoren
- **Wartungs-Interface**: USB-C für Diagnose und Software-Updates

### 5.2 Software-Schnittstellen
- **Cloud-APIs**: RESTful APIs für Datenanalyse und ML-Services
- **Smart-Home**: HomeKit, Matter, Zigbee, WiFi-Integration
- **Wetter-Services**: OpenWeatherMap, AccuWeather APIs
- **Mobile Apps**: iOS/Android native Apps mit Push-Notifications

### 5.3 Kommunikationsschnittstellen
- **WiFi 6**: Primäre Netzwerkverbindung, Dual-Band
- **4G/5G**: Backup-Konnektivität bei WiFi-Ausfall
- **Bluetooth 5.2**: Lokale Konfiguration und Nahbereichs-Steuerung
- **LoRaWAN**: Low-Power Sensor-Netzwerk für IoT-Integration

---

**Erstellt**: 2025-09-01  
**Version**: 1.0  
**Status**: Entwurf zur Review