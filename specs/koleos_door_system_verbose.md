# Renault Koleos (2017-2024) - Door Locking System Specification (Verbose)

**Vehicle Type:** Mid-size SUV  
**System:** Electronic Door Locking and Access Control System  
**Documentation Source:** Official Renault Owner's Manual Analysis

## Use Case 001: Remote Lock via RENAULT Card

**Use Case ID:** UC-001  
**Use Case Name:** Remote Vehicle Locking using RENAULT Card  
**Primary Actor:** Vehicle Owner  
**Secondary Actors:** Vehicle Security System, Central Locking Module  
**Stakeholders:** Vehicle Owner (security), Insurance Companies (theft prevention)  

**Trigger Event:** Vehicle owner presses the lock button on RENAULT card  
**Trigger Type:** External user action  

**Preconditions:**  
- RENAULT card battery is functional and has sufficient charge  
- Vehicle is within communication range (approximately 2-3 meters)  
- All doors and tailgate are properly closed and latched  
- Vehicle electrical system is operational  
- RENAULT card is synchronized with vehicle security system  

**Main Success Scenario:**  
1. Vehicle owner presses lock button (button 2 or 3) on RENAULT card
2. RENAULT card transmits encrypted locking signal to vehicle receiver
3. Vehicle security system validates signal authentication and card identity  
4. Central locking module activates all door lock actuators simultaneously
5. Vehicle security system activates alarm system and immobilizer
6. Hazard warning lights flash twice to provide visual confirmation of successful locking
7. Vehicle enters secured state with all access points locked

**Postconditions:**  
- All doors, tailgate, and fuel filler flap are locked and secured  
- Vehicle security system is armed and monitoring for intrusion attempts  
- Hazard lights have provided confirmation feedback to user  
- Vehicle is protected against unauthorized access  

**Alternative Flows:**  
- **1a. Door or Tailgate Open:** If any door or tailgate is not properly closed, system displays warning message "Boot open" or "Door open", partial locking occurs with open elements excluded, hazard lights flash once to indicate partial lock status
- **1b. RENAULT Card Battery Low:** System detects weak signal, may still function but displays low battery warning on dashboard, user should replace card battery soon  
- **1c. Signal Interference:** If radio frequency interference prevents signal reception, user must move closer to vehicle and retry, alternative is manual key operation
- **1d. Card Not Recognized:** If card is not synchronized or damaged, system ignores command, no visual feedback provided, user must use backup key method

**Exception Flows:**  
- **E1. System Malfunction:** If central locking module fails, individual door locks may still function manually, user should contact authorized service center  
- **E2. Electrical System Failure:** If vehicle battery is completely discharged, remote locking is not possible, manual key lock remains available

**Business Rules:**  
- Only one RENAULT card can command vehicle at a time  
- Locking command has priority over unlocking if both received simultaneously  
- System must prevent locking when any occupant is detected inside vehicle  

**Quality Requirements:**  
- Signal range must be consistent within specified operating parameters  
- Response time from button press to lock activation must be under 2 seconds  
- Visual feedback must be clearly visible in daylight and darkness conditions  
- Security encryption must meet automotive industry standards  

## Use Case 002: Hands-Free Locking

**Use Case ID:** UC-002  
**Use Case Name:** Automatic Vehicle Locking via Proximity Detection  
**Primary Actor:** Vehicle Owner  
**Secondary Actors:** Proximity Detection System, Security Module  
**Stakeholders:** Vehicle Owner (convenience), Technology Users (automation preference)  

**Trigger Event:** Vehicle owner moves away from vehicle while carrying RENAULT card  
**Trigger Type:** Automatic system detection  

**Preconditions:**  
- RENAULT card is in hands-free mode (activated)  
- Vehicle owner has RENAULT card in possession  
- All doors and tailgate are properly closed  
- Vehicle is in parked state with engine off  
- Proximity sensors are functional and unobstructed  

**Main Success Scenario:**  
1. Vehicle proximity detection system continuously monitors for RENAULT card presence
2. System detects RENAULT card moving outside of access zone (zone 1, approximately 1.5 meters)
3. System verifies all doors and tailgate are properly closed and latched  
4. Proximity system confirms no additional RENAULT cards remain inside vehicle
5. Central locking system activates all door lock mechanisms automatically  
6. Vehicle security system arms itself and begins monitoring for intrusion
7. Visual confirmation provided through brief hazard light activation

**Postconditions:**  
- Vehicle is locked and secured without manual user intervention  
- Hands-free mode remains active for next approach  
- Security system is armed and protecting vehicle  
- User can walk away with confidence that vehicle is secured  

**Alternative Flows:**  
- **2a. Door Handle Touched During Locking:** If user touches door handle during auto-lock sequence, system cancels locking operation, brief delay before retry, user must move completely away for auto-lock to function
- **2b. Multiple Cards Present:** If system detects additional RENAULT cards in vicinity, system delays auto-lock until card positions are clearly determined, prevents locking with card inside vehicle
- **2c. Obstruction Detected:** If door or tailgate not fully closed, system does not auto-lock, provides warning signal, user must ensure proper closure

**Exception Flows:**  
- **E1. Sensor Malfunction:** If proximity sensors fail, hands-free locking is disabled, system reverts to manual locking operation only, service indication displayed
- **E2. Environmental Interference:** Strong electromagnetic fields may affect proximity detection, system may become unreliable in such conditions

**Quality Requirements:**  
- Proximity detection must be accurate within ±10cm of specified zones  
- System must distinguish between intentional departure and temporary movement  
- Auto-lock delay should be 2-3 seconds to prevent accidental activation  

## Use Case 003: Remote Unlock via RENAULT Card

**Use Case ID:** UC-003  
**Use Case Name:** Remote Vehicle Unlocking using RENAULT Card  
**Primary Actor:** Vehicle Owner  
**Secondary Actors:** Vehicle Access System, Interior Lighting Control  
**Stakeholders:** Vehicle Owner (access), Emergency Services (accessibility)  

**Trigger Event:** Vehicle owner presses unlock button on RENAULT card  
**Trigger Type:** External user action  

**Preconditions:**  
- Vehicle is currently in locked state  
- RENAULT card battery is functional  
- Vehicle is within communication range of card  
- Vehicle electrical system is operational  

**Main Success Scenario:**  
1. Vehicle owner presses unlock button on RENAULT card
2. RENAULT card transmits unlock command to vehicle receiver system
3. Vehicle validates card identity and command authorization
4. Central locking system deactivates all door lock mechanisms simultaneously  
5. Vehicle security system disarms alarm and immobilizer systems
6. Interior lights activate automatically to welcome occupant
7. Hazard warning lights flash once to confirm successful unlocking
8. Vehicle enters accessible state ready for occupant entry

**Postconditions:**  
- All doors and tailgate are unlocked and accessible  
- Vehicle security system is disarmed  
- Interior lighting provides welcoming illumination  
- Hands-free mode is deactivated (requires engine restart to reactivate)  

**Special Note:** After using remote unlock button, hands-free mode is automatically deactivated and requires vehicle restart to reactivate hands-free functionality.

## Use Case 004: Hands-Free Unlocking  

**Use Case ID:** UC-004  
**Use Case Name:** Proximity-Based Vehicle Access via Handle Touch  
**Primary Actor:** Vehicle Owner  
**Secondary Actors:** Proximity Detection System, Door Handle Sensors  
**Stakeholders:** Vehicle Owner (convenience), Disabled Users (accessibility)  

**Trigger Event:** Vehicle owner approaches vehicle with RENAULT card and touches door handle  
**Trigger Type:** Combined proximity and touch detection  

**Preconditions:**  
- RENAULT card is within access zone (zone 1, approximately 1.5 meters)  
- Hands-free mode is active and functional  
- Vehicle is in locked state  
- Door handle touch sensors are operational  

**Main Success Scenario:**  
1. Proximity system detects RENAULT card entering access zone
2. Vehicle prepares unlocking system for activation  
3. Vehicle owner touches door handle (handle 1)
4. Handle sensor confirms intentional access attempt
5. System verifies RENAULT card authorization within proximity
6. Specific door unlocks automatically (typically driver door)
7. Interior lights activate to illuminate cabin
8. Vehicle provides tactile feedback through door handle mechanism

**Postconditions:**  
- Accessed door is unlocked and ready for opening  
- Interior lighting provides visibility for entry  
- Other doors remain locked for security (unless full unlock configured)  
- System ready for additional unlock requests  

**Timing Requirements:**  
- Approximately 3 seconds delay required between successive unlock attempts  
- Handle touch must be detected within 2 seconds of proximity detection  

## Use Case 005: Automatic Re-lock After Unlock

**Use Case ID:** UC-005  
**Use Case Name:** Security Re-lock Following Unused Unlock  
**Primary Actor:** Vehicle Security System  
**Secondary Actors:** Door Monitoring Sensors, Timer Module  
**Stakeholders:** Vehicle Owner (security), Insurance (theft prevention)  

**Trigger Event:** Vehicle unlocked but no doors opened within specified timeout period  
**Trigger Type:** Automatic system timer  

**Preconditions:**  
- Vehicle has been unlocked via remote or hands-free method  
- No door has been opened since unlock command  
- Specified timeout period has elapsed (typically 30-60 seconds)  
- Vehicle remains in parked state  

**Main Success Scenario:**  
1. System monitors door sensors continuously after unlock command
2. Internal timer tracks elapsed time since unlock activation
3. System detects no door opening activity within timeout period
4. Security system determines unlock was accidental or unused
5. Central locking system re-activates all door locks automatically
6. Vehicle security system re-arms alarm and immobilizer
7. System returns to fully secured state

**Postconditions:**  
- Vehicle security restored to locked state  
- Protection against accidental unlock situations  
- Security system armed and monitoring  
- No user intervention required  

**Purpose:** This automatic re-lock feature prevents security vulnerabilities from accidental unlock operations, such as unintended button presses or false proximity detections.

## Use Case 006: Speed-Based Automatic Locking

**Use Case ID:** UC-006  
**Use Case Name:** Automatic Door Locking During Vehicle Operation  
**Primary Actor:** Vehicle Speed Monitoring System  
**Secondary Actors:** Engine Management System, Door Lock Actuators  
**Stakeholders:** Vehicle Occupants (safety), Driver (theft prevention)  

**Trigger Event:** Vehicle speed exceeds approximately 9 mph (15 km/h)  
**Trigger Type:** Automatic speed threshold detection  

**Preconditions:**  
- Engine is running and vehicle is in motion  
- Vehicle doors are currently unlocked  
- Speed monitoring system is operational  
- Central locking system is functional  

**Main Success Scenario:**  
1. Vehicle speed monitoring system continuously tracks current velocity
2. System detects vehicle speed exceeding 9 mph (15 km/h) threshold
3. Speed monitoring validates consistent speed over brief period to avoid false triggers
4. Central locking system receives automatic lock command from speed monitor
5. All door lock actuators engage simultaneously to secure doors
6. Dashboard display may show speed-lock confirmation indicator
7. Doors remain locked throughout driving operation

**Postconditions:**  
- All doors are locked during vehicle operation for occupant safety  
- Protection against unauthorized access during driving  
- Interior manual unlock remains functional for emergency situations  
- Locks remain active until engine shutdown or manual unlock  

**Safety Note:** Interior door handles remain functional at all times to ensure emergency egress capability for occupants.

## Use Case 007: Emergency Manual Unlock

**Use Case ID:** UC-007  
**Use Case Name:** Interior Emergency Door Access Override  
**Primary Actor:** Vehicle Occupant  
**Secondary Actors:** Door Lock Mechanism, Emergency Override System  
**Stakeholders:** Vehicle Occupants (safety), Emergency Services (rescue access)  

**Trigger Event:** Interior door handle operated while doors locked from outside  
**Trigger Type:** Manual emergency override action  

**Preconditions:**  
- Person is inside vehicle  
- Doors are locked from exterior (any locking method)  
- Interior door handle is accessible and functional  
- Mechanical override system is operational  

**Main Success Scenario:**  
1. Vehicle occupant pulls interior door handle
2. Mechanical override system detects interior unlock request
3. Override mechanism bypasses electronic lock control for specific door
4. Door lock disengages immediately for emergency egress
5. Door opens normally allowing occupant exit
6. Other doors remain in locked state for security

**Postconditions:**  
- Emergency exit is available for vehicle occupant  
- Life safety requirements are satisfied  
- Vehicle security maintained for non-accessed doors  

**Safety Critical Requirements:**  
- Must function even during complete electrical system failure  
- Response time must be immediate (under 1 second)  
- Mechanical system must be reliable under all operating conditions  
- Override must work regardless of external locking method used

## Use Case 008: Deadlock Security Mode

**Use Case ID:** UC-008  
**Use Case Name:** Enhanced Security Locking with Interior Disable  
**Primary Actor:** Vehicle Owner  
**Secondary Actors:** Enhanced Security System, Lock Control Module  
**Stakeholders:** Vehicle Owner (theft prevention), Insurance Companies (security)  

**Trigger Event:** Vehicle owner presses lock button twice in succession on RENAULT card  
**Trigger Type:** Deliberate double-button activation  

**Preconditions:**  
- All doors and tailgate are properly closed  
- RENAULT card is functional and within range  
- No occupants remain inside vehicle  
- Enhanced security system is operational  

**Main Success Scenario:**  
1. Vehicle owner presses lock button once (normal lock engages)
2. Vehicle owner presses lock button second time within specified time window
3. System validates double-press command sequence  
4. Enhanced deadlock security mode activates
5. Interior door handles are electronically disabled
6. Additional security sensors activate for enhanced protection
7. Visual confirmation provided via hazard light sequence

**Postconditions:**  
- Vehicle locked with enhanced security protection  
- Interior door handles cannot unlock doors (security against break-in)  
- Enhanced monitoring active for intrusion detection  
- Only external unlock methods can restore access  

**Security Enhancement:** This mode prevents break-in via window followed by interior handle operation, significantly improving theft resistance.

## Use Case 009: Child Safety Lock Configuration

**Use Case ID:** UC-009  
**Use Case Name:** Rear Door Child Safety Protection System  
**Primary Actor:** Parent/Adult Driver  
**Secondary Actors:** Child Safety Lock Mechanism, Rear Door Systems  
**Stakeholders:** Child Passengers (safety), Parents (child protection)  

**Trigger Event:** Adult activates child safety lock lever on rear doors  
**Trigger Type:** Manual safety configuration action  

**Preconditions:**  
- Vehicle is accessible for configuration  
- Rear doors are unlocked for setup access  
- Child safety lock mechanism is functional  
- Adult has knowledge of safety lock operation  

**Main Success Scenario:**  
1. Adult opens rear door to access child safety lock lever
2. Adult moves child safety lock lever to "locked" position  
3. Adult tests door operation from interior to verify lock engagement
4. Adult confirms door cannot be opened from inside  
5. Adult verifies door still opens normally from outside
6. Child safety protection is active and confirmed

**Postconditions:**  
- Rear doors cannot be opened from interior by child passengers  
- Adult access from exterior remains fully functional  
- Child safety protection active until manually disabled  
- Protection prevents accidental door opening during travel  

**Manual Override:** Adult can always open doors from outside, ensuring access for assistance and emergency situations.