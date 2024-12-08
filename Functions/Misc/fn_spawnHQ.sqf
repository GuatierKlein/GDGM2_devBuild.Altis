params["_pos","_grp","_side","_arrayToStore", ["_building", objnull],["_rank", "CAPTAIN"],["_spawnType","NONE"],["_reserve",false],"_veh", ["_isDivison", false], ["_divisionName", ""]];

/*test 
grp = createGroup [_attackingSide ,true]; 
[position player, grp, west, []] spawn GDGM_fnc_spawnSquad;
*/

private _unitType = "";
private _loadoutPool = [];
private _array = [];
private _allPos = [];
private _division = [];

if(!isNull _building) then {
	_allPos = _building buildingPos -1;
};

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
for [{private _j = 0}, {_j < 7}, {_j = _j + 1}] do {
	//unit type
	switch (_j) do {
		case 0: {
			//off
			if(_isDivison) then {
				_loadoutPool = _division get "off";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_OfficerDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_OfficerDummies};
					case independent: {_loadoutPool = GDGM_IND_OfficerDummies};
				};
			};
		};
		case 1: {
			//radio  
			if(_isDivison) then {
				_loadoutPool = _division get "rto";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_radioDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_radioDummies};
					case independent: {_loadoutPool = GDGM_IND_radioDummies};
				};
			};
		};
		case 3: {
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
		case 4: {
			//snper  
			if(_isDivison) then {
				_loadoutPool = _division get "sniper";
			} else {
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_SniperDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_SniperDummies};
					case independent: {_loadoutPool = GDGM_IND_SniperDummies};
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
		case 6: {
		//sl
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

	if(count _allPos != 0) then {
		_pos = selectRandom _allPos;
		_allPos = _allPos - [_pos];
	};

	_unit = _grp createUnit [_unitType,  _pos, [], 0, _spawnType];
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

	if(_j == 0) then {
		_unit setRank _rank;
	};

	if(!isNull _building) then {
		doStop _unit;
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