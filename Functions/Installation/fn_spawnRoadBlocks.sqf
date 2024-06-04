params["_node"];

private _tmpArray = [];

private _composition = [];
private _roadBlocks = _node getVariable "GDGM_roadBlocks";
private _owner = _node getVariable "GDGM_owner";
private _loadoutPool = [];
private _staticPool = [];
private _heavyPool = [];
private _heavyVehPool = [];
private _unitType = "";
private _tmpArray = [];
private _unitArray = [];
private _unitCount = 0;

//from biki https://community.bistudio.com/wiki/Position#PositionAGLS
KK_fnc_setPosAGLS = {
	params ["_obj", "_pos", "_offset"];
	_offset = _pos select 2;
	if (isNil "_offset") then {_offset = 0};
	_pos set [2, worldSize];
	_obj setPosASL _pos;
	_pos set [2, vectorMagnitude (_pos vectorDiff getPosVisual _obj) + _offset];
	_obj setPosASL _pos;
};

//spawn pool  
switch (_owner) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _staticPool = GDGM_OPFOR_statics; _heavyPool = GDGM_OPFOR_heavyWeap; _heavyVehPool = GDGM_OPFOR_heavyArmedVeh };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _staticPool = GDGM_BLUFOR_statics; _heavyPool = GDGM_BLUFOR_heavyWeap; _heavyVehPool = GDGM_BLUFOR_heavyArmedVeh };
	case independent: {_unitType = GDGM_IND_baseUnit; _staticPool = GDGM_IND_statics; _heavyPool = GDGM_IND_heavyWeap; _heavyVehPool = GDGM_IND_heavyArmedVeh };
};

{
	//spawn compo
	private _pos = _x select 0;
	private _compDir = _x select 1;
	private _spawnedObjects = [_pos, _compDir, selectRandom GDGM_data_roadBlocks, 0] call BIS_fnc_objectsMapper;

	//unit spawn
	_newGrp = createGroup [_owner ,true]; 
	{
		//unit choice 
		switch (_unitCount) do {
			case 0: {
				//SL
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_SLDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_SLDummies};
					case independent: {_loadoutPool = GDGM_IND_SLDummies};
				};
			};
			case 1: {
				//gre  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_greDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_greDummies};
					case independent: {_loadoutPool = GDGM_IND_greDummies};
				};
			};
			case 3: {
				//at  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_ATDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_ATDummies};
					case independent: {_loadoutPool = GDGM_IND_ATDummies};
				};
			};
			case 5: {
				//mg  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_MGDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_MGDummies};
					case independent: {_loadoutPool = GDGM_IND_MGDummies};
				};
			};
			default {
				//rifle
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
					case independent: {_loadoutPool = GDGM_IND_rifleDummies};
				};
			};
		};
		//object treatment
		switch (typeOf _x) do {
			case "Sign_Arrow_Cyan_F": {
				//unit spawn 
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_unit disableAI "PATH";
				_unit setUnitPos "MIDDLE";
				deleteVehicle _x;
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_unitCount = _unitCount + 1;
				_unit setDir _compDir;
			};
			case "Sign_Arrow_Yellow_F": {
				//heightened unit spawn 
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				private _tmpPos = getPosASL _x;
				[_unit, [_tmpPos select 0, _tmpPos select 1, 0]] call KK_fnc_setPosAGLS;
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_unit disableAI "PATH";
				_unit setUnitPos "UP";
				deleteVehicle _x;
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_unitCount = _unitCount + 1;
				_unit setDir _compDir;
			};
			case "Sign_Arrow_Blue_F": {
				//static spawn 
				_weap = (selectRandom _staticPool) createVehicle (getPos _x);
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				_unit moveInGunner _weap;
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_unit disableAI "PATH";
				deleteVehicle _x;
				_tmpArray pushBack _weap;
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_weap setDir _compDir;
			};
			case "Sign_Arrow_Pink_F": {
				//heightened static spawn 
				_weap = (selectRandom _staticPool) createVehicle (getPos _x);
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				private _tmpPos = getPosASL _x;
				[_weap, [_tmpPos select 0, _tmpPos select 1, 0]] call KK_fnc_setPosAGLS;
				_unit moveInGunner _weap;
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_unit disableAI "PATH";
				deleteVehicle _x;
				_tmpArray pushBack _weap;
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_weap setDir _compDir;
			};
			case "Sign_Arrow_Large_F": {
				//heavy weapon spawn, 50% chance
				if(random 1 < GDGM_heavyWeaponSpawnProbability) then {deleteVehicle _x; continue};
				_weap = (selectRandom _heavyPool) createVehicle (getPos _x);
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				_unit moveInGunner _weap;
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_unit disableAI "PATH";
				deleteVehicle _x;
				_tmpArray pushBack _weap;
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_unitCount = _unitCount + 1;
				_weap setDir _compDir;
			};
			case "Sign_Arrow_Large_Blue_F": {
				//heavy weapon spawn, 50% chance
				if(random 1 > 0.5) then {deleteVehicle _x; continue};
				//heavy veh emplacement
				_veh = (selectRandom _heavyVehPool) createVehicle (getPos _x);
				_veh setDir getDir _x;
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				_unit moveInDriver _veh;
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_unit = _newGrp createUnit [_unitType,  getPos _x, [], 0, "CAN_COLLIDE"];
				_unit moveInGunner _veh;
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				_tmpArray pushBack _unit;
				_unitArray pushBack _unit;
				_veh disableAI "PATH";
				deleteVehicle _x;
				_tmpArray pushBack _veh;			
			};
			default {_x enableSimulationGlobal false; _tmpArray pushBack _x };
		};	

		sleep 0.25;
	} forEach _spawnedObjects;
	private _groups = _node getVariable "GDGM_instaGroups";
	_groups pushBack _newGrp;
	[_newGrp, true, false] spawn GDGM_fnc_groupEH;
} forEach _roadBlocks;


[_unitArray] spawn GDGM_fnc_soldierEH;


_tmpArray = _tmpArray + (_node getVariable "GDGM_spawnedObjects");
_node setVariable ["GDGM_spawnedObjects",_tmpArray];