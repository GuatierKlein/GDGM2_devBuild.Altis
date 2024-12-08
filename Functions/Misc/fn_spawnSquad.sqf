params["_pos","_grp","_side","_arrayToStore",["_size",7],["_spawnType","NONE"],["_reserve",false],"_veh", ["_isDivison", false], ["_divisionName", ""]];

/*test 
grp = createGroup [_attackingSide ,true]; 
[position player, grp, west, []] spawn GDGM_fnc_spawnSquad;
*/

private _unitType = "";
private _loadoutPool = [];
private _array = [];
private _division = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit };
	case west: {_unitType = GDGM_BLUFOR_baseUnit };
	case independent: {_unitType = GDGM_IND_baseUnit };
};

//get division 
if(_isDivison) then {
	_division = GDGM_allDivisions get _divisionName;
};

//spawn
for [{private _j = 0}, {_j < _size}, {_j = _j + 1}] do {
	//unit type
	switch (_j) do {
		case 0: {
			//SL
			if(_isDivison) then {
				_loadoutPool = _division get "sl";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_SLDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_SLDummies};
					case independent: {_loadoutPool = GDGM_IND_SLDummies};
				};
			};
		};
		case 1: {
			//gre  
			if(_isDivison) then {
				_loadoutPool = _division get "gre";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_greDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_greDummies};
					case independent: {_loadoutPool = GDGM_IND_greDummies};
				};
			};
		};
		case 3: {
			//at  
			if(_isDivison) then {
				_loadoutPool = _division get "at";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_ATDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_ATDummies};
					case independent: {_loadoutPool = GDGM_IND_ATDummies};
				};
			};
		};
		case 5: {
			//mg  
			if(_isDivison) then {
				_loadoutPool = _division get "mg";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_MGDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_MGDummies};
					case independent: {_loadoutPool = GDGM_IND_MGDummies};
				};
			};
		};
		default {
			//rifle
			if(_isDivison) then {
				_loadoutPool = _division get "rifle";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
					case independent: {_loadoutPool = GDGM_IND_rifleDummies};
				};
			};
		};
	};

	_unit = _grp createUnit [_unitType,  _pos, [], 0, "NONE"];

	if(!isNil "_veh") then {
		if(!isNull _veh) then {
			_unit moveInAny _veh;
		};		
	};

	_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
	//TODO code to run on unit spawn
	_arrayToStore pushBack _unit;
	_array pushBack _unit;

	if(_reserve && !_isDivison && [_side] call GDGM_fnc_getReserves < 1) then {
		break;
	};

	if(_reserve && _isDivison) then {
		if([_divisionName] call GDGM_fnc_getReserves < 1) then {
			break;
		};
	};

	if(_reserve) then {
		if(_isDivison) then {
			[_divisionName, -1] call GDGM_fnc_addReserves;
		} else {
			[_side, -1] call GDGM_fnc_addReserves;
		};
	};	

	sleep 0.5;
};

[_array, _reserve] spawn GDGM_fnc_soldierEH;

if(_isDivison) then {
	[_grp, false, true, _division get "skill"] spawn GDGM_fnc_groupEH;
} else {
	[_grp, false, true] spawn GDGM_fnc_groupEH;
};

