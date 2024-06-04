params["_trigger"];

private _listPointer = list _trigger;
private _list = +(_listPointer);
private _count = {_x isKindOf "Man"} count _list;
private _OPFORCount = 0;
private _BLUFORCount = 0;
private _INDCount = 0;
private _res = west;

{
	if(_x isKindOf "Man") then {
		if (side _x == west) then {
			_BLUFORCount = _BLUFORCount + 1;
		} else {
			if (side _x == east) then {
				_OPFORCount = _OPFORCount + 1;
			} else {
				_INDCount = _INDCount + 1;
			};	
		};
	};	
} forEach _list;

//find max 
if(_OPFORCount > _BLUFORCount && _OPFORCount > _INDCount) then {
	_res = east;
} else {
	if(_INDCount > _OPFORCount && _INDCount > _BLUFORCount) then {
		_res = independent;
	};
};

_res;