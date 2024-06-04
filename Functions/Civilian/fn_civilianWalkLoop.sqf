params ["_civ_array","_house_list","_trg"];
_house = objNull;
_all_pos = [];

while {triggerActivated _trg} do {
	if(count _civ_array == 0) exitWith {};
	private _index = _civ_array findIf {(moveToCompleted _x || moveToFailed _x)};
	// private _index = _civ_array findIf {(moveToCompleted _x || moveToFailed _x) && !(_x getVariable "gdgm_haspanic")};
	if (_index != -1) then {
		while {count _all_pos == 0} do {
			_house = selectrandom _house_list;
			_all_pos = _house buildingPos -1;		
		};
		(_civ_array select _index) setDestination [(selectrandom _all_pos), "LEADER PLANNED", true];
		_all_pos = [];
	};
	sleep 2;
};

