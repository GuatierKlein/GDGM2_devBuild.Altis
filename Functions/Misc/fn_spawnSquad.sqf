params["_pos","_grp","_side","_arrayToStore",["_size",7],["_spawnType","NONE"],["_reserve",false],"_veh", ["_isDivison", false], "_divisionName"];

/*test 
grp = createGroup [_attackingSide ,true]; 
[position player, grp, west, []] spawn GDGM_fnc_spawnSquad;
*/

private _unitType = "";
private _loadoutPool = [];
private _array = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit };
	case west: {_unitType = GDGM_BLUFOR_baseUnit };
	case independent: {_unitType = GDGM_IND_baseUnit };
};

//spawn
for [{private _j = 0}, {_j < _size}, {_j = _j + 1}] do {
	//unit type
	switch (_j) do {
		case 0: {
			//SL
			switch (_side) do {
				case east: {_loadoutPool = GDGM_OPFOR_SLDummies};
				case west: {_loadoutPool = GDGM_BLUFOR_SLDummies};
				case independent: {_loadoutPool = GDGM_IND_SLDummies};
			};
		};
		case 1: {
			//gre  
			switch (_side) do {
				case east: {_loadoutPool = GDGM_OPFOR_greDummies};
				case west: {_loadoutPool = GDGM_BLUFOR_greDummies};
				case independent: {_loadoutPool = GDGM_IND_greDummies};
			};
		};
		case 3: {
			//at  
			switch (_side) do {
				case east: {_loadoutPool = GDGM_OPFOR_ATDummies};
				case west: {_loadoutPool = GDGM_BLUFOR_ATDummies};
				case independent: {_loadoutPool = GDGM_IND_ATDummies};
			};
		};
		case 5: {
			//mg  
			switch (_side) do {
				case east: {_loadoutPool = GDGM_OPFOR_MGDummies};
				case west: {_loadoutPool = GDGM_BLUFOR_MGDummies};
				case independent: {_loadoutPool = GDGM_IND_MGDummies};
			};
		};
		default {
			//rifle
			switch (_side) do {
				case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
				case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
				case independent: {_loadoutPool = GDGM_IND_rifleDummies};
			};
		};
	};

	_unit = _grp createUnit [_unitType,  _pos, [], 0, _spawnType];
	_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
	//TODO code to run on unit spawn
	_arrayToStore pushBack _unit;
	_array pushBack _unit;

	if(_reserve && [_side] call GDGM_fnc_getReserves < 1) then {
		break;
	};

	if(_reserve) then {
		[_side, -1] call GDGM_fnc_addReserves;
	};	

	sleep 0.5;
};

if(!isNil "_veh") then {
	{
		_x moveInCargo _veh;		
	} forEach _array;
};

[_array, _reserve] spawn GDGM_fnc_soldierEH;
[_grp, false, true] spawn GDGM_fnc_groupEH;