params["_veh","_cost",["_type","none"],["_reserve",false], ["_isDivion", false], ["_divisionName", ""]];

//store side
_veh setVariable ["GDGM_owner", side _veh];
_veh setVariable ["GDGM_cost", _cost];
_veh setVariable ["GDGM_reserve", _reserve];
_veh setVariable ["GDGM_type", _type];

//EH
_veh addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if(!isServer) exitWith {};

	private _side = _unit getVariable "GDGM_owner";
	private _cost = _unit getVariable "GDGM_cost";

	[_side, -_cost] call GDGM_fnc_addPoints;
	_unit setVariable ["GDGM_reserve", false];

	if(vehicle _unit isKindOf "tank" && ((vehicle _killer) isKindOf "Helicopter" || (vehicle _killer) isKindOf "plane")) then {
		[_unit getVariable "GDGM_owner" , 0.5 * GDGM_threatLevelCoef] call GDGM_fnc_addThreatLevel;
	};
}];	

if(_isDivion) then {
	_veh setVariable ["GDGM_divisionName", _divisionName];
};

//add action to capture 
if(side _veh != GDGM_playerSide) then {
	[
		_veh,											// Object the action is attached to
		"Capture and put to garage",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 5",						// Condition for the action to be shown
		"_caller distance _target < 5",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ [clientOwner, side player, _target] remoteExec["GDGM_fnc_vehToGarage",2] },				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		5,													// Action duration in seconds
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _veh];	// MP compatible implementation
};

