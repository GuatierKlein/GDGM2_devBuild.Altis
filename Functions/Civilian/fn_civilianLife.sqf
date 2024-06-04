params ["_node", "_trg"];
private _nb_of_civs = 0;
private _unit = objNull;
private _house = objNull;
private _house_pos_all = [];
private _temp_array_units = [];

if(_node getVariable "GDGM_isSpawned") exitwith {};

private _pos = _node getVariable "GDGM_position";
private _house_list = [_pos] call GDGM_fnc_getOpenedHouses;

//ambience 
if (daytime > 7 && daytime < 22) then {
	//[_pos,_nearest_loc,_house_list,_loc_sympth] spawn GDGM_fnc_civilian_ambience;
	_nb_of_civs = (_node getVariable "GDGM_targetGarrison") / 2;
};

//spawn des unités
for [ { private _i = 1 } , { _i <= _nb_of_civs} , { _i = _i + 1 } ] do {
	
	_house_pos_all = [];

	while {count _house_pos_all == 0} do {
		_house = selectrandom _house_list;
		_house_pos_all = _house buildingPos -1;
	};
	
	_house_pos = selectRandom _house_pos_all;

	_unit = createAgent [(selectRandom GDGM_CIV_units), _house_pos, [], 0, "NONE"];

	_temp_array_units pushback _unit;	
	
	_unit setPosATL _house_pos;

	_unit disableAI "FSM";
	_unit setBehaviour "CARELESS";
	_unit forceSpeed (_unit getSpeed "SLOW");	

	while {count _house_pos_all == 0} do {
		_house = selectrandom _house_list;
		_house_pos_all = _house buildingPos -1;
	};

	_house_pos = selectRandom _house_pos_all;	
	_unit setDestination [_house_pos, "LEADER PLANNED", true];
	_house_pos_all = [];

	// sleep (GDGM_AdditionalUnitCreationDelay);
	sleep 0.1;
};

[_temp_array_units,_house_list,_trg] spawn GDGM_fnc_civilianWalkLoop;

_civ_array = _node getVariable "GDGM_spawnedObjects";
_node setVariable ["GDGM_spawnedObjects", _civ_array + _temp_array_units];		











