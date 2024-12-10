params["_divisionSave"];
{
	private _model = GDGM_allDivisionModels get (_x select 0);
	private _reserves = _x select 1;
	
	[
		_model select 0, //name,
		_model select 1, //side 
		_model select 2,
		_model select 3,
		_model select 4, //veh reserves
		_reserves, //reserves
		0, //suuplies, not implemented
		_model select 7
	] call GDGM_fnc_division;
	
} forEach _divisionSave;
