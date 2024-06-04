params["_trigger","_list"];

private _node = _trigger getVariable "GDGM_installation";
private _res = GDGM_nbNodeSpawn <= GDGM_civilianAlreadySpawnedNodeMax && [_list] call GDGM_fnc_isOtherThanPlaneInList;

if([_node] call GDGM_fnc_isOnFrontline && _res) then {
	_res = false;
};

_res;

