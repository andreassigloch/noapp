# IRPS Logische System-Architektur

## 1. Architektur-Scope & Prinzipien

### 1.1 Abgrenzung zu anderen Dokumenten
- **Systemspezifikation**: WAS das System können muss (Requirements)
- **Logische Architektur**: WIE das System strukturell aufgebaut ist (Logical Design)  
- **Technische Spezifikation**: WOMIT das System realisiert wird (Implementation)

### 1.2 Logische Architektur-Prinzipien
- **Functional Decomposition**: Aufgaben nach Verantwortlichkeiten trennen
- **Interface-based Design**: Klare Schnittstellen zwischen Funktionsblöcken
- **State-driven Behavior**: Systemverhalten über definierte Zustandsmodelle
- **Fail-Safe-Architecture**: Sichere Zustände bei jeder Komponentenebene
- **Separation of Concerns**: Navigation, Analyse, Behandlung, Sicherheit getrennt

## 2. Systemstruktur-Dekomposition

### 2.1 Top-Level System-Dekomposition

```
                    ┌─────────────────────────────────┐
                    │         IRPS-SYSTEM             │
                    │    (Intelligentes Rasenpflege-  │
                    │         System)                 │
                    └─────────────────┬───────────────┘
                                      │
            ┌─────────────────────────┼─────────────────────────┐
            │                         │                         │
    ┌───────▼────────┐     ┌─────────▼────────┐     ┌─────────▼────────┐
    │  MOBILE-UNIT    │     │  BASE-STATION    │     │  CLOUD-SERVICES  │
    │ (Roboter)       │◄────┤  (Infrastruktur) │◄────┤  (Backend)       │
    │                 │     │                  │     │                  │
    └─────────────────┘     └──────────────────┘     └──────────────────┘
```

### 2.2 Funktionale Dekomposition (Mobile Unit)

```
┌─────────────────────────────────────────────────────────────────────┐
│                        MOBILE UNIT                                  │
├─────────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐ │
│  │ NAVIGATION  │  │ ANALYSIS    │  │ TREATMENT   │  │ PLATFORM    │ │
│  │ SUBSYSTEM   │  │ SUBSYSTEM   │  │ SUBSYSTEM   │  │ SUBSYSTEM   │ │
│  │             │  │             │  │             │  │             │ │
│  └─────────────┘  └─────────────┘  └─────────────┘  └─────────────┘ │
│         │                 │                 │                 │     │
│  ┌──────▼──────────────────▼─────────────────▼─────────────────▼───┐ │
│  │                SAFETY & COORDINATION                           │ │
│  │                     SUBSYSTEM                                  │ │
│  └────────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────────┘
```

## 3. Subsystem-Spezifikation (Anforderungs-Dekomposition)

### 3.1 Navigation Subsystem

**Verantwortlichkeiten:**
- Lokalisierung innerhalb Arbeitsgebiet (FR-001, FR-002)  
- Kartenerstellung und -pflege (FR-006)
- Pfadplanung und Routenoptimierung (FR-012)
- Hindernis- und Gefahrenerkennung (FR-003, FR-004, FR-005)

**Funktionale Komponenten:**
```
┌─────────────────────────────────────────────────────────────┐
│                    NAVIGATION SUBSYSTEM                     │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │LOCALIZATION │  │   MAPPING   │  │PATH PLANNING│        │
│  │   ENGINE    │  │   SERVICE   │  │   MODULE    │        │
│  │             │  │             │  │             │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
│         │                 │                 │              │
│  ┌──────▼─────────────────▼─────────────────▼────────────┐ │
│  │           OBSTACLE AVOIDANCE CONTROLLER               │ │
│  └────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

**Zugeordnete Requirements-Dekomposition:**
- FR-001 → Localization Engine (Primär: GNSS, Sekundär: Visual-SLAM)
- FR-002 → Localization Engine (Backup-Verfahren)
- FR-003 → Obstacle Avoidance Controller  
- FR-004 → Obstacle Avoidance Controller (Personen-Spezifisch)
- FR-005 → Obstacle Avoidance Controller (Tier-Spezifisch)
- FR-006 → Mapping Service
- FR-012 → Path Planning Module

### 3.2 Analysis Subsystem

**Verantwortlichkeiten:**
- Vegetations- und Bodenzustand erfassen (FR-020, FR-021)
- Behandlungsbedarfs-Identifikation (FR-050, FR-051, FR-052)
- Datenvorverarbeitung und Mustererkennung
- Behandlungsempfehlungen ableiten

**Funktionale Komponenten:**
```
┌─────────────────────────────────────────────────────────────┐
│                    ANALYSIS SUBSYSTEM                       │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │SENSOR DATA  │  │  PATTERN    │  │ DECISION    │        │
│  │ACQUISITION  │  │RECOGNITION  │  │ SUPPORT     │        │
│  │             │  │             │  │             │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
│         │                 │                 │              │
│  ┌──────▼─────────────────▼─────────────────▼────────────┐ │
│  │            ENVIRONMENTAL MODELING                     │ │
│  └────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

**Zugeordnete Requirements-Dekomposition:**
- FR-020 → Sensor Data Acquisition (NDVI-Analyse)
- FR-021 → Sensor Data Acquisition (Bodenfeuchte)
- FR-022 → Sensor Data Acquisition (Chlorophyll)
- FR-023 → Environmental Modeling (Temperaturkompensation)
- FR-050-052 → Pattern Recognition (KI-Unkrauterkennung)

### 3.3 Treatment Subsystem

**Verantwortlichkeiten:**
- Mähvorgang durchführen (FR-010, FR-011, FR-013, FR-014, FR-015)
- Selektive Düngung (FR-030, FR-031, FR-032, FR-034) 
- Bewässerungssteuerung (FR-040, FR-041, FR-042)
- Unkrautbekämpfung (FR-053, FR-054, FR-055)

**Funktionale Komponenten:**
```
┌─────────────────────────────────────────────────────────────┐
│                   TREATMENT SUBSYSTEM                       │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │   MOWING    │  │FERTILIZATION│  │ IRRIGATION  │        │
│  │ CONTROLLER  │  │ CONTROLLER  │  │ CONTROLLER  │        │
│  │             │  │             │  │             │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
│         │                 │                 │              │
│  ┌──────┴─────────────────┴─────────────────┴────────────┐ │
│  │              WEED CONTROL CONTROLLER                  │ │
│  │                                                       │ │
│  └───────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### 3.4 Platform Subsystem

**Verantwortlichkeiten:**
- Mechanische Plattform-Steuerung (Antrieb, Lenkung)
- Energiemanagement (PR-001, PR-002, PR-003)
- Kommunikation mit externen Systemen
- Hardware-Überwachung und Diagnose

**Funktionale Komponenten:**
```
┌─────────────────────────────────────────────────────────────┐
│                    PLATFORM SUBSYSTEM                       │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │  CHASSIS    │  │   POWER     │  │COMMUNICATION│        │
│  │ CONTROLLER  │  │ MANAGEMENT  │  │     HUB     │        │
│  │             │  │             │  │             │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
│         │                 │                 │              │
│  ┌──────▼─────────────────▼─────────────────▼────────────┐ │
│  │            DIAGNOSTICS & MONITORING                   │ │
│  └────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### 3.5 Safety & Coordination Subsystem (Querschnittsfunktion)

**Verantwortlichkeiten:**
- Notfall-Abschaltung (SR-001, SR-002, SR-003, SR-004)
- Sicherheitsüberwachung (SR-005-010)
- Subsystem-Koordination
- Fail-Safe-Verhalten

**Funktionale Komponenten:**
```
┌─────────────────────────────────────────────────────────────┐
│               SAFETY & COORDINATION SUBSYSTEM               │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │   SAFETY    │  │COORDINATION │  │  FAIL-SAFE  │        │
│  │  MONITOR    │  │  MANAGER    │  │ CONTROLLER  │        │
│  │             │  │             │  │             │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
└─────────────────────────────────────────────────────────────┘
```

## 4. Funktionsmodul-Zuordnung zu Architektur-Klassen

### 4.1 Funktionsmodul-Matrix

| Funktionsmodul | Entry-Level | Mid-Range | Premium | Requirements-Basis |
|----------------|-------------|-----------|---------|-------------------|
| **Navigation** |  |  |  |  |
| - Localization Engine | Basic GNSS | RTK-GNSS | RTK + Visual-SLAM | FR-001, FR-002 |
| - Mapping Service | Simple Grid | Layered Maps | Multi-Layer + ML | FR-006 |
| - Path Planning | A* Basic | A* Optimiert | Multi-Agent | FR-012 |
| - Obstacle Avoidance | Proximity | Vision-based | Multi-Modal | FR-003-005 |
| **Analysis** |  |  |  |  |
| - Sensor Data Acquisition | RGB-Kamera | Multispektral | Full Sensor Suite | FR-020-023 |
| - Pattern Recognition | Rule-based | Basic ML | Advanced AI | FR-050-052 |
| - Decision Support | Template | Adaptive | Predictive | Abgeleitet |
| **Treatment** |  |  |  |  |
| - Mowing Controller | Standard | Adaptive | Präzision + | FR-010-016 |
| - Fertilization Controller | - | Basic | Selektiv | FR-030-034 |
| - Irrigation Controller | - | Basic | Smart Control | FR-040-044 |
| - Weed Control | - | Detection Only | Full Treatment | FR-053-055 |
| **Platform** |  |  |  |  |
| - Chassis Controller | 2WD | AWD | Advanced AWD | Abgeleitet |
| - Power Management | Basic | Optimiert | Intelligent | PR-001-003 |
| - Communication Hub | WiFi | WiFi + Cell | Multi-Protocol | Abgeleitet |
| **Safety** | Alle Klassen identisch | | | SR-001-026 |

### 4.2 Upgrade-Pfade (Funktionsmodul-Ebene)

**Entry → Mid-Range:**
- Navigation: GNSS → RTK-GNSS  
- Analysis: RGB → Multispektral
- Treatment: + Fertilization Controller
- Platform: 2WD → AWD, Basic → Optimized Power

**Mid-Range → Premium:**
- Navigation: + Visual-SLAM, + Multi-Agent Planning
- Analysis: + Advanced AI, + Predictive Models
- Treatment: + Irrigation, + Weed Control
- Platform: + Multi-Protocol Communication

## 5. System-States Definition

### 5.1 Globale Systemzustände

```
                    ┌─────────────┐
                    │    INIT     │◄─── Power-On
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │    READY    │◄─── Idle/Waiting
                    └──────┬──────┘
                           │
                ┌──────────▼──────────┐
                │      ACTIVE         │
                │                     │
                │  ┌─────┬─────┬────┐ │
                │  │NAVI │ANAL │TRET│ │
                │  └─────┴─────┴────┘ │
                └──────────┬──────────┘
                           │
                    ┌──────▼──────┐
                    │   FAULT     │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │  SHUTDOWN   │
                    └─────────────┘
```

### 5.2 Zustandsdefinitionen

**INIT (Initialization):**
- System-Boot und Selbsttest
- Hardware-Komponenten-Initialisierung  
- Konfiguration laden
- Übergang zu READY nach erfolgreichem Test

**READY (Ready/Standby):**
- System betriebsbereit, keine aktive Mission
- Wartung auf Benutzer-Kommando oder Zeitplan
- Basis-Überwachung aktiv
- Notfall-Funktionen verfügbar

**ACTIVE (Active Mission):**
- Aktive Ausführung von Pflegeaufgaben
- Alle Subsysteme operativ
- Kontinuierliche Sicherheitsüberwachung
- Sub-States je nach aktiver Funktion

**FAULT (Error/Degraded):**
- Systemfehler erkannt
- Degraded-Mode oder Safe-Stop
- Fehlerbehandlung und Recovery-Versuche
- Benachrichtigung an Nutzer/Service

**SHUTDOWN (Controlled Shutdown):**
- Ordnungsgemäße Systemabschaltung
- Daten-Persistierung
- Hardware in sicheren Zustand
- Vorbereitung auf Power-Off

### 5.3 Navigation-Subsystem States

**LOCALIZING:** GPS-Fix suchen, Referenzpunkte abgleichen
**MAPPING:** Kartenerstellung, Umgebungserfassung
**NAVIGATING:** Route folgen, Hindernis-Umfahrung  
**DOCKING:** Rückkehr zur Basisstation
**LOST:** Position verloren, Recovery-Modus

### 5.4 Treatment-Subsystem States

**IDLE:** Bereit, kein Behandlungsauftrag
**ANALYZING:** Behandlungsbedarf bewerten
**MOWING:** Aktiver Mähvorgang
**FERTILIZING:** Düngung in Ausführung  
**IRRIGATING:** Bewässerung aktiv
**TREATING_WEEDS:** Unkrautbekämpfung
**REFILLING:** Verbrauchsmaterial nachfüllen

### 5.5 Safety-Subsystem States

**NORMAL:** Alle Sicherheitsparameter OK
**WARNING:** Erhöhte Aufmerksamkeit, Warnung aktiv
**CAUTION:** Eingeschränkter Betrieb
**EMERGENCY:** Notfall-Stopp ausgelöst
**MAINTENANCE:** Service-Modus, externe Wartung

## 6. Interface-Definition (Logisch)

### 6.1 Inter-Subsystem Interfaces

**Navigation ↔ Treatment:**
- Position Data Interface: Aktuelle Position, Orientierung
- Map Data Interface: Behandlungskarten, Verbotszonen  
- Path Coordination Interface: Route vs. Behandlungsbedarf

**Analysis ↔ Treatment:**
- Sensor Data Interface: Real-time Analysewerte
- Decision Interface: Behandlungsempfehlungen
- Feedback Interface: Behandlungserfolg-Bewertung

**Platform ↔ All:**
- Power Interface: Energie-Status, Verbrauchsprognosen
- Communication Interface: Externe Datenverbindungen
- Safety Interface: Notfall-Signale, Hardware-Status

### 6.2 External Interfaces

**Mobile Unit ↔ Base Station:**
- Mission Interface: Aufträge, Parameter, Fortschritt
- Data Interface: Sensor-Daten, Karten, Logs
- Service Interface: Wartung, Updates, Diagnose
- Resource Interface: Energie, Material-Nachfüllung

**System ↔ User:**
- Control Interface: Start/Stop, Modi, Einstellungen
- Status Interface: Aktueller Zustand, Fortschritt
- Alert Interface: Warnungen, Fehler, Service-Bedarf
- Report Interface: Berichte, Statistiken, Empfehlungen

**System ↔ Environment:**
- Weather Interface: Aktuelles Wetter, Prognosen
- Irrigation Interface: Externe Bewässerungssteuerung
- Smart Home Interface: Integration Home-Automation
- Service Interface: Remote-Diagnose, Support

## 7. Data Flow Architecture (Logisch)

### 7.1 Datenarten und Fluss-Pattern

**Control Data Flow (Command & Control):**
```
User/Scheduler → Mission Planning → Subsystem Commands → Actuators
```

**Sensor Data Flow (Sensing & Feedback):**
```
Sensors → Data Fusion → Analysis → Decision Making → Actions
```

**Safety Data Flow (Monitor & React):**
```
Safety Sensors → Safety Monitor → Emergency Controller → Safe Actions
```

### 7.2 Daten-Kategorien (Abstrakt)

**Real-time Control Data (<1s):**
- Navigation Commands, Safety Signals
- Sensor Raw Data, Actuator Feedback

**Operational Data (1s-1min):**  
- Analysis Results, Status Updates
- Environmental Measurements

**Planning Data (>1min):**
- Maps, Mission Plans, Reports
- Configuration, Logs, Statistics

## 8. Quality-Attribute-Decomposition

### 8.1 Reliability (RR-001 bis RR-005)

**Navigation Subsystem:**
- Redundant Localization (GPS + SLAM)
- Map Persistence and Recovery
- Graceful Degradation bei Sensor-Ausfall

**Treatment Subsystem:**
- Fail-Safe bei kritischen Fehlern
- Progress Tracking und Resume-Capability
- Material-Level Monitoring

**Platform Subsystem:**
- Battery Health Monitoring
- Hardware Diagnostics
- Emergency Power Management

### 8.2 Safety (SR-001 bis SR-026)

**Distributed Safety Architecture:**
- Hardware Emergency-Stop (nicht bypassbar)
- Software Safety Monitor (redundant)
- Safe-State Controller (fail-safe)

**Defense-in-Depth:**
- Physical Barriers (E-Stop, Sensors)
- Software Interlocks (Plausibility Checks)  
- Procedural Safeguards (User Training)

### 8.3 Performance (PR-001 bis PR-014)

**Execution Performance:**
- Real-time Control Loops (<100ms)
- Sensor Processing Pipeline (optimiert)
- Path Planning Algorithms (efficient)

**Resource Performance:**
- Energy-optimized Operations
- Memory-efficient Data Structures
- Communication Bandwidth Management

## 9. Validation gegen Sysspec Requirements

### 9.1 Requirements Coverage Check

**Navigation Requirements (FR-001 bis FR-008):**
✅ Alle Requirements durch Navigation Subsystem abgedeckt
✅ Dekomposition in Localization, Mapping, Path Planning logisch
✅ Redundanz-Konzept für kritische Funktionen vorhanden

**Treatment Requirements (FR-010 bis FR-055):**
✅ Alle Requirements durch Treatment Subsystem und Subcontroller abgedeckt
✅ Modular design ermöglicht klassenspezifische Ausstattung
✅ Feedback-Loops für Behandlungs-Erfolg definiert

**Safety Requirements (SR-001 bis SR-026):**
✅ Querschnittsfunktion Safety richtig positioniert
✅ Hardware- und Software-Safety getrennt aber koordiniert
✅ Fail-Safe-Verhalten in allen Subsystemen berücksichtigt

### 9.2 Architecture vs Requirements Consistency

| Architektur-Element | Requirements-Basis | Status |
|---------------------|-------------------|---------|
| Navigation Subsystem | FR-001 bis FR-008 | ✅ Vollständig |
| Analysis Subsystem | FR-020 bis FR-024, FR-050-052 | ✅ Vollständig |
| Treatment Subsystem | FR-010-016, FR-030-055 | ✅ Vollständig |
| Platform Subsystem | PR-001-014, Implizit | ✅ Vollständig |
| Safety Subsystem | SR-001-026 | ✅ Vollständig |
| State Model | RR-004, Implizit | ✅ Neu hinzugefügt |
| Class Architecture | AR-001-010 | ✅ In Sysspec definiert |

---

**Version**: 2.0  
**Erstellt**: 2025-09-01  
**Korrigiert**: Konkrete Realisierungsdetails entfernt, State-Definition hinzugefügt  
**Validation**: Vollständige Rückverfolgbarkeit zu Systemspezifikation  
**Status**: Bereit für technische Detailspezifikation