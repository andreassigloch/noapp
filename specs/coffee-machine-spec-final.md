# Systemspezifikation: Premium Restaurant-Kaffeevollautomat
## Version 2.0 - Finale Spezifikation

---

## 1. Executive Summary

**Produkt:** Selbstbedienungs-Kaffeevollautomat für gehobene Restaurants  
**Kernkonzept:** Intuitive Touch-Bedienung mit Symbolen, 1-3 Touches pro Getränk  
**Alleinstellungsmerkmal:** Zwei-Bohnen-System mit automatischer Auswahl für optimale Getränkequalität

---

## 2. Bedienkonzept

### 2.1 Touch-Interface Design

**Display-Typ:** Kapazitiver Touchscreen, min. 10 Zoll  
**Darstellung:** Ausschließlich Symbole/Piktogramme, keine Texte  
**Farbkonzept:** Klar unterscheidbare Farben für Getränketypen

### 2.2 Bedienlogik

**1-Touch-Bedienung (80% der Fälle):**
- Direktwahltasten für Standardgetränke in Standardgröße
- Beispiel: ☕ Symbol → Café Crème (120ml)

**2-Touch-Bedienung (15% der Fälle):**
- Getränk + eine Option
- Beispiel: ☕ → 🥛🌾 (Café Crème mit Hafermilch)
- Beispiel: ☕ → L (Café Crème groß)

**3-Touch-Bedienung (5% der Fälle):**
- Getränk + zwei Optionen
- Beispiel: ☕ → L → 🥛🌾 (Café Crème groß mit Hafermilch)

### 2.3 Interface-Layout

```
[Hauptbildschirm]
┌─────────────────────────────────┐
│                                 │
│  ☕  ⚫  🥛☕  ☕🥛  🥛      │
│ Café  Esp  Capp  Latte  Milch  │
│                                 │
│ ─────────────────────────────── │
│                                 │
│   [S]     [L]     🥛🌾        │
│  Klein   Groß   Alternative    │
│                                 │
└─────────────────────────────────┘
```

---

## 3. Zwei-Bohnen-System

### 3.1 Bohnenbehälter-Konfiguration

**Behälter A: Espresso-Röstung**
- Kapazität: 2kg
- Verwendung: Espresso, Cappuccino, Latte Macchiato
- Mahlgrad: Fein (automatisch eingestellt)
- Bohnentyp: Dunkle Röstung, 80% Arabica/20% Robusta

**Behälter B: Café Crème-Röstung**
- Kapazität: 2kg  
- Verwendung: Café Crème, verlängerter Kaffee
- Mahlgrad: Mittel (automatisch eingestellt)
- Bohnentyp: Mittlere Röstung, 100% Arabica

### 3.2 Automatische Bohnenauswahl

| Getränk | Bohnensorte | Menge | Brühparameter |
|---------|-------------|-------|---------------|
| Espresso | A (Espresso) | 8g | 25ml, 9 bar, 92°C |
| Doppelter Espresso | A (Espresso) | 16g | 50ml, 9 bar, 92°C |
| Café Crème | B (Crème) | 10g | 120ml, 6 bar, 94°C |
| Café Crème Groß | B (Crème) | 14g | 180ml, 6 bar, 94°C |
| Cappuccino | A (Espresso) | 8g | 25ml Espresso + Milchschaum |
| Latte Macchiato | A (Espresso) | 8g | 25ml Espresso + viel Milch |

---

## 4. Funktionale Anforderungen

### 4.1 Getränkesystem

**FR-001:** Getränkeauswahl mit Standardgrößen:
- Espresso (25ml) / Doppelt (50ml)
- Café Crème (120ml) / Groß (180ml)  
- Cappuccino (180ml) / Groß (250ml)
- Latte Macchiato (250ml)
- Heiße Milch (150ml)

**FR-002:** Zwei-Bohnen-System mit automatischer Auswahl

**FR-003:** Zwei-Milch-System:
- Tank 1: Vollmilch (5 Liter, gekühlt)
- Tank 2: Hafermilch (5 Liter, gekühlt)

### 4.2 Touch-Interface

**FR-004:** Symbolbasierte Bedienung ohne Text
**FR-005:** Visuelles Feedback bei Touch (Animation/Farbwechsel)
**FR-006:** Fortschrittsanzeige während Zubereitung
**FR-007:** Tassenerkennung vor Start

### 4.3 Kapazitäten (Tagesbedarf)

**FR-008:** Komponenten-Kapazitäten:
- Bohnenbehälter: 2x 2kg
- Milchtanks: 2x 5 Liter (gekühlt)
- Wassertank: 12 Liter ODER Festwasseranschluss
- Satzschublade: 80 Portionen
- Tropfschale: 3 Liter

### 4.4 Reinigungssystem

**FR-009:** Automatische Milchsystemspülung alle 3 Stunden
**FR-010:** Tägliche Komplettreinigung (15 Minuten)
**FR-011:** Reinigungserinnerung auf Display
**FR-012:** Automatische Entkalkungserinnerung

---

## 5. Nicht-funktionale Anforderungen

### 5.1 Performance

**NFR-001:** Zubereitungszeiten:
- Espresso: max. 25 Sekunden
- Café Crème: max. 35 Sekunden  
- Milchgetränke: max. 50 Sekunden
- Aufheizzeit: max. 90 Sekunden

**NFR-002:** Durchsatz: min. 150 Getränke/Stunde

### 5.2 Qualität

**NFR-003:** Temperaturkonstanz: ±1°C
**NFR-004:** Druckkonstanz: ±0.5 bar
**NFR-005:** Milchschaumqualität: Feinporig, 60-65°C
**NFR-006:** Crema: Min. 2mm, 2 Minuten stabil

### 5.3 Bedienbarkeit

**NFR-007:** Touch-Response: <100ms
**NFR-008:** Symbolgröße: min. 4x4cm
**NFR-009:** Kontrast: WCAG AAA Standard
**NFR-010:** Bedienwinkel: 15-45° von horizontal

### 5.4 Zuverlässigkeit

**NFR-011:** Verfügbarkeit: >99.5%
**NFR-012:** MTBF: >10.000 Getränke
**NFR-013:** Selbstdiagnose mit Fehlercode-Anzeige

### 5.5 Hygiene & Sicherheit

**NFR-014:** NSF/ANSI 8 zertifiziert
**NFR-015:** HACCP-konform
**NFR-016:** Automatische Legionellen-Prävention
**NFR-017:** Milchtemperatur: konstant <5°C

### 5.6 Umgebungsbedingungen

**NFR-018:** Betriebstemperatur: 10-35°C
**NFR-019:** Luftfeuchtigkeit: 30-80%
**NFR-020:** Geräuschpegel: <68dB

---

## 6. Technische Spezifikationen

### 6.1 Hardware

**Mahlwerke:** 2x Keramik-Scheibenmühle
**Brühgruppe:** Edelstahl, herausnehmbar
**Heizung:** 2x Thermoblock (Kaffee/Dampf)
**Pumpe:** Vibrationspumpe, 15 bar
**Display:** 10" Touch, 1280x800px, IP65

### 6.2 Anschlüsse

**Elektrisch:** 230V/16A ODER 400V/16A
**Wasser:** 3/4" mit Rückflussverhinderer
**Abwasser:** Optional, DN40
**Netzwerk:** Ethernet/WiFi für Telemetrie

### 6.3 Abmessungen

**Breite:** 500mm
**Tiefe:** 600mm  
**Höhe:** 750mm
**Tassenfreiheit:** 160mm
**Gewicht:** ca. 45kg

---

## 7. Systemgrenzen

### System leistet NICHT:
- Individuelle Rezeptprogrammierung durch Gäste
- Personalisierung/Benutzerspeicherung
- Zahlungsfunktionen
- Entkoffeinierte Optionen
- Flavor-Sirups oder Zusätze
- Kalte Getränke/Iced Coffee
- Heißwasser für Tee

---

## 8. Besondere Features

### 8.1 Smart-Funktionen

**Telemetrie:**
- Verbrauchsstatistiken
- Predictive Maintenance
- Ferndiagnose
- Automatische Nachbestellung (optional)

**Multi-Maschinen-Setup:**
- Zentrale Verwaltung
- Load-Balancing bei mehreren Geräten
- Gemeinsame Statistiken

### 8.2 Qualitätssicherung

**Automatische Kalibrierung:**
- Mahlgradanpassung bei Luftfeuchtigkeit
- Temperaturkorrektur bei Umgebungstemperatur
- Durchflussmengenkorrektur

---

## 9. Wartung & Service

### 9.1 Tägliche Aufgaben (Personal)

1. Bohnenbehälter auffüllen (30 Sek.)
2. Milchtanks wechseln (2 Min.)
3. Reinigungsprogramm starten (15 Min. automatisch)
4. Satzschublade leeren (30 Sek.)
5. Sichtkontrolle (30 Sek.)

**Gesamtzeit:** <20 Minuten

### 9.2 Wöchentliche Wartung

- Brühgruppe entnehmen und spülen
- Milchschläuche kontrollieren
- Dichtungen prüfen

### 9.3 Service-Intervalle

- Monatlich: Techniker-Inspektion
- Jährlich: Großwartung mit Dichtungstausch

---

## 10. Kritische Erfolgsfaktoren

1. **Intuitivität:** Gäste müssen ohne Anleitung bedienen können
2. **Geschwindigkeit:** Keine Warteschlangen in Stoßzeiten
3. **Konstanz:** Jeder Kaffee schmeckt gleich gut
4. **Zuverlässigkeit:** Keine Ausfälle während Service
5. **Wirtschaftlichkeit:** ROI innerhalb 18 Monaten

---

## 11. Offene Entscheidungen

□ Exakte Hafermilch-Marke spezifizieren
□ Telemetrie-System-Anbieter wählen
□ Service-Partner definieren
□ Backup-Lösung bei Maschinenausfall
□ Schulungskonzept für Personal