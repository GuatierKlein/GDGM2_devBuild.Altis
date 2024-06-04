params["_grp"];

sleep 10;

private _units = units _grp;
private _offset = [side _grp] call GDGM_fnc_getMoraleOffset;

_grp setVariable ["GDGM_morale", 100 + _offset];
_grp setVariable ["GDGM_initalCount", count _units];
_grp setVariable ["GDGM_isLeaderKilled", false];
_grp setVariable ["GDGM_isFleeing", false];

{
	_x addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		private _group = group _unit;
		[_group, _unit] call GDGM_fnc_moraleDeath;

	}];

	_x addEventHandler ["Reloaded", {
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];

		if(! someAmmo _unit) then {
			[group _unit, -10] call GDGM_fnc_addMorale;
		};
	}];
	
} forEach _units;

//compat with vanilla fleeing
_grp addEventHandler ["Fleeing", {
	params ["_group", "_fleeingNow"];

	{
		_x enableAI "PATH";
		_x setUnitPos "AUTO";		
	} forEach units _group;

	[_group, -10] call GDGM_fnc_addMorale;
}];

//encirclred
private _closestNode = [getPos (leader _grp), side leader _grp] call GDGM_fnc_findClosestSidedNode;
if(_closestNode getVariable "GDGM_isEncircled") then  {
	_grp setVariable ["GDGM_morale", 80];
};

//debug
// private _marker_object = createMarker [str _grp, getPos(leader _grp)];
// _marker_object setMarkerTypeLocal "mil_triangle";	
// _marker_object setMarkerTextLocal "morale : 100";
// _marker_object setMarkerColor "colorblue";



// while {count units _grp != 0} do {	
// 	private _morale = _grp getVariable "GDGM_morale";
// 	_marker_object setMarkerTextLocal ((str _grp) + " " + (str _morale));
// 	_marker_object setMarkerPos(getPos(leader _grp));
// 	sleep 10;
// };

// deleteMarker (str _grp);

