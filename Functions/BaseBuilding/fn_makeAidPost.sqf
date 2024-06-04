params["_obj"];

_obj setVariable ["GDGM_speType", "aid", true];

private _pos = getPosASL _obj;
private _markerName = "aid" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "Aid post";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_dot";

[_obj,
	["<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Heal units around",	
		{			
			params ["_target", "_caller", "_actionId", "_arguments"];		
			[getPos _target] remoteExec ["GDGM_fnc_aidPostHeal",2];
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