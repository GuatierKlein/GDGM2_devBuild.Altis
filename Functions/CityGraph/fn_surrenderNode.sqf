params["_node","_side"];

private _units = _node getVariable "GDGM_spawnedObjects";
private _tmpArray = [];

{
	private _isGarri = _x getVariable ["GDGM_isGarri", false];
	if(!(_x isKindOf "Man") || !alive _x || side _x != _side || !_isGarri) then {continue};

	_tmpArray pushBack _x;
	
} forEach _units;

[_tmpArray] spawn GDGM_fnc_surrenderUnits;