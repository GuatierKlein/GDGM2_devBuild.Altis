//supply officer
if(!isNil "GDGM_supplyOfficer") then {
	[GDGM_supplyOfficer,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn logistics crate (100 supplies)",	
			{					
				[GDGM_supplyOfficer, "big"] remoteExec["GDGM_fnc_spawnLogiCrate", 2];
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

	private _pos = getPosASL GDGM_supplyOfficer;
	private _markerName = "supplyoff_" + str _pos;

	createMarker [_markerName, _pos];
	_markerName setMarkerText "Supply officer";
	_markerName setMarkerType "mil_flag";
};


if (isClass(configFile >> "CfgPatches" >> "ace_main")) then 
{ 
	[GDGM_supplyOfficer,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn medical crate",	
			{					
				["medical", player] remoteExec["GDGM_fnc_spawnSupplyCrate", 2];
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

//custom crates 
private _keys = keys GDGM_supplyCrateModels;

{
	[GDGM_supplyOfficer,
		["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn " + _x + " crate",	
			{					
				[_this select 3 select 0, player] remoteExec["GDGM_fnc_spawnSupplyCrate", 2];
			},
			[_x],		// arguments
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
} forEach _keys;