params["_side","_minRatio"];

private _ratio = 0;
private _toRegarri = [];
private _reserves = [_side] call GDGM_fnc_getReserves;

//find all under min ratio
{
	_ratio = (_x getVariable "GDGM_garrison") / (_x getVariable "GDGM_targetGarrison");
	if(!(_x getVariable "GDGM_underAttack") && !(_x getVariable "GDGM_isContested") && _ratio < _minRatio && _reserves > ((_x getVariable "GDGM_targetGarrison") - (_x getVariable "GDGM_garrison"))) then {
		_toRegarri pushBack _x;
	};	
} forEach ([_side] call GDGM_fnc_getSideNodes);

//sort the array
private _toRegarriSorted = [_toRegarri, [], {(_x getVariable "GDGM_garrison") / (_x getVariable "GDGM_targetGarrison")}] call BIS_fnc_sortBy;


//regarri
{
	private _cost = (_x getVariable "GDGM_targetGarrison") - (_x getVariable "GDGM_garrison");
	if(([_side] call GDGM_fnc_getReserves) - _cost > 0 && ([_side] call GDGM_fnc_getPoints) - _cost > 0) then {
		_x setVariable ["GDGM_garrison",(_x getVariable "GDGM_targetGarrison")];
		[_side, - _cost] spawn GDGM_fnc_addReserves;
		[_side, - _cost] spawn GDGM_fnc_addPoints;
		private _markerName = _x getVariable "GDGM_markerName";
		private _name = _x getVariable "GDGM_name";
		private _text = _name + ": " + str (_x getVariable "GDGM_garrison");

		_markerName setMarkerText _text;
		systemChat (str _side + " resupplied " + _name);
	} else {
		break;
	};
} forEach _toRegarriSorted;






