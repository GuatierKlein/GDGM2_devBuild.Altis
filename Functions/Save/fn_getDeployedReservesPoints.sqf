//return [east, west, independent]

private _eastPoints = 0;
private _westPoints = 0;
private _indepPoints = 0;

//man reserves
{
	if(_x getVariable "GDGM_reserve") then {
		switch (side _x) do {
			case east: { _eastPoints = _eastPoints + 1 };
			case west: { _westPoints = _westPoints + 1 };
			case independent: { _indepPoints = _indepPoints + 1 };
			default { };
		};
	};
} forEach allUnits;

//veh reserves 
private _allVeh = vehicles;
private _currentVResEast = [east] call GDGM_fnc_getVehReserves;
private _currentVResWest = [west] call GDGM_fnc_getVehReserves;
private _currentVResInd = [independent] call GDGM_fnc_getVehReserves;

private _deployedVehEast = [_currentVResEast select 0,_currentVResEast select 1,_currentVResEast select 2,_currentVResEast select 3,_currentVResEast select 4];
private _deployedVehWest = [_currentVResWest select 0,_currentVResWest select 1,_currentVResWest select 2,_currentVResWest select 3,_currentVResWest select 4];
private _deployedVehInd = [_currentVResInd select 0,_currentVResInd select 1,_currentVResInd select 2,_currentVResInd select 3,_currentVResInd select 4];

{
	if(_x getVariable "GDGM_reserve") then {
		_side = _x getVariable "GDGM_owner";
		switch (_x getVariable "GDGM_type") do {
			//adapt
			case "truck": { 
				switch (_side) do {
					case east: { _deployedVehEast set [0, (_deployedVehEast select 0) + 1] };
					case west: { _deployedVehWest set [0, (_deployedVehWest select 0) + 1] };
					case independent: { _deployedVehInd set [0, (_deployedVehInd select 0) + 1] };
				}; 
			};
			case "apc": {
				switch (_side) do {
					case east: { _deployedVehEast set [1, (_deployedVehEast select 1) + 1] };
					case west: { _deployedVehWest set [1, (_deployedVehWest select 1) + 1] };
					case independent: { _deployedVehInd set [1, (_deployedVehInd select 1) + 1] };
				};
			};
			case "tank": {
				switch (_side) do {
					case east: { _deployedVehEast set [2, (_deployedVehEast select 2) + 1] };
					case west: { _deployedVehWest set [2, (_deployedVehWest select 2) + 1] };
					case independent: { _deployedVehInd set [2, (_deployedVehInd select 2) + 1] };
				};
			};
			default { };
		};
	};	
} forEach _allVeh;

[_eastPoints, _westPoints, _indepPoints, [_deployedVehEast, _deployedVehWest, _deployedVehInd]];