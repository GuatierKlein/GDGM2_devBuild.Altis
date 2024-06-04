// _amount = nb of [trucks, apcs, tanks, transport helos, combat aircrafts]
params["_side","_amount"];

private _res = [_side] call GDGM_fnc_getVehReservesString;

for [{private _i = 0}, {_i < 5}, {_i = _i + 1}] do {
	_res set [_i, (_res select _i) + (_amount select _i)];
};



