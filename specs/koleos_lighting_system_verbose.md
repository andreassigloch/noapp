# Renault Koleos (2017-2024) - Exterior Lighting System Specification (Verbose)

**Vehicle Type:** Mid-size SUV  
**System:** Exterior Lighting and Illumination Control System  
**Documentation Source:** Official Renault Owner's Manual Analysis

## Use Case 010: Manual Headlight Operation

**Use Case ID:** UC-010  
**Use Case Name:** Direct Manual Control of Dipped Beam Headlights  
**Primary Actor:** Driver  
**Secondary Actors:** Lighting Control Module, Dashboard Display System  
**Stakeholders:** Driver (visibility), Other Road Users (safety), Regulatory Authorities (compliance)  

**Trigger Event:** Driver rotates light control ring to dipped beam position  
**Trigger Type:** Manual user control action  

**Preconditions:**  
- Vehicle electrical system is functional and powered  
- Engine is running or ignition is in accessories position  
- Light control ring mechanism is operational  
- Headlight bulbs and electrical circuits are functional  
- Dashboard display system is operational  

**Main Success Scenario:**  
1. Driver identifies need for headlight illumination  
2. Driver locates light control ring on steering column control stalk
3. Driver rotates ring to dipped beam headlight symbol position
4. Light control system receives manual activation command
5. Dipped beam headlights activate providing forward road illumination
6. Dashboard indicator illuminates confirming headlight activation status  
7. Appropriate road illumination is provided for driving conditions

**Postconditions:**  
- Dipped beam headlights are active and providing road illumination  
- Dashboard confirmation indicator is illuminated and visible to driver  
- Vehicle lighting complies with regulatory requirements for current conditions  
- Lighting system is under direct manual driver control  

**Alternative Flows:**  
- **10a. Electrical System Insufficient:** If battery voltage is low, headlights may activate with reduced brightness, system may display low voltage warning, driver should address electrical system issues
- **10b. Bulb Failure:** If one or both headlight bulbs have failed, system activates remaining functional bulbs, dashboard warning indicates bulb failure, driver should replace failed bulbs promptly

**Quality Requirements:**  
- Light activation response time must be immediate (under 0.5 seconds)  
- Headlight beam pattern must meet regulatory specifications for dipped beam  
- Dashboard indicator must be clearly visible in all ambient lighting conditions  
- System must maintain consistent light output throughout operation  

## Use Case 011: Automatic Headlight Operation

**Use Case ID:** UC-011  
**Use Case Name:** Ambient Light Sensor Controlled Automatic Headlight System  
**Primary Actor:** Vehicle Lighting Management System  
**Secondary Actors:** Ambient Light Sensor, Lighting Control Module, Engine Management System  
**Stakeholders:** Driver (convenience), Other Road Users (safety), Traffic Safety Authorities  

**Trigger Event:** Ambient light sensor detects low light conditions requiring headlight activation  
**Trigger Type:** Automatic sensor-based detection system  

**Preconditions:**  
- Light control ring is positioned in AUTO mode  
- Engine is running and vehicle electrical systems are active  
- Ambient light sensor is functional and unobstructed  
- Lighting control module is operational  
- Headlight systems are functional and ready for activation  

**Main Success Scenario:**  
1. Ambient light sensor continuously monitors external light conditions
2. Sensor detects light levels falling below predetermined threshold for safe driving
3. Light sensor data is processed by lighting control module  
4. System determines headlight activation is required based on light conditions
5. Dipped beam headlights activate automatically without driver intervention
6. Dashboard indicators illuminate to confirm automatic headlight activation
7. System continues monitoring and adjusts lighting as conditions change

**Postconditions:**  
- Headlights are active providing appropriate illumination for current conditions  
- Vehicle lighting automatically adapts to changing ambient light conditions  
- Driver is freed from manual lighting management tasks  
- Lighting system operates continuously until conditions change or system is overridden  

**Alternative Flows:**  
- **11a. Sensor Obstruction:** If ambient light sensor is obstructed by dirt, snow, or other material, system may not detect light changes accurately, manual override becomes necessary, cleaning sensor may restore automatic function
- **11b. Gradual Light Changes:** If light conditions change gradually (dawn/dusk), system activates headlights when threshold is reached, preventing premature or delayed activation
- **11c. Tunnel/Bridge Transit:** When entering tunnels or passing under bridges, system quickly responds to sudden light level changes, ensures appropriate lighting for temporary conditions

**Environmental Limitations:**  
- Extreme weather conditions (heavy rain, snow, fog) may affect sensor accuracy  
- Obstruction in front of windshield or camera may impair sensor function  
- Using portable navigation systems in windshield area may interfere with sensor operation  

## Use Case 012: High Beam Manual Operation

**Use Case ID:** UC-012  
**Use Case Name:** Manual High Beam Headlight Activation and Control  
**Primary Actor:** Driver  
**Secondary Actors:** High Beam Control System, Other Vehicle Operators  
**Stakeholders:** Driver (enhanced visibility), Oncoming Traffic (safety from glare)  

**Trigger Event:** Driver pushes light control stalk forward to activate high beams  
**Trigger Type:** Manual driver control action  

**Preconditions:**  
- Dipped beam headlights are currently active and operational  
- Vehicle electrical system is functional with adequate power  
- High beam bulbs and electrical circuits are operational  
- Light control stalk mechanism is functional  

**Main Success Scenario:**  
1. Driver assesses road conditions and determines high beam illumination is needed
2. Driver pushes light control stalk forward away from steering wheel
3. High beam control system receives activation command from stalk position
4. High beam headlights activate providing enhanced forward illumination beyond dipped beam range
5. Blue high beam indicator illuminates on dashboard confirming high beam status
6. Extended road illumination is provided for enhanced visibility of road ahead

**Postconditions:**  
- High beam headlights are active providing maximum forward road illumination  
- Blue dashboard indicator confirms high beam operational status to driver  
- Enhanced visibility is available for high-speed driving on unlit roads  
- Driver maintains responsibility for appropriate high beam usage  

**Return to Dipped Beam:**  
- Driver pulls light control stalk back toward steering wheel  
- High beams deactivate and system returns to dipped beam operation  
- Blue dashboard indicator extinguishes confirming return to dipped beam mode  

**Responsible Usage Requirements:**  
- Driver must deactivate high beams when oncoming traffic is detected  
- High beams should be turned off when following other vehicles closely  
- Usage must comply with local traffic regulations and courtesy requirements  

## Use Case 013: Automatic High Beam Control

**Use Case ID:** UC-013  
**Use Case Name:** Camera-Based Automatic High Beam Management System  
**Primary Actor:** Automatic High Beam Control System  
**Secondary Actors:** Vehicle Detection Camera, Traffic Analysis Module, Other Vehicle Operators  
**Stakeholders:** Driver (convenience), Other Road Users (glare protection), Traffic Safety  

**Trigger Event:** High beam activated with AUTO mode enabled and camera detects traffic conditions  
**Trigger Type:** Automatic traffic detection and beam management  

**Preconditions:**  
- Light control ring is in AUTO position  
- High beam has been manually activated by driver  
- Camera system behind interior rear-view mirror is functional and unobstructed  
- Windshield is clean and clear in camera detection area  
- Vehicle detection algorithms are operational  

**Main Success Scenario:**  
1. Camera system continuously scans road ahead for vehicle lights and traffic
2. System analyzes detected light sources to identify oncoming or following vehicles
3. When no conflicting traffic detected, system maintains high beam illumination automatically  
4. Upon detecting oncoming vehicle lights, system automatically switches to dipped beam
5. System continues monitoring traffic conditions ahead continuously
6. When oncoming traffic clears, system automatically reactivates high beams
7. Process repeats continuously providing optimal illumination without driver intervention

**Postconditions:**  
- Optimal road illumination provided without manual driver management  
- Other road users protected from inappropriate high beam glare  
- Driver maintains enhanced visibility when traffic conditions permit  
- System operates until manually deactivated or AUTO mode disabled  

**System Limitations and Alternative Flows:**  
- **13a. Extreme Weather Conditions:** Heavy rain, snow, or fog may impair camera detection accuracy, system may revert to manual control, driver should monitor and override as necessary
- **13b. Camera Obstruction:** If camera view is blocked by dirt, condensation, or objects, system deactivates automatic function, dashboard warning may appear, manual control becomes necessary
- **13c. Weak Vehicle Lighting:** Vehicles with dim or hidden lights may not be detected reliably, system errs on side of safety by maintaining dipped beams, some manual override may be needed
- **13d. Reflective Road Signs:** High-reflectivity signs may trigger false vehicle detection, system may unnecessarily switch to dipped beam briefly, normal operation resumes after passing sign

**Safety Override:**  
- Driver can manually override automatic system at any time by operating light controls  
- System responsibility message: "Should under no circumstances replace driver attention and responsibility"  

## Use Case 014: Daytime Running Lights (DRL)

**Use Case ID:** UC-014  
**Use Case Name:** Automatic Daytime Running Light Activation System  
**Primary Actor:** Vehicle Engine Management System  
**Secondary Actors:** DRL Control Module, LED Lighting Array  
**Stakeholders:** Driver (visibility to others), Other Road Users (vehicle detection), Traffic Safety Authorities  

**Trigger Event:** Engine started and vehicle prepared for operation  
**Trigger Type:** Automatic engine start detection  

**Preconditions:**  
- Engine is started and running normally  
- DRL system is functional and enabled  
- Light control switch is in AUTO or OFF position (not manual headlight mode)  
- DRL LED arrays are functional and operational  
- Vehicle electrical system is providing adequate power  

**Main Success Scenario:**  
1. Engine management system detects engine start and running status
2. DRL control module receives engine running signal automatically
3. DRL system verifies light switch is not in manual headlight position
4. LED daytime running light arrays activate automatically providing vehicle visibility
5. DRL lights operate at specified brightness for daytime visibility enhancement
6. System maintains DRL operation throughout engine running period
7. DRL lights automatically deactivate when engine is switched off

**Postconditions:**  
- Vehicle is more visible to other road users during daylight hours  
- DRL system operates automatically without driver intervention required  
- Enhanced safety through improved vehicle detectability in traffic  
- Energy-efficient LED technology minimizes electrical system load  

**Automatic Deactivation:**  
- DRL lights turn off automatically when engine is switched off  
- System reactivates automatically on next engine start cycle  
- No manual driver intervention required for normal operation  

**Integration with Other Lighting:**  
- When headlights are manually activated, DRL may dim or deactivate depending on configuration  
- DRL operation is coordinated with other exterior lighting systems  
- System priorities appropriate lighting for current driving conditions  

## Use Case 015: Follow-Me-Home Lighting

**Use Case ID:** UC-015  
**Use Case Name:** Post-Exit Temporary Illumination System  
**Primary Actor:** Driver  
**Secondary Actors:** Lighting Timer System, Battery Management System  
**Stakeholders:** Driver (safety during exit), Property Security (illuminated access)  

**Trigger Event:** Driver pulls light control stalk toward steering wheel with engine turned off  
**Trigger Type:** Manual activation after engine shutdown  

**Preconditions:**  
- Engine is switched off and vehicle is parked  
- Light control ring is in AUTO or OFF position (not manual headlight mode)  
- Vehicle electrical system has adequate battery charge for lighting operation  
- Dipped beam headlight system is functional  
- Lighting timer system is operational  

**Main Success Scenario:**  
1. Driver exits vehicle and identifies need for temporary exterior illumination
2. Driver pulls light control stalk toward steering wheel  
3. Dipped beam headlights activate automatically providing 30 seconds of illumination
4. Dashboard displays "Follow me home for XXX" message showing remaining time
5. Timer counts down remaining illumination time for driver awareness
6. Driver can extend illumination period by pulling stalk up to 4 additional times
7. Maximum total illumination time is limited to approximately 2 minutes
8. Lights automatically shut off after timer expires protecting vehicle battery

**Postconditions:**  
- Temporary illumination provided for safe movement around vehicle  
- Automatic shutoff prevents battery drain from forgotten lights  
- Driver can safely access home, office, or other destination with illumination assistance  
- Vehicle battery is protected by maximum time limitation  

**Extension Capability:**  
- Each additional stalk pull extends timer by approximately 30 seconds  
- Maximum 4 extensions allowed for total ~2 minute operation  
- Display shows updated countdown time after each extension  

**Early Deactivation:**  
- Driver can turn off lights before automatic timeout by turning ring to any position then returning to AUTO  
- Manual deactivation prevents unnecessary battery usage  
- System resets for next use cycle  

## Use Case 016: Rain-Activated Headlights

**Use Case ID:** UC-016  
**Use Case Name:** Windshield Wiper Integrated Automatic Headlight Activation  
**Primary Actor:** Windshield Wiper Control System  
**Secondary Actors:** Lighting Control Module, Rain Detection System  
**Stakeholders:** Driver (automatic response), Other Road Users (improved vehicle visibility)  

**Trigger Event:** Windshield wipers operate continuously for extended period indicating persistent precipitation  
**Trigger Type:** Automatic wiper activity detection  

**Preconditions:**  
- Light control ring is positioned in AUTO mode  
- Windshield wiper system is operational and actively wiping  
- Wiper operation has continued for approximately 20 seconds or several sweep cycles  
- Lighting control module is functional and monitoring wiper activity  
- Headlight system is ready for activation  

**Main Success Scenario:**  
1. Rain detection or manual wiper activation causes continuous windshield wiper operation
2. Lighting control module monitors wiper activity duration and frequency  
3. System determines extended wiper use indicates reduced visibility conditions
4. After approximately 20 seconds of continuous wiper operation, headlight activation triggers automatically
5. Dipped beam headlights activate to improve vehicle visibility to other road users during rain
6. Lighting remains active while wiper activity continues indicating ongoing poor visibility
7. When wiper operation ceases, system maintains lighting briefly then returns to normal AUTO operation

**Postconditions:**  
- Vehicle visibility is enhanced during precipitation and reduced visibility conditions  
- Appropriate lighting activated automatically without driver attention required  
- Compliance with safety practices for driving in adverse weather conditions  
- System returns to normal automatic operation when weather conditions improve  

**Logic Rationale:**  
- Continuous wiper use indicates poor visibility conditions requiring enhanced vehicle lighting  
- Automatic response ensures appropriate safety measures without driver distraction  
- Integration between wiper and lighting systems provides coordinated response to weather conditions  

## Use Case 017: Cornering Light Assistance

**Use Case ID:** UC-017  
**Use Case Name:** Steering Angle Activated Corner Illumination Enhancement  
**Primary Actor:** Vehicle Steering Angle Detection System  
**Secondary Actors:** Cornering Light Control Module, Front Fog Light Arrays  
**Stakeholders:** Driver (enhanced corner visibility), Pedestrians (improved detection)  

**Trigger Event:** Steering wheel turned while headlights active and vehicle conditions met  
**Trigger Type:** Automatic steering angle and speed detection  

**Preconditions:**  
- Dipped beam headlights are currently active and operational  
- Vehicle speed is below approximately 25 mph (40 km/h)  
- Vehicle is in forward gear and moving  
- Steering angle sensors are functional and detecting wheel position  
- Front fog lights designated for cornering function are operational  

**Main Success Scenario:**  
1. Driver approaches corner or turn requiring enhanced illumination of turn direction
2. Steering angle detection system monitors wheel position continuously  
3. System detects steering wheel turned beyond threshold angle indicating turn intention
4. Speed monitoring confirms vehicle is below cornering light activation threshold  
5. Appropriate cornering fog light (left or right) activates automatically based on turn direction
6. Enhanced illumination is projected into the corner area for improved visibility of turn path
7. When steering returns to straight ahead position, cornering light deactivates automatically

**Postconditions:**  
- Enhanced corner visibility provided during turning maneuvers  
- Improved detection of pedestrians, obstacles, or hazards in turn path  
- Automatic activation and deactivation requires no driver intervention  
- Normal headlight operation continues with cornering enhancement  

**Special Operating Conditions:**  
- **Reverse Gear Operation:** When reverse gear is engaged with dipped beam headlights on, both front fog lights illuminate automatically to enhance backing visibility
- **Speed Limitation:** System only operates below ~25 mph to focus on parking lot, driveway, and slow-speed maneuvering situations
- **Forward Gear Requirement:** Cornering lights require forward gear engagement under normal operation  

## Use Case 018: Fog Light Manual Operation

**Use Case ID:** UC-018  
**Use Case Name:** Driver-Controlled Fog Light Activation System  
**Primary Actor:** Driver  
**Secondary Actors:** Fog Light Control System, Exterior Lighting Coordination Module  
**Stakeholders:** Driver (enhanced visibility), Other Road Users (vehicle detection in fog)  

**Trigger Event:** Driver turns center ring on light control stalk to fog light position  
**Trigger Type:** Manual driver control action  

**Preconditions:**  
- Exterior lights are already active (side lights, dipped beams, or automatic lighting)  
- Fog light control ring on stalk is accessible and functional  
- Front and/or rear fog light bulbs and circuits are operational  
- Fog light switch mechanism is responding to driver input  

**Main Success Scenario:**  
1. Driver encounters fog, heavy rain, snow, or other visibility-reducing conditions
2. Driver locates fog light control ring on center of light control stalk
3. Driver turns center ring until fog light symbol aligns with position mark
4. Fog light control system receives activation command from ring position
5. Front and/or rear fog lights activate depending on ring position selected
6. Dashboard indicator lights illuminate confirming fog light activation status
7. Enhanced visibility provided for driving in adverse weather conditions

**Postconditions:**  
- Fog lights are active providing enhanced illumination for poor visibility conditions  
- Dashboard indicators confirm fog light operational status to driver  
- Vehicle visibility to other road users is improved in adverse conditions  
- Driver maintains control over fog light operation based on conditions  

**Deactivation Process:**  
- Driver turns center ring again until mark aligns with off position for desired fog lights  
- Corresponding dashboard indicator lights extinguish confirming deactivation  
- Fog lights automatically shut off when exterior lights are turned off  

**Usage Responsibility:**  
- Driver should deactivate fog lights when visibility conditions improve  
- Inappropriate fog light use may inconvenience or disturb other road users  
- Local traffic regulations may govern appropriate fog light usage  

## Use Case 019: Side/Parking Light Operation

**Use Case ID:** UC-019  
**Use Case Name:** Manual Side Light and Parking Light Control System  
**Primary Actor:** Driver  
**Secondary Actors:** Side Light Control Module, Position Light Arrays  
**Stakeholders:** Driver (vehicle positioning), Other Road Users (vehicle detection), Traffic Authorities (regulatory compliance)  

**Trigger Event:** Driver rotates light control ring to side light/parking light position  
**Trigger Type:** Manual driver lighting selection  

**Preconditions:**  
- Vehicle electrical system is functional and providing power  
- Light control ring mechanism is operational  
- Side light/parking light bulbs and electrical circuits are functional  
- Dashboard indicator system is operational for status display  

**Main Success Scenario:**  
1. Driver determines parking lights or side lights are needed for current situation
2. Driver rotates light control ring to side light symbol position  
3. Light control system receives side light activation command
4. Side lights and parking position lights activate around vehicle perimeter
5. Dashboard indicator illuminates confirming side light activation status
6. Vehicle position and width are made visible to other road users

**Postconditions:**  
- Side lights are active making vehicle visible without full headlight operation  
- Vehicle position and approximate size are indicated to other traffic  
- Dashboard confirmation shows driver the current lighting status  
- Appropriate lighting provided for parking or low-speed maneuvering situations  

**Battery Drain Warning:**  
- Manual side light activation requires driver attention to prevent battery drain  
- Lights should be manually switched off when parking or leaving vehicle  
- Extended operation with engine off may discharge vehicle battery  
- Warning beep may sound when driver door is opened with lights still active  

## Use Case 020: Light Failure Detection and Warning

**Use Case ID:** UC-020  
**Use Case Name:** Automatic Lighting System Health Monitoring and Alert System  
**Primary Actor:** Lighting System Monitoring Module  
**Secondary Actors:** Individual Light Circuits, Dashboard Warning System, Driver  
**Stakeholders:** Driver (system awareness), Other Road Users (vehicle visibility), Safety Authorities (regulatory compliance)  

**Trigger Event:** Bulb failure, electrical fault, or lighting system malfunction detected  
**Trigger Type:** Automatic continuous system health monitoring  

**Preconditions:**  
- Lighting system monitoring circuits are functional and active  
- Dashboard warning display system is operational  
- Various exterior lighting circuits are monitored for proper operation  
- Detection algorithms are functioning to identify failure conditions  

**Main Success Scenario:**  
1. Lighting monitoring system continuously checks all monitored light circuits for proper operation
2. System detects abnormal current draw, open circuit, or other failure condition indicating bulb or circuit failure
3. Monitoring module identifies specific failed lighting circuit and type of failure
4. "Check lighting" warning message appears on instrument panel display
5. Warning light symbol flashes on dashboard to attract driver attention to lighting fault  
6. Driver becomes aware of lighting system fault requiring attention
7. System continues monitoring and maintains warning until fault is corrected

**Postconditions:**  
- Driver is alerted to lighting system fault requiring service attention  
- Continued warning ensures driver awareness until repair is completed  
- Vehicle safety is maintained through early fault detection and notification  
- Service requirements are identified before complete lighting system failure  

**Service Action Required:**  
- Driver should have faulty bulbs or circuits inspected and repaired by qualified service personnel  
- Warning will persist until actual fault condition is corrected  
- Some lighting functions may be impaired until service is completed  

**Critical Safety Note:**  
- Lighting faults represent immediate safety concerns affecting vehicle visibility  
- Prompt attention to lighting warnings is essential for road safety  
- Continued driving with lighting faults may violate traffic safety regulations