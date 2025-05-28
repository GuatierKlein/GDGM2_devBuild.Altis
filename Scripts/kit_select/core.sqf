BAR_enableCustomKitOnRespawn = false; 
//true = le kit sauvegardé à l'arsenal sera automatiquement appliqué au respawn en plus de la spécialisation du mannequin choisit
//false = le kit du mannequin et la spécialisation sera appliqué au respawn sans le kit sauvegardé à l'arsenal

//NE PAS MODIFIER EN DESSOUS
GDGM_loadedSave = false;
BAR_customKit = getUnitLoadout kit_ne;
BAR_fnc_setKit = {
	params ["_kit"];
	private _res = false;
	//test if enough points 
	private _varName = "";

	switch (side player) do {
		case west: { _varName = "GDGM_BLUFOR_supplies" };
		case east: { _varName = "GDGM_OPFOR_supplies" };
		case independent: { _varName = "GDGM_IND_supplies" };
		default { };
	};
	
	private _cost = _kit getVariable ["GDGM_kitCost", 0];
	private _availablePoints = [missionNamespace, _varName, 0] call BIS_fnc_getServerVariable;
	private _availablePointsPlayer = [missionNamespace, "GDGM_player_supplies", 0] call BIS_fnc_getServerVariable;

	if(_cost != 0 && _availablePoints + _availablePointsPlayer - _cost < 0) exitWith {
		_res;
	};

	player setVariable ["BAR_kit",_kit];
	//save in server
	[getPlayerUID player, vehicleVarName _kit] remoteExec ["GDGM_fnc_setSavedPlayerKit", 2];

	//supply cost
	if(_cost != 0) then {
		["player", -_cost] remoteExec["GDGM_fnc_addPoints", 2];
	};
	_res = true;
	_res;
};

BAR_fnc_applyKit = {
	if(!GDGM_loadedSave) then {
		private _stroredKits = [missionNamespace, "GDGM_savedUserKitHashMap", createHashMap] call BIS_fnc_getServerVariable;
		private _savedKit = _stroredKits getOrDefault [(getPlayerUID player), "kit_ne"];
		player setVariable ["BAR_kit", missionNamespace getVariable _savedKit];
		GDGM_loadedSave = true;

		if(_savedKit != "kit_ne") then {
			systemChat "Kit chargé depuis le serveur";
		};
	};

	_kit_unit = player getVariable "BAR_kit";

	_loadout = getUnitLoadout _kit_unit;
	player setUnitLoadout _loadout;
	player setUnitRank (rank _kit_unit);
	
	private _eng = _kit_unit getVariable ["GDGM_isEng", false];
	private _medic = _kit_unit getVariable ["GDGM_isMedic", false];

	player setUnitTrait ["medic", _medic]; 
	player setUnitTrait ["engineer", _eng]; 
	player setUnitTrait ["explosiveSpecialist", _eng]; 

	//ace
	if(_eng) then {
		player setVariable ["ACE_IsEngineer",2, true]; 
		player setVariable ["ACE_isEOD", true, true];
	} else {
		player setVariable ["ACE_IsEngineer",0, true]; 
		player setVariable ["ACE_isEOD", false, true];
	};

	if(_medic) then {
		player setVariable ["ace_medical_medicclass", 1, true];
	}else {
		player setVariable ["ace_medical_medicclass", 0, true];
	};
	
	systemChat ("AuxSan : " + str (player getVariable "ace_medical_medicclass")); //affiche true si medic, false sinon
	systemChat ("Compétence d'ingénieur : " + str (player getVariable "ACE_IsEngineer")); //affiche 1 ou 2 si sapeur, 0 sinon
	systemChat ("Expert explosif : " + str (player getVariable "ACE_isEOD")); //affiche 1 ou 2 si EOD, 0 sinon
	systemChat ("Grade : " + rank player); //affiche le grade reçu
	call BAR_fcn_applyInsignia;
};

//insignes
BAR_fcn_applyInsignia = {
	[player, ""] call BIS_fnc_setUnitInsignia;
	[player, player getVariable "playerInsigne"] call BIS_fnc_setUnitInsignia;
};

BAR_fnc_setInsignia = {
	params ["_insigne"];
	player setVariable ["playerInsigne",_insigne];
	call BAR_fcn_applyInsignia;
};

player setVariable ["playerInsigne","base"];