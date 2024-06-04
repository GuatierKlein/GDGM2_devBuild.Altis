params ["_side","_amount"];

private _offset = [_side] call GDGM_fnc_getMoraleOffset;
private _newOffset = _offset + _amount;

if(_newOffset < -20) then {
	_newOffset = -20;
}else {
	if(_newOffset > 20) then {
		_newOffset = 20;
	};
};

switch (_side) do {
	case east: { GDGM_OPFOR_moraleOffset = _newOffset };
	case west: { GDGM_BLUFOR_moraleOffset = _newOffset };
	case independent: { GDGM_IND_moraleOffset = _newOffset };
	default { };
};

