## Implementation Roadmap

### Phase 1: MVP Foundation (Woche 1-2)

**Sprint 1.1: Claude Code Setup & Core Agents (3-4 Tage)**
- [ ] Claude Code Installation und Grundkonfiguration
- [ ] Erstelle .claude/agents/ Verzeichnisstruktur
- [ ] Implementiere 4 Core Sub-Agents:
  - `discovery-agent.md` - Stakeholder/Use Case Discovery
  - `requirements-agent.md` - Funktionale/Non-funktionale Requirements
  - `architecture-agent.md` - Design-Entscheidungen
  - `documentation-agent.md` - Spec-Konsolidierung

**Sprint 1.2: LLM-optimiertes Spec Format (2-3 Tage)**
- [ ] Design strukturiertes Markdown-Format (Java/C lesbar)
- [ ] Template für sysspec.md und sysspec.llm.md
- [ ] Git-Integration für Versioning testen
- [ ] Basic Impact-Analyse zwischen Agenten

**Sprint 1.3: Erster End-to-End Test (1-2 Tage)**
- [ ] Teste kompletten Flow: Idee → Use Cases → Requirements → Arch → Spec
- [ ] Validiere Agent-zu-Agent Kontext-Übertragung
- [ ] Erste Iteration unserer eigenen "No App" Spec erstellen

### Phase 2: Agent Collaboration & Impact Analysis (Woche 3-4)

**Sprint 2.1: Inter-Agent Communication (3-4 Tage)**
- [ ] Implementiere strukturierte Agent-zu-Agent Handoffs
- [ ] Context-Preservation zwischen Agent-Sessions
- [ ] Dependency-Tracking zwischen Spec-Komponenten
- [ ] Consistency-Checks implementieren

**Sprint 2.2: Change Impact System (3-4 Tage)**
- [ ] Change-Detection in Spec-Komponenten
- [ ] Impact-Propagation durch Dependencies
- [ ] Git-basierte Change-History mit Begründungen
- [ ] Rollback-Mechanismus implementieren

### Phase 3: User Experience & Validation (Woche 5-6)

**Sprint 3.1: Slash Commands & Workflows (2-3 Tage)**
- [ ] .claude/commands/ für häufige Workflows:
  - `/analyze-change` - Impact-Analyse für Änderungen
  - `/validate-spec` - INCOSE-Compliance Check
  - `/serialize-for-coding` - Prompts für Code-Agenten generieren
- [ ] User-Feedback Integration für jeden Agent-Step

**Sprint 3.2: Quality Gates & Serialization (3-4 Tage)**
- [ ] INCOSE-Kriterien als automatische Checks
- [ ] Prompt-Serialization für downstream Agenten (Coding, Testing, Design)
- [ ] Export-Formate für verschiedene Zielgruppen
- [ ] Documentation und Beispiele

### Phase 4: Enhancement & Scaling (Woche 7-8)

**Sprint 4.1: Advanced Features (3-4 Tage)**
- [ ] MCP-Integration für externe Visualisierung
- [ ] Multi-User Support (Role-based Access)
- [ ] Performance-Optimierung für große Specs
- [ ] Error Handling und Recovery

**Sprint 4.2: Claude-Flow Migration Vorbereitung (2-3 Tage)**
- [ ] Claude-Flow Installation und Test
- [ ] Migration-Strategy für existierende Specs
- [ ] Hive-Mind Integration für komplexe Agent-Dialoge
- [ ] Performance-Vergleich Claude Code vs. Claude-Flow

### Meilensteine & Success Criteria

**M1 (Ende Woche 2): Functional MVP**
- ✅ 4 Core Agents funktionieren End-to-End
- ✅ Strukturierte sysspec.md wird generiert
- ✅ Git-Versioning funktioniert
- ✅ Ein reales System wurde spezifiziert

**M2 (Ende Woche 4): Iterative System**
- ✅ Änderungen propagieren korrekt durch alle Dependencies
- ✅ Impact-Analyse funktioniert zuverlässig
- ✅ Rollback auf vorherige Spec-Versionen möglich
- ✅ Agent-Collaboration nachweisbar stabil

**M3 (Ende Woche 6): Production Ready**
- ✅ User kann System ohne Frustration bedienen
- ✅ INCOSE-konforme Specs werden generiert
- ✅ Downstream-Agenten können mit serialisierten Prompts arbeiten
- ✅ Dokumentation und Beispiele verfügbar

**M4 (Ende Woche 8): Scaling Ready**
- ✅ Multi-User Support funktioniert
- ✅ Claude-Flow Integration getestet
- ✅ Performance für enterprise-grade Specs
- ✅ Migration-Path für Upgrade definiert

### Risk Mitigation

**Technische Risiken:**
- **Agent Context Loss:** Backup via explizite Context-Files zwischen Sessions
- **Git Merge Conflicts:** Strukturiertes Format minimiert Konflikte
- **Claude API Rate Limits:** Local Caching für wiederholte Analysen
- **MCP Server Ausfälle:** Fallback auf Text-basierte Workflows

**Scope-Risiken:**
- **Feature Creep:** Strikt bei MVP-Scope bleiben, Features für Phase 4+
- **Over-Engineering:** Simplicity First - nur was für MVP nötig ist
- **Perfectionism:** "Good enough" für erste Validierung reicht

### Definition of Done pro Phase

**Phase 1 DoD:**
- [ ] Alle Tests laufen durch (Manual Testing)
- [ ] Ein komplettes reales System wurde spezifiziert
- [ ] Code ist in Git committed
- [ ] Basic Documentation existiert

**Phase 2 DoD:**
- [ ] Change-Scenarios funktionieren ohne Inkonsistenzen
- [ ] Impact-Analyse zeigt korrekte Dependencies
- [ ] Rollback wurde getestet
- [ ] Agent-Collaboration ist dokumentiert

**Phase 3 DoD:**
- [ ] User Experience ist validiert (Usability Test)
- [ ] Quality Gates funktionieren automatisch
- [ ] Serialization für 3 downstream Agent-Types getestet
- [ ] Komplette Dokumentation verfügbar

**Phase 4 DoD:**
- [ ] Multi-User Konflikte getestet und gelöst
- [ ] Claude-Flow Migration funktioniert
- [ ] Performance-Benchmarks erfüllt
- [ ] Upgrade-Path dokumentiert# NoApp - System Specification

## Projektbeschreibung

"NoApp" ist ein iteratives System-Kontrollzentrum für die strukturbewusste Entwicklung komplexer Systeme (industriell, mechanisch, elektrisch, software-basiert). Anders als "one-shot" Generierungstools ermöglicht es die schrittweise, nachvollziehbare Entwicklung von Systemspezifikationen durch spezialisierte AI-Agenten mit kontinuierlicher User-Kontrolle.

Das System fungiert als Command & Control Center für **General Systems Engineering** - von Kaffeemaschinen über Automobile bis zu Industrieanlagen. Es erstellt nicht nur Spezifikationen, sondern orchestriert den gesamten Entwicklungslebenszyklus und gewährleistet dabei Konsistenz zwischen Spezifikation und Implementierung.

**Docker-Containerisierung:** Die Docker-Umgebung dient als Produktions-Sandbox, um die LLM-Agenten in einer sicheren, kontrollierten Umgebung laufen zu lassen. Dies ist keine reine Entwicklungsumgebung, sondern die tatsächliche Produktionsumgebung des Systems.

## Use Cases

### UC-001: Iterative Systemspezifikation
**Akteur:** Product Owner/System Architect/Systems Engineer  
**Ziel:** Entwicklung einer vollständigen Systemspezifikation durch strukturierten Dialog  
**Vorbedingung:** Grundlegende Systemidee vorhanden (z.B. Kaffeemaschine, Fahrzeugsteuerung, Produktionsanlage)  
**Hauptszenario:**
1. User startet mit Systemidee (beliebiger Systemtyp)
2. Discovery Agent analysiert Stakeholder und Use Cases
3. Market Research Agent recherchiert Wettbewerb und Trends
4. Requirements Agent extrahiert funktionale/non-funktionale Anforderungen
5. Constraints Agent identifiziert technische, rechtliche, business, physikalische Beschränkungen
6. Architecture Research Agent evaluiert System-Architektur-Optionen (mechanisch, elektrisch, software)
7. System Design Agent erstellt konkrete Architekturentscheidungen
8. Testing Strategy Agent entwickelt Teststrategie (inkl. physikalische Tests)
9. Documentation Agent konsolidiert zu strukturierter sysspec.md

### UC-002: Impact-bewusste Änderung
**Akteur:** Product Owner/System Architect  
**Ziel:** Änderung an Systemspezifikation ohne Konsistenzverlust  
**Vorbedingung:** Vollständige Systemspezifikation existiert  
**Hauptszenario:**
1. User requestet Änderung (z.B. neues Feature, geänderte Constraint)
2. System analysiert Impact auf alle Spezifikationsebenen
3. System identifiziert betroffene Requirements, Architektur, Tests
4. System präsentiert Change-Plan mit Dependencies
5. User wählt schrittweise Umsetzung vs. Batch-Update
6. System orchestriert Änderung konsistent durch alle Ebenen
7. System validiert finale Konsistenz

### UC-003: Agent-Orchestrierung
**Akteur:** System (automatisch)  
**Ziel:** Koordination nachgelagerter Implementierungs-Agenten  
**Vorbedingung:** Vollständige/geänderte Systemspezifikation  
**Hauptszenario:**
1. System serialisiert Spezifikation als strukturierte Prompts
2. System identifiziert betroffene Implementierungs-Domänen (Mechanik, Elektronik, Software, Test, Produktion)
3. System dispatcht spezifische Prompts an entsprechende Engineering-Teams/Agenten
4. System monitort Implementierungs-Status
5. System validiert Spec-Konformität der Implementierungen
6. System reportet Abweichungen/Inkonsistenzen

### UC-004: Entwicklungshistorie & Rollback
**Akteur:** Product Owner/System Architect  
**Ziel:** Nachvollziehbarkeit und Rückgängigmachung von Änderungen  
**Vorbedingung:** System mit Änderungshistorie  
**Hauptszenario:**
1. User browst Entwicklungshistorie
2. System zeigt Änderungen mit Begründungen und Impact
3. User wählt Rollback-Punkt
4. System analysiert Forward-Dependencies
5. System führt konsistenten Rollback durch
6. System aktualisiert nachgelagerte Implementierungen

## Requirements & Clarification Needs

### Funktionale Requirements

**FR-001: Strukturbewusste Spezifikation**
- Kunde will: Änderungen ohne "kaputtmachen" der Gesamtspezifikation
- Kunde will: Verstehen welche Teile voneinander abhängen
- Kunde will: Spezifikationen für beliebige Systemtypen (mechanisch, elektrisch, software, hybrid)

**✅ Geklärt:**
- **Granularität:** Bis auf logische Funktionen/Requirements-Ebene
- **Dependencies:** Hard = zwingende Abhängigkeiten (A benötigt B), Soft = beeinflusst/optimiert (A profitiert von B)
- **"Kaputt" bedeutet:** Logische Widersprüche oder Unvollständigkeit
- **Visualisierung:** ASCII-Grafik maximal, Interface zu externen Visualisierungs-Tools (MCP)

**FR-002: Spezialisierte Agent-Expertise**
- Kunde will: Expertenwissen für verschiedene Engineering-Disziplinen
- Kunde will: Nicht selbst Experte in allen Domänen sein müssen (Mechanik, Elektronik, Software, Sicherheit, etc.)

**✅ Geklärt:**
- **Agent-Granularität:** Flexibel nach oben skalierbar, Grundanforderung an Spec gleich, Tiefe/Menge variabel
- **Expertise-Level:** Immer Senior-Level für alle Agenten
- **Agent-Interaktion:** Collaborative! (Bsp: Requirement ↔ Testcase nur im Dialog möglich)
- **Domain-Abdeckung:** Unbekannte Domänen → Research Agent triggern oder User fragen

**FR-003: Änderungs-Impact Transparenz**
- Kunde will: Verstehen was eine Änderung bewirkt bevor er sie macht
- Kunde will: Keine bösen Überraschungen nach Änderungen

**✅ Geklärt:**
- **Impact-Visualisierung:** Text-Liste aktuell, Interface zu ext. Visualisierung (MCP) vorsehen
- **Impact-Scope:** Direkte Auswirkungen und Kaskaden-Effekte
- **Änderungs-Granularität:** Logische Funktionen/Requirements-Level
- **Veto-Recht:** User kann impact-reiche Änderungen ablehnen und Alternativen fordern

**FR-004: Kontrollierte Entwicklung**
- Kunde will: Kontrolle über jeden wichtigen Entwicklungsschritt
- Kunde will: Verstehen warum das System bestimmte Vorschläge macht

**✅ Geklärt:**
- **Kontrollebene:** Alles was Use Cases beeinflusst
- **Interaktions-Modus:** Synchron, Erstreaktion < 2 Sekunden
- **Validierungs-Optionen:** Approve/Reject/Modify/Request-Alternative
- **Begründungs-Tiefe:** Das "Why" muss klar werden, so knapp wie möglich
- **Batch vs. Step-by-Step:** Analog Claude-Settings: Auto-Approve + Batch-Option

**FR-005: Agent-Orchestrierung**
- Kunde will: Spezifikation als "Single Source of Truth" für alle nachgelagerten Aktivitäten
- Kunde will: Nicht manuell zwischen verschiedenen Tools/Agenten koordinieren müssen

**✅ Geklärt:**
- **Prompt-Formate:** User ↔ Natural Language, intern LLM-optimiert, externe Schnittstellen via Konverter
- **Agent-Types:** Fokus auf Spec-Agenten, nachgelagerte flexibel (Standard: Coding, Testing, Deployment)
- **Status-Tracking:** Real-time Updates
- **Conflict-Resolution:** User wählt: a) Accept & adapt Spec, b) Reject & change Implementation

**FR-006: Evolution & Historie**
- Kunde will: Entwicklungsschritte nachvollziehen können
- Kunde will: "Undo" für schlechte Entscheidungen

**✅ Geklärt:**
- **Rollback-Granularität:** Git-analog: Commits, Diffs, Branches
- **Historie-Detail:** Endergebnisse + Reasoning-Prozess
- **Forward-Kompatibilität:** Impact-Analyse bei Rollback auf nachgelagerte Implementierungen
- **Branching:** Ja, alternative Entwicklungspfade parallel verfolgbar

### Testing Strategy (MVP)

#### Minimal Viable Testing

**Phase 1: Manual Validation Only**
- **Smoke Tests:** Funktioniert der Basic Agent-Flow Ende-zu-Ende?
- **Plausibility Checks:** Sind Agent-Outputs fachlich sinnvoll? (Human Review)
- **User Acceptance:** Kann ein Systems Engineer/Product Owner damit arbeiten?
- **Domain Coverage:** Funktioniert es für verschiedene Systemtypen? (Kaffeemaschine ✓, Auto, Industrieanlage)

**Phase 2: Basic Automation (später)**
- **Response Time Monitoring:** < 2s Erstreaktion gemessen
- **Basic Consistency:** Einfache Widerspruchserkennung zwischen Requirements
- **Output Format Validation:** Strukturierte sysspec.md wird korrekt generiert

#### Einfache Test-Fälle
- **Happy Path:** Einfaches System von Idee zu Spec (z.B. Kaffeemaschine, Türschloss, Thermostat)
- **Change Scenario:** Eine Änderung durchs System propagieren (z.B. neue Sicherheitsanforderung)
- **Rollback Test:** Zurück zu vorherigem Zustand
- **Multi-Domain Test:** System mit mechanischen, elektrischen und Software-Komponenten

#### Test-Erfolg = Nutzbarkeit
- Erzeugte Spec ist implementierbar (subjektive Bewertung)
- User kann das System ohne Frustration bedienen
- Grundlegende Funktionen (Ändern, Rollback) funktionieren

**Erst bei Erfolg der ersten Version:** Komplexere Test-Automation aufbauen

**V-001: Explizite Nicht-Ziele definieren**
- Was ist explizit NICHT Ziel? (z.B. "Keine One-Shot Code-Generierung")
- Welche Trade-offs sind bewusst akzeptiert?

**V-002: User-Personas differenzieren**
- Product Owner vs. System Architect vs. Developer - unterschiedliche Bedürfnisse?
- Experience-Level berücksichtigen (Novice vs. Expert)?

**V-003: Kollaborations-Szenarien**
- Multi-User Szenarien: Team-Entwicklung? Review-Prozesse?
- Stakeholder-Integration: Wie kommen fachliche Experten ins System?

**V-004: Qualitäts-Gates definieren**
- **INCOSE-Kriterien:** Completeness, Consistency, Verifiability, Traceability, Necessity
- Wann ist eine Spezifikation "gut genug" für nachgelagerte Implementierung?
- Automatische Qualitätschecks vs. manuelle Reviews

**V-005: Kollaborations-Szenarien (Multi-User)**
- **Role-based Access:** Rollen ergeben sich aus Aktivitäten
  - Use Cases beschreiben/ändern → Product Owner
  - Requirements definieren/verfeinern → Business Analyst
  - Architektur entscheiden → System Architect
  - Test-Strategien entwickeln → QA Lead
- **Concurrent Editing:** Konfliktresolution bei parallelen Änderungen
- **Review-Workflows:** Approval-Prozesse für kritische Änderungen
- **Stakeholder-Integration:** Fachexperten für Domain-spezifische Validierung

### Non-Funktionale Requirements

**NFR-001: Nachvollziehbarkeit**
- Alle Entscheidungen müssen mit Begründung und Kontext dokumentiert sein
- Entwicklungsschritte müssen reproduzierbar sein
- Change-History muss auditierbar sein

**NFR-002: Konsistenz**
- Spezifikation muss zu jedem Zeitpunkt intern konsistent sein
- Änderungen dürfen keine versteckten Inkonsistenzen einführen
- Rollbacks müssen zu konsistentem Zustand führen

**NFR-003: Iterationsperformance**
- Impact-Analyse muss innerhalb von 10 Sekunden abgeschlossen sein
- User-Feedback-Zyklen müssen unter 30 Sekunden liegen
- Spec-Serialisierung muss unter 5 Sekunden erfolgen

**NFR-004: Erweiterbarkeit**
- Neue spezialisierte Agenten müssen ohne System-Änderung hinzufügbar sein
- Neue Implementierungs-Domänen müssen unterstützt werden können
- Spezifikations-Schema muss erweiterbar sein