params["_obj"];

_obj setVariable ["GDGM_speType", "camp", true];

private _pos = getPosASL _obj;
private _markerName = "camp" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "Camp";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_dot";

[_obj,
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
		10,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
]] remoteExec ["addAction",0,true];