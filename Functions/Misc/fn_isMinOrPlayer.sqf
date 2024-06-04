params["_trigger", "_side"];

private _listPointer = list _trigger;
private _list = +(_listPointer);
private _units = 0;
private _res = false;

{
	if(_x isKindOf "Man") then {
		if(side _x == _side) then {
			_units = _units + 1;
			if(isPlayer _x) then {
				_res = true;
				break;
			};
		};
	};	
} forEach _list;

if(!_res && _units > 10) then {
	_res = true;
};
_res;