// [trucks, apcs, tanks, transport helos, combat aircrafts]
params["_side"];

private _res = [];

if(typeName _side == "SIDE") then { 
	switch (_side) do {
		case east: { _res = GDGM_OPFOR_vehReserves };
		case west: { _res = GDGM_BLUFOR_vehReserves };
		case independent: { _res = GDGM_IND_vehReserves };
	};
} else {
	private _division = GDGM_allDivisions get _side;
	_res = [_division get "transportReserves", _division get "heavyReserves", _division get "tankReserves", 0, 0];
};


_res;

