params["_insta"];

if(_insta getVariable "GDGM_isSpawned" || !isServer) exitWith {};

private _composition = [];
private _owner = _insta getVariable "GDGM_owner";
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

//choose corresponding composition to spawn
private _dir = 0;
switch (_insta getVariable "GDGM_type") do {
	case "frontline": {_composition = selectRandom GDGM_data_smallEntrenchments; _dir = _insta getVariable "GDGM_dir"};
	case "roadBlock": {_composition = selectRandom GDGM_data_roadBlocks; _dir = _insta getVariable "GDGM_dir"};
	case "fortification": {_composition = selectRandom GDGM_data_fortifications; _dir = floor(random 360)} ;
	default { };
};

//spawn compo
private _pos = _insta getVariable "GDGM_position";
private _spawnedObjects = [_pos, _dir, _composition, 0] call BIS_fnc_objectsMapper;

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
			_unit setDir _dir;
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
			_unit setDir _dir;
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
			_weap setDir _dir;
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
			_weap setDir _dir;
		};
		case "Sign_Arrow_Large_F": {
			//heavy weapon spawn 
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
			_weap setDir _dir;
		};
		case "Sign_Arrow_Large_Blue_F": {
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

[_newGrp, true, _insta getVariable "GDGM_type" == "fortification"] spawn GDGM_fnc_groupEH;

//set as insta group
private _ownerNode = _insta getVariable "GDGM_ownerNode";
if(!isNil "_ownerNode") then {
	private _groups = _ownerNode getVariable "GDGM_instaGroups";
	_groups pushBack _newGrp;
};

//patrols for frontlines
if(_insta getVariable "GDGM_type" == "frontline" || _insta getVariable "GDGM_type" == "roadBlock") then {
	_newGrp = createGroup [_owner ,true]; 
	private _spawnPos = [ 
		_pos, //trouver une pos sure
		10, //min dist
		40, //max dist
		2, //object dist
		0, //water mode 0=no water
		0.4, //max grad between 0 and 1
		0, 
		[], 
	[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
	switch (_owner) do {
		case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
		case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
		case independent: {_loadoutPool = GDGM_IND_rifleDummies};
	};

	if(random 1 > 0.5) then {
		private _neighbours = [_insta] call GDGM_fnc_getFrontlineNeighbours;
		if(count _neighbours == 0) exitwith{};
		//spawn sentries
		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_tmpArray pushBack _unit;
		_unitArray pushBack _unit;
		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_tmpArray pushBack _unit;
		_unitArray pushBack _unit;
		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_tmpArray pushBack _unit;
		_unitArray pushBack _unit;

		_wp = _newGrp addWaypoint [(selectRandom _neighbours) getVariable "GDGM_position", 20];
		_wp setWaypointType "Move";
		_wp setWaypointBehaviour "SAFE";
		_wp setwaypointcombatmode "RED"; 
		_wp setWaypointSpeed "LIMITED"; 

		_wp = _newGrp addWaypoint [_spawnPos, 5];
		_wp setWaypointType "cycle";
		_wp setWaypointBehaviour "SAFE";
		_wp setwaypointcombatmode "RED"; 
		_wp setWaypointSpeed "LIMITED"; 
	} else {
		//spawn tiny QRF
		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_tmpArray pushBack _unit;
		_unitArray pushBack _unit;
		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_tmpArray pushBack _unit;
		_unitArray pushBack _unit;
		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_tmpArray pushBack _unit;
		_unitArray pushBack _unit;

		_wp = _newGrp addWaypoint [_spawnPos, 5];
		_wp setWaypointType "guard";
	};

	[_newGrp, false, false] spawn GDGM_fnc_groupEH;

	//spawn biggest building in frontline
	if(GDGM_spawnFrontlineBuildings) then {
		private _middle = _insta getVariable "GDGM_middle";
		private _houses = [_middle, 250] call GDGM_fnc_getOpenedHouses;
		if(count _houses != 0) then {
			private _house = _houses select 0;

			private _allPos = _house buildingPos -1;
			private _newGrp = createGroup [_owner ,true]; 
			private _unitCount = 0;
			//spawn house
			for [{private _j = 0}, {_j < 5}, {_j = _j + 1}] do {
				if(count _allPos == 0) then {break};
				_spawnPos = selectRandom _allPos;
				_allPos = _allPos - [_spawnPos];

				//unit type
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

				_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "CAN_COLLIDE"];
				_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
				// _unit disableAI "PATH";
				doStop _unit;
				//_unit setPosATL _spawnPos;
				//TODO code to run on unit spawn
				_tmpArray pushBack _unit;
				_unitCount = _unitCount + 1;
			};
			[_newGrp, false, false] spawn GDGM_fnc_groupEH;
		};
	};
	
};



_tmpArray = _tmpArray + (_insta getVariable "GDGM_spawnedObjects");

_insta setVariable ["GDGM_isSpawned", true];
_insta setVariable ["GDGM_spawnedObjects",_tmpArray];

[_unitArray] spawn GDGM_fnc_soldierEH;

// switch (_insta getVariable "GDGM_type") do {
// 	case "frontline": {_composition = selectRandom GDGM_data_smallEntrenchments};
// 	case "fortification": {_composition = selectRandom GDGM_data_fortifications};
// 	default { };
// };



