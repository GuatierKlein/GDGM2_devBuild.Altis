{
	private _spawnPos = getpos _x;
	private _closestNode = [_spawnPos] call GDGM_fnc_findClosestNode;
	private _owner = _closestNode getVariable "GDGM_owner";
	[_spawnPos, _owner] call GDGM_fnc_spawnCustomAA;
} forEach GDGM_customAAPositions;