#!/bin/bash
# NoApp Agent Orchestrator - Multi-Agent Collaboration with Streaming

set -e

# Configuration
WORKSPACE="$(pwd)"
SPECS_DIR="$WORKSPACE/specs"
AGENTS_DIR="$WORKSPACE/agents"
CONTEXT_FILE="$SPECS_DIR/agent-context.md"
OUTPUT_FILE="$SPECS_DIR/multi-agent-analysis.md"

# Colors for streaming output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Timing
START_TIME=$(date +%s)

# Stream output function
stream_output() {
    local agent=$1
    local color=$2
    local message=$3
    local timestamp=$(date +"%H:%M:%S.%3N")
    echo -e "${color}[${timestamp}] [${agent}]${NC} ${message}"
}

# Response time check
check_response_time() {
    local agent=$1
    local start=$2
    local end=$(date +%s)
    local response_time=$((end - start))
    
    if [ $response_time -gt 2 ]; then
        stream_output "SYSTEM" "$RED" "⚠️  ${agent} response time: ${response_time}s (>2s threshold)"
    else
        stream_output "SYSTEM" "$GREEN" "✓ ${agent} response time: ${response_time}s"
    fi
}

# Initialize orchestration
initialize() {
    stream_output "ORCHESTRATOR" "$CYAN" "🚀 Starting multi-agent collaboration..."
    stream_output "ORCHESTRATOR" "$CYAN" "📁 Workspace: $WORKSPACE"
    
    # Create context file
    cat > "$CONTEXT_FILE" << 'EOF'
# Agent Collaboration Context

## System Under Analysis
- Type: Industrial Coffee Machine
- Phase: Requirements & Risk Analysis
- Goal: Complete system specification with safety validation

## Previous Agent Outputs
This file will be updated as agents complete their analysis.

## Collaboration Protocol
1. Discovery Agent identifies requirements
2. Test Agent challenges and validates
3. Safety Agent performs risk assessment
4. Agents iterate based on findings

---
EOF
    
    stream_output "ORCHESTRATOR" "$GREEN" "✓ Context initialized"
}

# Simulate agent execution (would be actual Claude calls in production)
run_discovery_agent() {
    local start=$(date +%s)
    stream_output "DISCOVERY" "$BLUE" "🔍 Starting stakeholder and requirements analysis..."
    
    # Simulate processing with progress
    for i in {1..3}; do
        sleep 0.5
        stream_output "DISCOVERY" "$BLUE" "   Analyzing use case $i/3..."
    done
    
    # Generate output
    cat >> "$OUTPUT_FILE" << 'EOF'
# Discovery Agent Analysis

## Identified Stakeholders
1. **Barista** - Primary operator
2. **Customer** - End consumer
3. **Maintenance Tech** - Service personnel
4. **Cafe Owner** - Business stakeholder

## Key Use Cases
### UC-001: Brew Coffee
- Actor: Barista
- Trigger: Customer order
- Flow: Select size → Insert portafilter → Start brew → Serve
- Success: Coffee at correct temp (92-96°C) and volume

### UC-002: Steam Milk
- Actor: Barista
- Trigger: Cappuccino/Latte order
- Flow: Fill pitcher → Insert wand → Steam to 65°C → Pour
- Success: Properly textured milk without scalding

## Functional Requirements
- FR-001: Maintain water temperature 92-96°C ±1°C
- FR-002: Deliver 9 bar pressure during extraction
- FR-003: Steam pressure 1.2-1.5 bar
- FR-004: Auto-shutoff after 30 min idle

## Constraints Identified
- Power: 220-240V, 2.8kW max
- Water pressure: 1-6 bar input
- Dimensions: Max 600x500x400mm
- Certifications: CE, NSF required

---
EOF
    
    check_response_time "DISCOVERY" $start
    stream_output "DISCOVERY" "$GREEN" "✓ Discovery analysis complete"
    
    # Update context
    echo "## Discovery Agent Output: Complete ✓" >> "$CONTEXT_FILE"
}

# Run Test Agent
run_test_agent() {
    local start=$(date +%s)
    stream_output "TEST" "$YELLOW" "🧪 Starting test strategy and validation..."
    stream_output "TEST" "$YELLOW" "   Reading discovery agent output..."
    
    sleep 0.8  # Simulate reading
    
    stream_output "TEST" "$YELLOW" "   ❓ Challenging requirement FR-001: How to verify ±1°C accuracy?"
    sleep 0.5
    stream_output "TEST" "$YELLOW" "   ❓ Edge case: What if both brewing and steaming requested simultaneously?"
    sleep 0.5
    stream_output "TEST" "$YELLOW" "   ❓ Missing requirement: Max brew time limits?"
    
    # Generate test output
    cat >> "$OUTPUT_FILE" << 'EOF'
# Test Agent Analysis

## Requirement Challenges
1. **FR-001 Temperature Control**
   - Challenge: ±1°C is very tight tolerance
   - Test Method: Continuous monitoring with calibrated sensors
   - Test Duration: 100 brew cycles
   
2. **Missing: Concurrent Operations**
   - Gap: No req for simultaneous brew/steam
   - Risk: User confusion or system damage
   - Needed: Mutex control or clear error messaging

## Test Scenarios
### TS-001: Temperature Stability Test
- Setup: Calibrated thermocouples at boiler and group head
- Execution: 50 consecutive shots, measure temp variance
- Pass Criteria: All readings within 92-96°C range

### TS-002: Pressure Consistency Test  
- Setup: Digital pressure gauge at portafilter
- Execution: 20 shots with different grind sizes
- Pass Criteria: 9±0.5 bar maintained for 25-30 seconds

### TS-003: Safety Interlock Test
- Setup: Attempt unsafe operations
- Execution: 
  - Remove portafilter during brew
  - Steam with empty boiler
  - Exceed max pressure
- Pass Criteria: All operations safely terminated

## Test Environment Requirements
- Calibrated measurement equipment
- Water quality: TDS 150±50ppm
- Ambient temp: 20-25°C
- Power stability: ±5% variance max

## Gaps Identified
- No performance degradation criteria
- Missing cleaning cycle validation
- No EMC testing specified

---
EOF
    
    check_response_time "TEST" $start
    stream_output "TEST" "$GREEN" "✓ Test validation complete"
    
    # Feedback to Discovery
    stream_output "TEST" "$YELLOW" "→ Sending feedback to Discovery Agent..."
    echo "## Test Agent Feedback: 3 gaps identified, 2 requirements challenged" >> "$CONTEXT_FILE"
}

# Run System Architect Agent
run_architect_agent() {
    local start=$(date +%s)
    stream_output "ARCHITECT" "$CYAN" "🏗️  Starting system architecture design..."
    stream_output "ARCHITECT" "$CYAN" "   Reading requirements and test feedback..."
    
    sleep 0.7
    stream_output "ARCHITECT" "$CYAN" "   📐 Designing system decomposition..."
    sleep 0.5
    stream_output "ARCHITECT" "$CYAN" "   🔌 Defining interfaces: Power, Water, Steam, Control"
    sleep 0.5
    stream_output "ARCHITECT" "$CYAN" "   📊 Mapping data flows and dependencies..."
    
    # Generate architecture output
    cat >> "$OUTPUT_FILE" << 'EOF'
# System Architect Analysis

## System Decomposition

### Level 1: Major Subsystems
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Water System   │───▶│ Thermal System  │───▶│ Brewing System  │
│  - Pump         │    │ - Boiler        │    │ - Group Head    │
│  - Reservoir    │    │ - Heating       │    │ - Portafilter   │
│  - Filtration   │    │ - Temp Control  │    │ - Pressure      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│ Control System  │    │  Steam System   │    │ Human Interface │
│ - Controller    │    │ - Steam Wand    │    │ - Controls      │
│ - Sensors       │    │ - Pressure Reg  │    │ - Display       │
│ - Safety Logic  │    │ - Auto Texture  │    │ - Indicators    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Level 2: Critical Interfaces

#### ICD-001: Water-Thermal Interface
- Source: Water System (Pump)
- Destination: Thermal System (Boiler)
- Type: Physical (Water flow)
- Specification: 1-6 bar input, filtered water
- Performance: 2L/min max flow, TDS 150±50ppm

#### ICD-002: Thermal-Brewing Interface  
- Source: Thermal System (Boiler)
- Destination: Brewing System (Group Head)
- Type: Physical (Heated water + pressure)
- Specification: 92-96°C ±1°C, 9 bar ±0.5 bar
- Performance: 25-30 second extraction time

#### ICD-003: Control-All Interface
- Source: Control System
- Destination: All subsystems
- Type: Electrical (Control signals)
- Specification: 24V control signals, CAN bus
- Performance: <100ms response time

## Dependency Matrix

| Component      | Hard Dependencies | Soft Dependencies | Provides To      |
|----------------|-------------------|-------------------|------------------|
| Water Pump     | Power, Reservoir  | Flow Sensor       | Boiler, Steam    |
| Boiler         | Power, Water      | Pressure Sensor   | Group Head, Steam|
| Controller     | Power            | All Sensors       | All Actuators    |
| Group Head     | Boiler, Pump     | Portafilter       | Coffee Output    |
| Steam Wand     | Boiler           | Pressure Reg      | Milk Steaming    |
| Safety System  | Power, Sensors   | -                 | Shutdown Control |

## Data/Media Flow Analysis

### Information Flow
```
Sensors → Controller → Actuators
   ↓         ↓           ↓
 Status    Logic      Action
Display ← Processing → Control
```

### Control Flow Sequence
1. User Input → Controller
2. Controller → Sensor Reading
3. Sensor Data → Safety Check
4. Safety OK → Actuator Command  
5. Actuator Action → Process Execution
6. Process Status → User Feedback

### Physical Media Flow
```
Water: Reservoir → Filter → Pump → Boiler → Group Head → Coffee
Steam: Boiler → Pressure Reg → Steam Wand → Milk
Heat: Heating Element → Boiler → Water/Steam
```

### Error Flow & Failure Modes
- Over-temperature → Safety Shutdown → All Systems
- Over-pressure → Relief Valve → Safe Venting
- Water Empty → Pump Disable → Process Stop
- Power Loss → Safe State → Manual Override

## Integration Strategy

### Build Sequence
1. **Phase 1:** Water & Thermal Systems (Basic heating)
2. **Phase 2:** Control System Integration (Automated control)
3. **Phase 3:** Brewing System (Pressure & extraction)
4. **Phase 4:** Steam System (Milk steaming)  
5. **Phase 5:** Safety & User Interface (Complete system)

### Critical Integration Points
- Water-Thermal pressure matching
- Control-Safety system coordination
- Thermal stability during concurrent operations
- User interface response timing

## Architecture Validation
- All FR requirements mapped to components ✓
- Safety requirements integrated at system level ✓
- Test scenarios cover all interfaces ✓
- Manufacturing assembly sequence defined ✓

---
EOF
    
    check_response_time "ARCHITECT" $start
    stream_output "ARCHITECT" "$GREEN" "✓ System architecture complete"
    
    echo "## System Architect Output: Complete architecture with interfaces and dependencies" >> "$CONTEXT_FILE"
}

# Run Safety Agent  
run_safety_agent() {
    local start=$(date +%s)
    stream_output "SAFETY" "$RED" "⚠️  Starting risk assessment..."
    stream_output "SAFETY" "$RED" "   Reviewing architecture for hazards..."
    
    sleep 0.6
    stream_output "SAFETY" "$RED" "   🔥 HAZARD: Scalding risk from 96°C water"
    sleep 0.4
    stream_output "SAFETY" "$RED" "   ⚡ HAZARD: Electrical shock from 2.8kW system"
    sleep 0.4
    stream_output "SAFETY" "$RED" "   💥 HAZARD: Over-pressure explosion risk"
    
    # Generate safety output
    cat >> "$OUTPUT_FILE" << 'EOF'
# Safety Agent Risk Assessment

## Critical Risks Identified

### RISK-001: Thermal Burns
- **Description:** Hot water/steam contact with skin
- **Cause:** Steam wand contact, splashing, spills
- **Severity:** 4/5 (Critical - 2nd degree burns possible)
- **Probability:** 3/5 (Occasional during normal use)
- **Risk Level:** HIGH (12/25)
- **Mitigation:** 
  - Insulated steam wand
  - Auto-retract after use
  - Cool-touch surfaces
  - Clear warning labels
- **Residual Risk:** MEDIUM (8/25)

### RISK-002: Pressure Vessel Failure
- **Description:** Boiler explosion due to over-pressure
- **Cause:** Pressure relief valve failure, blockage
- **Severity:** 5/5 (Catastrophic)
- **Probability:** 1/5 (Improbable with controls)
- **Risk Level:** MEDIUM (5/25)
- **Mitigation:**
  - Dual pressure relief valves
  - Electronic pressure monitoring
  - Auto-shutdown at 12 bar
  - Annual inspection requirement
- **Residual Risk:** LOW (2/25)

### RISK-003: Electrical Hazard
- **Description:** Shock from water ingress
- **Cause:** Spills, steam condensation
- **Severity:** 4/5 (Critical)
- **Probability:** 2/5 (Remote)
- **Risk Level:** MEDIUM (8/25)
- **Mitigation:**
  - IP44 rated components
  - GFCI protection required
  - Sealed electrical compartment
  - Drip tray overflow sensor
- **Residual Risk:** LOW (3/25)

## Safety Requirements
- SR-001: Dual independent over-temp protection
- SR-002: Pressure relief at 12 bar (redundant valves)
- SR-003: GFCI protection mandatory
- SR-004: Auto-shutoff on tilt >15°
- SR-005: Lock-out/tag-out for maintenance

## Compliance Requirements
- IEC 60335-2-75 (Household coffee makers)
- EN 60335-2-15 (Heating liquids)
- NSF/ANSI 4 (Commercial equipment)
- CE marking (European market)

## Safety Test Requirements
- Pressure vessel hydrostatic test at 1.5x operating
- Dielectric strength test 1250V
- IP44 ingress protection validation
- Emergency stop response <100ms

---
EOF
    
    check_response_time "SAFETY" $start
    stream_output "SAFETY" "$GREEN" "✓ Risk assessment complete"
    stream_output "SAFETY" "$RED" "⚠️  3 HIGH/MEDIUM risks require mitigation"
    
    echo "## Safety Agent Output: 3 critical risks, 5 safety requirements added" >> "$CONTEXT_FILE"
}

# Agent collaboration round
collaborate() {
    stream_output "ORCHESTRATOR" "$CYAN" "🔄 Starting collaboration round..."
    
    # Simulate agents reading each other's outputs
    stream_output "DISCOVERY" "$BLUE" "   Reading architecture and safety requirements..."
    sleep 0.3
    stream_output "DISCOVERY" "$BLUE" "   ✓ Adding SR-001 through SR-005 to requirements"
    
    stream_output "TEST" "$YELLOW" "   Reading architecture interfaces..."
    sleep 0.3
    stream_output "TEST" "$YELLOW" "   ✓ Adding interface test scenarios TS-004 through TS-007"
    
    stream_output "ARCHITECT" "$CYAN" "   Reading safety hazards and test gaps..."
    sleep 0.3
    stream_output "ARCHITECT" "$CYAN" "   ✓ Adding safety barriers to architecture design"
    
    stream_output "SAFETY" "$RED" "   Reading architecture failure modes..."
    sleep 0.3
    stream_output "SAFETY" "$RED" "   ✓ Adding architecture-specific risk mitigations"
    
    # Update collaboration results
    cat >> "$OUTPUT_FILE" << 'EOF'

# Collaboration Results

## Consensus Requirements (All Agents Agree)
1. Temperature control with dual sensor validation
2. Pressure monitoring with redundant safety
3. Comprehensive operator training required
4. Maintenance lockout procedures mandatory

## Open Issues Requiring Resolution
1. Simultaneous brew/steam capability - needs architecture decision
2. Performance degradation thresholds - needs business input
3. Cleaning validation frequency - needs operational input

## Next Steps
1. Architecture agent to resolve concurrent operation design
2. Business stakeholder review of operational requirements
3. Final validation of safety mitigations

---
EOF
    
    stream_output "ORCHESTRATOR" "$GREEN" "✓ Collaboration round complete"
}

# Main execution
main() {
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}     NoApp Multi-Agent Collaboration System${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    echo
    
    # Initialize
    initialize
    
    # Clear previous output
    > "$OUTPUT_FILE"
    
    # Run agents in sequence with streaming
    echo
    stream_output "ORCHESTRATOR" "$CYAN" "📊 Phase 1: Initial Analysis"
    echo -e "${CYAN}───────────────────────────────────────────────────────${NC}"
    run_discovery_agent
    
    echo
    run_test_agent
    
    echo
    run_architect_agent
    
    echo
    run_safety_agent
    
    # Collaboration
    echo
    stream_output "ORCHESTRATOR" "$CYAN" "📊 Phase 2: Agent Collaboration"
    echo -e "${CYAN}───────────────────────────────────────────────────────${NC}"
    collaborate
    
    # Final summary
    echo
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    stream_output "ORCHESTRATOR" "$GREEN" "✅ Multi-agent analysis complete!"
    
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    
    echo
    stream_output "SYSTEM" "$CYAN" "📊 Execution Statistics:"
    stream_output "SYSTEM" "$CYAN" "   Total Duration: ${DURATION}s"
    stream_output "SYSTEM" "$CYAN" "   Agents Executed: 4 (Discovery, Test, Architect, Safety)"
    stream_output "SYSTEM" "$CYAN" "   Collaboration Rounds: 1"
    stream_output "SYSTEM" "$CYAN" "   Output File: $OUTPUT_FILE"
    
    # Check if response time requirement met
    if [ $DURATION -gt 10 ]; then
        stream_output "SYSTEM" "$RED" "⚠️  Total execution time exceeded target"
    fi
    
    echo
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
}

# Run if executed directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi