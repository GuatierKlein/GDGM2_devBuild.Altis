private _side = [west,east,independent];

{
	private _unit = [_x] call GDGM_fnc_getCommander;

	if(isNull _unit) then {continue};
	//select attack
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Attack menu",	
		{				
			[] spawn GDGM_fnc_openSelectAttack;
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"", 	// condition
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	]] remoteExec ["addAction",0,true];

	//select attack
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Change commander style",	
		{				
			[] spawn GDGM_fnc_openSelectCommander;
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"", 	// condition
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	]] remoteExec ["addAction",0,true];
	if(GDGM_enableIntel) then {
		[_unit,
			["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Start recon mission",	
				{					
					[] spawn GDGM_fnc_reconPartyClient;
				},
				nil,		// arguments
				6,		// priority
				true,		// showWindow
				true,		// hideOnUse
				"",			// shortcut
				"", 	// condition
				3,			// radius
				false,		// unconscious
				"",			// selection
				""			// memoryPoint
		]] remoteExec ["addAction",0,true];
	};

	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn HC squad",	
			{					
				["squad"] spawn GDGM_fnc_HCSpawnClient;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn HC motorized squad",	
			{					
				["motSquad"] spawn GDGM_fnc_HCSpawnClient;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn HC light vehicle",	
			{					
				["lightVeh"] spawn GDGM_fnc_HCSpawnClient;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn HC APC",	
			{					
				["apc"] spawn GDGM_fnc_HCSpawnClient;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn HC tank",	
			{					
				["tank"] spawn GDGM_fnc_HCSpawnClient;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
	[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Change time of day",	
			{					
				[] spawn GDGM_fnc_openTimeMenu;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
		[_unit,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> DEBUG MENU (do not use)",	
			{					
				createDialog "adminMenu";
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
} forEach _side;

//veh officer
if(!isNil "GDGM_vehOfficer") then {
	[GDGM_vehOfficer,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn vehicle",	
			{					
				[] spawn GDGM_fnc_openVehBuy;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];

	private _pos = getPosASL GDGM_vehOfficer;
	private _markerName = "vehoff_" + str _pos;

	createMarker [_markerName, _pos];
	_markerName setMarkerText "Vehicle officer";
	_markerName setMarkerType "mil_flag";
};

//veh officer
if(!isNil "GDGM_planeOfficer") then {
	[GDGM_planeOfficer,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn planes",	
			{					
				[] spawn GDGM_fnc_openPlaneBuy;
			},
			nil,		// arguments
			6,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];

	private _pos = getPosASL GDGM_planeOfficer;
	private _markerName = "planeoff_" + str _pos;

	createMarker [_markerName, _pos];
	_markerName setMarkerText "Plane officer";
	_markerName setMarkerType "mil_flag";
};

[] call GDGM_fnc_initSupplyOfficer; 