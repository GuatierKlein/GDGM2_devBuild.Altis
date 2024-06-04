params["_square"];
//en dehors des garrison des nodes

private _middle = _square getVariable "GDGM_middle";

if!(_middle inArea "GDGM_AO") exitWith {};

private _closestNode = [_middle] call GDGM_fnc_findClosestNode;
private _closestNodePos = _closestNode getVariable "GDGM_position";
if(_closestNode getVariable "GDGM_type" == "civilian" && _closestNodePos distance2D _middle < 250) exitWith {};

private _spawnPos = [];
private _spawnTrig = true;
//find heighest pos?

//check for roads 
private _roads = _middle nearRoads 250;
if(count _roads > 4) then {
	//roads 
	private _road = selectRandom _roads;
	_spawnPos = getPos _road;
	_square setVariable ["GDGM_position",_spawnPos];
	private _info = getRoadInfo _road;
	_info params ["_mapType", "_width", "_isPedestrian", "_texture", "_textureEnd", "_material", "_begPos", "_endPos", "_isBridge"];
	private _ennemySquare = [_square] call GDGM_fnc_findClosestEnnemySquare;
	private _ennyMiddle = _ennemySquare getVariable "GDGM_middle";
	private _roadDirection = _begPos getDir _endPos;
	private _dirToNode = [getPos _road, _ennyMiddle] call BIS_fnc_dirTo;
	private _difference = _roadDirection - _dirToNode;
	if(_difference > 90 || _difference < -90) then {_roadDirection = _roadDirection + 180};

	_square setVariable ["GDGM_dir", _roadDirection];
	_square setVariable ["GDGM_type","roadBlock"];

} else {
	//no roads
	_spawnPos = [ 
		_middle, //trouver une pos sure
		0, //min dist
		250, //max dist
		7, //object dist
		0, //water mode 0=no water
		0.333, //max grad between 0 and 1
		0, 
		[], 
	[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;

	//check for [0,0,0] to see if success

	if(_spawnPos select 0 != 0 && _spawnPos select 1 != 0) then {;
		_square setVariable ["GDGM_position",_spawnPos];

		//direction
		private _ennemySquare = [_square] call GDGM_fnc_findClosestEnnemySquare;
		private _ennyMiddle = _ennemySquare getVariable "GDGM_middle";
		private _dir = [_middle, _ennyMiddle] call BIS_fnc_dirTo;
		_square setVariable ["GDGM_dir", _dir];
	} else {
		//water 
		if(!surfaceIsWater _middle) exitWith {_spawnTrig = false};

		GDGM_allWaterFortif pushBack _square;

		if(random 1 < GDGM_waterPatrolProba) then {
			_spawnTrig = false;
			//trigger 
			_trg = createTrigger ["EmptyDetector", _middle];	
			_trg setVariable ["GDGM_installation", _square];
			_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false, GDGM_YAxisSpawnDistance];	
			_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
			_trg setTriggerTimeout [3,3,3,false];
			_trg setTriggerStatements ["this && [thisList] call GDGM_fnc_isOtherThanPlaneInList", "
				if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_spawnWaterPatrol};
			", "
				if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_despawnInsta};
			"];
			_trg setTriggerInterval 5;

			_square setVariable ["GDGM_trigger",_trg];
		};
	};
};

// private _marker_object = createMarker [str _spawnPos, _spawnPos];
// _marker_object setMarkerTypeLocal "loc_Fortress";

if(_spawnTrig) then {
	//trigger 
	_trg = createTrigger ["EmptyDetector", _spawnPos];	
	_trg setVariable ["GDGM_installation", _square];
	_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false, GDGM_YAxisSpawnDistance];	
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_trg setTriggerTimeout [3,3,3,false];
	_trg setTriggerStatements ["this && [thisList] call GDGM_fnc_isOtherThanPlaneInList", "
		if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_spawnInsta};
	", "
		if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_despawnInsta};
	"];
	_trg setTriggerInterval 5;

	_square setVariable ["GDGM_trigger",_trg];
};

//when a guy killed, garri goes down, and and won't be there at next repop

//mines 
if(!surfaceIsWater _middle && (random 1 < GDGM_mineProbability || (count _roads > 0 && random 1 < GDGM_mineProbability + GDGM_mineProbabilityRoadBonus))) then {
	//trigger 
	_trg = createTrigger ["EmptyDetector", _middle];	
	_trg setVariable ["GDGM_installation", _square];
	_trg setTriggerArea [700, 700, 0, false];	
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_trg setTriggerTimeout [3,3,3,false];
	_trg setTriggerStatements ["this && [thisList] call GDGM_fnc_isOtherThanPlaneInList", "
		if (isServer) then {[thisTrigger getVariable 'GDGM_installation', thisTrigger] spawn GDGM_fnc_spawnMineField};
	", "
	"];
	_trg setTriggerInterval 20;

	private _owner = _square getVariable "GDGM_owner";
	[_middle] remoteExec ["GDGM_fnc_createMineMarker", _owner];

	// _marker = createMarker[str _middle, _middle];
	// _marker setMarkerType "hd_dot";
};