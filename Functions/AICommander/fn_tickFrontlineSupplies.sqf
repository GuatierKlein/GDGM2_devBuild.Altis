//count front lines
private _frontlineAmounts = [0, 0, 0]; //OPFOR, BLUFOR, IND

{
	{
		if([_x] call GDGM_fnc_isFrontline && !surfaceIsWater (_x getVariable "GDGM_position")) then {
			if(_x getVariable "GDGM_owner" == east) then {
				_frontlineAmounts set [0, (_frontlineAmounts select 0) + 1];
				continue;
			};
			if(_x getVariable "GDGM_owner" == west) then {
				_frontlineAmounts set [1, (_frontlineAmounts select 1) + 1];
				continue;
			};
			_frontlineAmounts set [2, (_frontlineAmounts select 2) + 1];
		};
	} forEach _x;
} forEach GDGM_allSquares;

//supplies 
[east, -(_frontlineAmounts select 0)] call GDGM_fnc_addPoints;
[west, -(_frontlineAmounts select 1)] call GDGM_fnc_addPoints;
[independent, -(_frontlineAmounts select 2)] call GDGM_fnc_addPoints;

//reserves 
// [east, -(_frontlineAmounts select 0)] call GDGM_fnc_addReserves;
// [west, -(_frontlineAmounts select 1)] call GDGM_fnc_addReserves;
// [independent, -(_frontlineAmounts select 2)] call GDGM_fnc_addReserves;