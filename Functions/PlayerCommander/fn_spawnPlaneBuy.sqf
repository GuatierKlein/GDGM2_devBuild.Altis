systemChat "Spawning plane!";

private _index = lbCurSel 160412;
private _veh = lbData [160412,_index];

//check reserves 
//check reserves 
private _data = [missionNamespace, "GDGM_logiData", []] call BIS_fnc_getServerVariable;

// Vérifie qu'on a bien reçu les données
if (_data isEqualTo [] || count _data < 12) exitWith {
    hint "Erreur : données logistiques manquantes ou incomplètes.";
};

_data params [
    "_OPFOR_supplies",
    "_IND_supplies",
    "_BLUFOR_supplies",
    "_OPFOR_reserves",
    "_IND_reserves",
    "_BLUFOR_reserves",
    "_player_supplies",
    "_player_reserves",
    "_OPFOR_vehReserves",
    "_IND_vehReserves",
    "_BLUFOR_vehReserves",
    "_player_vehReserves"
];

private _vehName = getText (configFile >> "CfgVehicles" >> _veh >> "displayName");
private _planePool = 0;

switch (side player) do {
	case west: {
		_planePool = (_BLUFOR_vehReserves select 4) + (_player_vehReserves select 4);
	};
	case east: {
		_planePool = (_OPFOR_vehReserves select 4) + (_player_vehReserves select 4);
	};
	case independent: {
		_planePool = (_IND_vehReserves select 4) + (_player_vehReserves select 4);
	};
	default {};
};

if(_planePool <= 0) exitWith {
	hint ("Not enough " + _vehName + " in reserve");
};

["GDGM_vehSpawned", [_vehName]] call BIS_fnc_showNotification;
["player", [0,0,0,0,-1]] remoteExec["GDGM_fnc_addVehReserves",2];

_vehicle = _veh createVehicle getMarkerPos "GDGM_planeMarkerPos"; 
_vehicle setDir (markerDir "GDGM_planeMarkerPos");

[
	_vehicle,											// Object the action is attached to
	"Put to garage",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 5 && !(isEngineOn _target)",						// Condition for the action to be shown
	"_caller distance _target < 5",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ [clientOwner, side player, _target] remoteExec["GDGM_fnc_vehToGarage",2] },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration in seconds
	0,													// Priority
	true,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _vehicle];	// MP compatible implementation


