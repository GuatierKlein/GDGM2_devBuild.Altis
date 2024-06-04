if!(GDGM_enablePlaneMode) exitWith {};

//plane raid vars
GDGM_planeRaid_nb = 0;
GDGM_planeRaid_OPFOR_threatLevel = 0;
GDGM_planeRaid_BLUFOR_threatLevel = 0;
GDGM_planeRaid_IND_threatLevel = 0;
GDGM_planeRaid_OPFOR_spawnedPlanes = 0;
GDGM_planeRaid_BLUFOR_spawnedPlanes = 0;
GDGM_planeRaid_IND_spawnedPlanes = 0;

//heli raid vars
GDGM_heliRaid_nb = 0;

//trigger plane (and helo)
GDGM_planeTrigger = createTrigger ["EmptyDetector", [0,0,0], false];	
GDGM_planeTrigger setTriggerArea [0, 0, 0, false];	
GDGM_planeTrigger setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
GDGM_planeTrigger setTriggerTimeout [5,5,5,false];
GDGM_planeTrigger setTriggerStatements ["call GDGM_fnc_isPlayerInPlane || GDGM_fnc_isPlayerInHeli", "
	if (isServer) then {[] spawn GDGM_fnc_enablePlaneMode};
", "
	if (isServer) then {[] spawn GDGM_fnc_disablePlaneMode};
"];
GDGM_planeTrigger setTriggerInterval 20;

//trigger heli
GDGM_heliTrigger = createTrigger ["EmptyDetector", [0,0,0], false];	
GDGM_heliTrigger setTriggerArea [0, 0, 0, false];	
GDGM_heliTrigger setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
GDGM_heliTrigger setTriggerTimeout [5,5,5,false];
GDGM_heliTrigger setTriggerStatements ["call GDGM_fnc_isPlayerInHeli", "
	if (isServer) then {[] spawn GDGM_fnc_enableHeliMode};
", "
	if (isServer) then {[] spawn GDGM_fnc_disableHeliMode};
"];
GDGM_heliTrigger setTriggerInterval 20;
