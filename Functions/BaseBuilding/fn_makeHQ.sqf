params["_obj"];

_obj setVariable ["GDGM_speType", "ammo", true];

private _pos = getPosASL _obj;
private _markerName = "ammo" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "Ammo box";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_dot";

clearItemCargoGlobal _obj;
clearWeaponCargoGlobal _obj;
clearMagazineCargoGlobal _obj;

[[_obj], "Scripts\kit_select\kitSelectAction.sqf"] remoteExec ["execVM",0];

if (isClass(configFile >> "CfgPatches" >> "ace_main")) then 
{ 
	[_obj,
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
	[_obj,
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