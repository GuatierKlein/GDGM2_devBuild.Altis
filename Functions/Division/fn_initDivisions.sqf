params["_divisionSave"];
{
	private _model = GDGM_allDivisionModels get (_x select 0);
	private _reserves = _x select 1;
	private _vehReserves = _x select 2;

	if(count ([_reserves, _vehReserves] call GDGM_fnc_findBestBGReserves) > 0) then {
		[
			_model select 0, //name,
			_model select 1, //side 
			_model select 2,
			_model select 3,
			_vehReserves, //veh reserves
			_reserves, //reserves
			0, //suuplies, not implemented
			_model select 7
		] call GDGM_fnc_division;
	};
	
} forEach _divisionSave;
