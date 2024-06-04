params["_pos", "_sideString"];

private _side = east; 

if(_sideString == "WEST") then {
	_side = west; 
};
if(_sideString == "IND") then {
	_side = independent; 
};

private _node = [_pos] call GDGM_fnc_findClosestNode;
[_node, _side, true] spawn GDGM_fnc_changeOwner;