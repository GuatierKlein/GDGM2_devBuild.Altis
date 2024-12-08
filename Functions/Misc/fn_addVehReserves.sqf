// _amount = nb of [trucks, apcs, tanks, transport helos, combat aircrafts]
params["_side","_amount"];

private _res = [_side] call GDGM_fnc_getVehReserves;

if(typeName _side == "SIDE") then { 
	for [{private _i = 0}, {_i < 5}, {_i = _i + 1}] do {
		_res set [_i, (_res select _i) + (_amount select _i)];
	};
} else {
	private _division = GDGM_allDivisions get _side;
	_division set ["transportReserves", 0 max (( _division get "transportReserves") + (_amount select 0))];
	_division set ["heavyReserves", 0 max (( _division get "heavyReserves") + (_amount select 1))];
	_division set ["tankReserves", 0 max (( _division get "tankReserves") + (_amount select 2))];
};





