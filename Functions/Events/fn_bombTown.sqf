params["_node", "_side", "_nbBombers"];

//some random bombs 
//some on building

private _nbRandomBombs = ceil(_nbBombers/2);
private _nbBuildingBombs = _nbBombers - _nbRandomBombs;
private _posToBomb = [];
private _pos = _node getVariable "GDGM_position";

//random bombs
for [{private _i = 0}, {_i < _nbRandomBombs}, {_i = _i + 1}] do {
	_posToBomb pushBack (_pos getPos [GDGM_nodeContestArea, floor(random 360)]);
};

//building bombs
private _houses = [_pos, GDGM_nodeContestArea] call GDGM_fnc_getOpenedHouses;
private _maxIter = count _houses;
for [{private _i = 0}, {_i < _nbBuildingBombs && _i < _maxIter}, {_i = _i + 1}] do {
	_posToBomb pushBack (getPos (_houses select _i));
};

//launch bombing 
{
	[_x, _side] spawn GDGM_fnc_airStrike;
	sleep (floor (random 20) + 2);
} forEach _posToBomb;