params["_clientId", "_veh"];

if(_veh getVariable ["GDGM_captured", false]) exitWith {
	"Vehicle already captured" remoteExec ["hint", _clientId];
};

_veh setVariable ["GDGM_captured", true];
_veh setVariable ["GDGM_reserve", false];
private _type = typeOf _veh;

[
	_veh,											// Object the action is attached to
	"Garage vehicle",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 5",						// Condition for the action to be shown
	"_caller distance _target < 5",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ [clientOwner, side player, _target] remoteExec["GDGM_fnc_captureToGarage",2] },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration in seconds
	0,													// Priority
	false,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _veh];	// MP compatible implementation

private _vehName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
["GDGM_vehCaptured",[_vehName]] remoteExec ["BIS_fnc_showNotification", _clientId];