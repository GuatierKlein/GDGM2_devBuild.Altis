params["_clientId", "_side", "_veh"];

private _posUnit = getPosASL _veh;
private _closestNode = [_posUnit] call GDGM_fnc_findClosestNode;
private _commander = [_side] call GDGM_fnc_getCommander;
private _fobCloseToArrive = [_posUnit, 250] call GDGM_fnc_isFOBWithinDist;

if((_closestNode getVariable 'GDGM_owner' != _side || _posUnit distance2D _closestNode > 250) && _posUnit distance2D _commander > 250 && !_fobCloseToArrive) exitWith {
	"No nodes nor commander within 250m of your position" remoteExec ["hint", _clientId];
};

private _trucksPool = GDGM_PLAYERS_transports + GDGM_PLAYERS_lightArmedVeh; 
private _APCPool = GDGM_PLAYERS_heavyArmedVeh; 
private _tankPool = GDGM_PLAYERS_tanks; 
private _planePool = GDGM_PLAYERS_FighterPlanes + GDGM_PLAYERS_CASPlanes;
private _objSide = _side;
private _type = typeOf _veh;

if(_type in _trucksPool) then {
	//truck
	["player", [1,0,0,0,0]] call GDGM_fnc_addVehReserves;
} else {
	if(_type in _APCPool) then {
		//apc
		["player", [0,1,0,0,0]] call GDGM_fnc_addVehReserves;
	} else {
		if(_type in _tankPool) then {
			//tank
			["player", [0,0,1,0,0]] call GDGM_fnc_addVehReserves;
		} else {
			//plane
			["player", [0,0,0,0,1]] call GDGM_fnc_addVehReserves;
		};
	};
};

deleteVehicle _veh;
private _vehName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
["GDGM_vehGarage",[_vehName]] remoteExec ["BIS_fnc_showNotification", _clientId];

