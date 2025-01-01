params["_node","_owner",["_forced", false]];

/*
test 
[[position player] call GDGM_fnc_findClosestNode, independent] spawn GDGM_fnc_changeOwner;
*/

private _previousOwner = _node getVariable "GDGM_owner";
private _name = _node getVariable "GDGM_name";
["GDGM_townCaptured", [_name, [_previousOwner] call GDGM_fnc_getFactionName, [_owner] call GDGM_fnc_getFactionName]] remoteExec["BIS_fnc_showNotification", 0];

_node setVariable ["GDGM_owner",_owner];
_node setVariable ["GDGM_garrison",10];
//TODO notifications

//update map
[] spawn GDGM_fnc_updateGraph;
[] spawn GDGM_fnc_updateGrid;

if(!_forced) then {
	[_node] spawn GDGM_fnc_contestNode;
	[_previousOwner, -5] call GDGM_fnc_addMoraleOffset;
	[_owner, 5] call GDGM_fnc_addMoraleOffset;
};
