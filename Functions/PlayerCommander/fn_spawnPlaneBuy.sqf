systemChat "Spawning plane!";

private _index = lbCurSel 160412;
private _veh = lbData [160412,_index];
private _trucksPool = [];
private _APCPool = [];
private _tankPool = [];
private _okBuy = false;

//check reserves 
GDGM_clientReserveCHeli = -1000;

[clientOwner, str (side player)] remoteExecCall ["GDGM_fnc_sendReservesAll",2]; 

waitUntil { 
	GDGM_clientReserveCHeli != -1000;
};

private _vehName = getText (configFile >> "CfgVehicles" >> _veh >> "displayName");
if(GDGM_clientReserveCHeli <= 0) exitWith {
	hint ("Not enough " + _vehName + " in reserve");
};

["GDGM_vehSpawned", [_vehName]] call BIS_fnc_showNotification;
[str (side player), [0,0,0,0,-1]] remoteExec["GDGM_fnc_addVehReservesString",2];

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


