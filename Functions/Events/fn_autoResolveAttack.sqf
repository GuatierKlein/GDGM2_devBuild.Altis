params["_bgCombatPower", "_reserveCost","_garrisonStrength","_attackingSide","_defendingSide", "_bg"];

//si bgPrice > 4 * garri 
	//attack 0.75 success chance
	//defenders loss = random 0.25 + 0.50
//si bgPrice > 3 * garri 
	//attack 0.50 success chance
	//defenders loss = random 0.50 + 0.25
//si bgPrice > 2 * garri 
	//attack 0.25 success chance
	//defenders loss = random 0.25 + 0.25
//si bgPrice > 1 * garri 
	//attack 0.1 success chance
	//defenders loss = random 0.25
//si bgPrice < garri 
	//attack loose
	//defenders loss = random 0.10



private _res = false;
private _defLoss = 0;
private _attLoss = 0;

// systemChat ('auto resolving' + str _attackingSide + " vs " + str _defendingSide);
// systemChat ("attack: " + str _bgCombatPower);
// systemChat ("defense: " + str _garrisonStrength);

if(_bgCombatPower > 4 * _garrisonStrength) then {
	if(random 1 > 0.75) then {
		_res = true;
		_attLoss = 0.25 + random 0.25;
	} else {
		_attLoss = 0.5 + random 0.5;
		_defLoss = 0.5 + random 0.25;
	};
} else {
	if(_bgCombatPower > 3 * _garrisonStrength) then {
		if(random 1 > 0.50) then {
			_res = true;
			_attLoss = 0.5 + random 0.25;
		} else {
			_attLoss = 0.5 + random 0.5;
			_defLoss = 0.25 + random 0.5;
		};
	} else {
		if(_bgCombatPower > 2 * _garrisonStrength) then {
			if(random 1 > 0.25) then {
				_res = true;
				_attLoss = 0.5 + random 0.5;
			} else {
				_attLoss = 0.75 + random 0.25;
				_defLoss = 0.25 + random 0.25;
			};
		} else {
			if(_bgCombatPower > _garrisonStrength) then {
				if(random 1 > 0.1) then {
					_res = true;
					_attLoss = 0.5 + random 0.5;
				} else {
					_attLoss = 0.75 + random 0.25;
					_defLoss = random 0.25;
				}
			};
		};
	};
};

//inflict losses
[_attackingSide, -floor(_attLoss * _reserveCost)] call GDGM_fnc_addReserves;

{
	private _type = _x select 0;
	private _amount = _x select 1;
	private _losses = -ceil(_amount * _attLoss);

	// systemChat ("lost " + (_x select 0) + " : " + str _losses);

	switch (_x select 0) do {
		case "Msquad": { [_attackingSide, [_losses, 0, 0, 0, 0]] call GDGM_fnc_addVehReserves };
		case "apc": { [_attackingSide, [0, _losses, 0, 0, 0]] call GDGM_fnc_addVehReserves };
		case "tank": { [_attackingSide, [0, 0, _losses, 0, 0]] call GDGM_fnc_addVehReserves };
		default { };
	};
} forEach _bg;

[_res, _defLoss];