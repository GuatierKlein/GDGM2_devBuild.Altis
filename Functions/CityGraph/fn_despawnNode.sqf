params["_node"];

sleep 15;

private _objects = _node getVariable "GDGM_spawnedObjects";
private _side = west;

{
	if(_x getVariable "GDGM_reserve") then {
		_side = _x getVariable "GDGM_owner";
		private _divisionOrSide = _x getVariable ["GDGM_divisionName", _side];

		switch (_x getVariable "GDGM_type") do {
			case "truck": { 
				if(count(crew _x) > 0) then {
					[_divisionOrSide, [1,0,0,0,0]] call GDGM_fnc_addVehReserves; 
				};
			};
			case "apc": { 
				if(count(crew _x) > 0) then {
					[_divisionOrSide, [0,1,0,0,0]] call GDGM_fnc_addVehReserves; 
				};
			};
			case "tank": { 
				if(count(crew _x) > 0) then {
					[_divisionOrSide, [0,0,1,0,0]] call GDGM_fnc_addVehReserves; 
				};
			};
			case "man": { 
				private _division = _x getVariable ["GDGM_divisionName", ""];
				if(_division = "") then {
					[_division, 1] call GDGM_fnc_addReserves; 
				} else {
					[side _x, 1] call GDGM_fnc_addReserves; 
				};	
			};
			default { };
		};
	};
	deleteVehicle _x;	
	sleep 0.1;
} forEach _objects;

if(_node getVariable "GDGM_isSpawned") then {
	GDGM_nbNodeSpawn = GDGM_nbNodeSpawn - 1;
};

_node setVariable ["GDGM_isSpawned", false];
_node setVariable ["GDGM_spawnedObjects", []];

private _markerName = _node getVariable "GDGM_spawnMarker";
_node setVariable ["GDGM_spawnMarker",""];
deleteMarker _markerName;





