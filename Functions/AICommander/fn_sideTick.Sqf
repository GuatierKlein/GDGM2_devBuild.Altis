params["_side"];
//operates 1 tick on the given side 
//3 commander personnalities, cautious, aggressive and defensive (never attacks)

//go through aggressive -> defensive if no match for attack (in case of aggressive)
//go through defensive -> aggressive if no match for attack (in case of cautious)

private _supplies = [_side] call GDGM_fnc_getPoints;
private _style =  [_side] call GDGM_fnc_getCommanderStyle;
private _friendlyFrontlineNodes = [_side] call GDGM_fnc_getSidedFrontlineNodes;
private _ennemyFrontlineNodes = _friendlyFrontlineNodes select 1;
_friendlyFrontlineNodes = _friendlyFrontlineNodes select 0;

//TODO earn points

//defensive
if(_style == "defensive") then {
	[_side, 1] spawn GDGM_fnc_tickDefensive;
};

//aggressive 
if(_style == "aggressive") then {
	[_side, _friendlyFrontlineNodes, _ennemyFrontlineNodes, _supplies] spawn GDGM_fnc_tickAggressive;
};

//cautious
if(_style == "cautious") then {
	[_side, _friendlyFrontlineNodes, _ennemyFrontlineNodes, _supplies] spawn GDGM_fnc_tickCautious;
};

