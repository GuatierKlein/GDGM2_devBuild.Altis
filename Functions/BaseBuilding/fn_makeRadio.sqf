params["_obj"];

_obj setVariable ["GDGM_speType", "radio", true];

private _pos = getPosASL _obj;
private _markerName = "radio" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "Radio";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_dot";

[_obj,
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
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];
[_obj,
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
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];
[_obj,
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
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];
[_obj,
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
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];
[_obj,
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
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];
[_obj,
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
[_obj,
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
	[_obj,
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
			6,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",0,true];
};