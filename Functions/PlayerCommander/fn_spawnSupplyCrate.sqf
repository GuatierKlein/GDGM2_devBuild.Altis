params["_type", "_unit"];

if(_type == "medical") then {
	"ACE_medicalSupplyCrate" createVehicle (getPosATL _unit);
} else {
	//spawn custon crate
	private _model = GDGM_supplyCrateModels getOrDefault [_type, []];
	if(count _model == 0) exitWith {hint "Model not found"};

	private _crate = "VirtualReammoBox_small_F" createVehicle (getPosATL _unit);

	{
		_crate addItemCargoGlobal [_x select 0, _x select 1];	
	} forEach _model;
};