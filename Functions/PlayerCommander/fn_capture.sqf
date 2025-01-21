params["_clientId", "_side", "_veh"];

private _posUnit = getPosASL _veh;
private _closestNode = [_posUnit] call GDGM_fnc_findClosestNode;
private _commander = [_side] call GDGM_fnc_getCommander;
private _fobCloseToArrive = [_posUnit, 250] call GDGM_fnc_isFOBWithinDist;

if((_closestNode getVariable 'GDGM_owner' != _side || _posUnit distance2D _closestNode > 250) && _posUnit distance2D _commander > 250 && !_fobCloseToArrive) exitWith {
	"No nodes nor commander within 250m of your position" remoteExec ["hint", _clientId];
};

private _objSide = _veh getVariable "GDGM_owner";
private _trucksPool = []; 
private _APCPool = []; 
private _tankPool = []; 
private _planePool = [];

switch (_objSide) do {
	case west: { 
		_trucksPool = GDGM_BLUFOR_ammoTrucks + GDGM_BLUFOR_transports + GDGM_BLUFOR_lightArmedVeh; 
		_APCPool = GDGM_BLUFOR_heavyArmedVeh;
		_tankPool = GDGM_BLUFOR_tanks;
		_planePool = GDGM_BLUFOR_FighterPlanes + GDGM_BLUFOR_CASPlanes;
	};
	case east: { 
		_trucksPool = GDGM_OPFOR_ammoTrucks + GDGM_OPFOR_transports + GDGM_OPFOR_lightArmedVeh; 
		_APCPool = GDGM_OPFOR_heavyArmedVeh;
		_tankPool = GDGM_OPFOR_tanks;
		_planePool = GDGM_OPFOR_FighterPlanes + GDGM_OPFOR_CASPlanes;
	};
	case independent: { 
		_trucksPool = GDGM_IND_ammoTrucks + GDGM_IND_transports + GDGM_IND_lightArmedVeh; 
		_APCPool = GDGM_IND_heavyArmedVeh;
		_tankPool = GDGM_IND_tanks;
		_planePool = GDGM_IND_FighterPlanes + GDGM_IND_CASPlanes;
	};
	default { };
};

private _type = typeOf _veh;

if(_type in _trucksPool) then {
	//truck
	[_side, [1,0,0,0,0]] call GDGM_fnc_addVehReserves;
} else {
	if(_type in _APCPool) then {
		//apc
		[_side, [0,1,0,0,0]] call GDGM_fnc_addVehReserves;
	} else {
		if(_type in _tankPool) then {
			//tank
			[_side, [0,0,1,0,0]] call GDGM_fnc_addVehReserves;
		} else {
			//plane
			[_side, [0,0,0,0,1]] call GDGM_fnc_addVehReserves;
		};
	};
};

deleteVehicle _veh;
private _vehName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
["GDGM_vehGarage",[_vehName]] remoteExec ["BIS_fnc_showNotification", _clientId];

