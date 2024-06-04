params["_grp"];

private _morale = _grp getVariable "GDGM_morale";
if(isNil "_morale") exitWith {};
private _cowardice = [side _grp] call GDGM_fnc_getCowardice;

if(_morale <= (_cowardice * 100) && random 100 < (100 - _morale)) then {
	if(_grp getVariable "GDGM_isFleeing") exitWith {};

	private _leader = leader _grp;
	private _nearestEnnemy = _leader findNearestEnemy _leader;

	if(!isNull _nearestEnnemy) then {
		if(_leader distance _nearestEnnemy < GDGM_surrenderDistance && random 1 < GDGM_surrenderProbability) then {
			[units _grp] spawn GDGM_fnc_surrenderUnits;
		} else {
			[_grp] spawn GDGM_fnc_moraleFlee;
		};
	} else {
		[_grp] spawn GDGM_fnc_moraleFlee;
	};
};