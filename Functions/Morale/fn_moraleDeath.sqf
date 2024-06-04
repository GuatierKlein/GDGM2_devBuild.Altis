params["_grp", "_unit"];

private _initalCount = _grp getVariable "GDGM_initalCount";
private _loss = floor((1 / _initalCount) * 100);

if(_loss < 10) then {_loss = 10};

[_grp, -_loss] call GDGM_fnc_addMorale;
[_grp] call GDGM_fnc_moraleCheck;

//group leader
if!(_grp getVariable "GDGM_isLeaderKilled") then {
	if(_unit == leader _grp) then {
		[_grp, -15] call GDGM_fnc_addMorale;
		_grp setVariable ["GDGM_isLeaderKilled", true];
	};
};