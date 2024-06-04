params["_trigger","_list"];

private _node = _trigger getVariable "GDGM_installation";
private _isPlaneOK = [_list] call GDGM_fnc_isOtherThanPlaneInList; 
private _res = false;
private _side = _node getVariable "GDGM_owner";

if(_side == GDGM_reducedSide && GDGM_reducedSideOnlySpawnAttacks) exitWith {
	_res;
};

if([_node] call GDGM_fnc_isOnFrontline && _isPlaneOK) then {
	if(triggerActivated _trigger) then {
		_res = true;
	} else {
		if( GDGM_nbNodeSpawn < GDGM_maxNodeSpawn) then {
			_res = true;
		} else {
			_res = false;
		};
	};
};

_res;

