params["_obj"];

_obj setVariable ["GDGM_speType", "veh", true];

private _pos = getPosASL _obj;
private _markerName = "vehdepot" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "Vehicle depot";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_dot";

[_obj,
	["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn vehicles",	
		{					
			[true] spawn GDGM_fnc_openVehBuy;
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"", 	// condition
		10,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];

