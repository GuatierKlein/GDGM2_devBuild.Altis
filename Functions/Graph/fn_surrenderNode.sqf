params["_node","_side"];

private _units = _node getVariable "GDGM_spawnedObjects";
private _tmpArray = [];

{
	private _isGarri = _x getVariable ["GDGM_isGarri", false];
	if(!(_x isKindOf "Man") || !alive _x || side _x != _side || !_isGarri) then {continue};

	_tmpArray pushBackUnique (group _x);
	
} forEach _units;

{
	[_x] spawn GDGM_fnc_surrenderUnits;
} forEach _tmpArray;


