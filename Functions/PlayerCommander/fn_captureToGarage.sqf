params["_clientId", "_side", "_veh"];

private _posUnit = getPosASL _veh;
private _closestNode = [_posUnit] call GDGM_fnc_findClosestNode;
private _commander = [_side] call GDGM_fnc_getCommander;
private _fobCloseToArrive = [_posUnit, 250] call GDGM_fnc_isFOBWithinDist;

if((_closestNode getVariable 'GDGM_owner' != _side || _posUnit distance2D _closestNode > 250) && _posUnit distance2D _commander > 250 && !_fobCloseToArrive) exitWith {
	"No nodes nor commander within 250m of your position" remoteExec ["hint", _clientId];
};

private _objType = _veh getVariable "GDGM_type";
private _type = typeOf _veh;

switch (_objType) do {
	case "truck": { [_side, [1,0,0,0,0]] call GDGM_fnc_addVehReserves; };
	case "apc": { [_side, [0,1,0,0,0]] call GDGM_fnc_addVehReserves; };
	case "tank": { [_side, [0,0,1,0,0]] call GDGM_fnc_addVehReserves; };
	default { };
};

deleteVehicle _veh;
private _vehName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
["GDGM_vehGarage",[_vehName]] remoteExec ["BIS_fnc_showNotification", _clientId];