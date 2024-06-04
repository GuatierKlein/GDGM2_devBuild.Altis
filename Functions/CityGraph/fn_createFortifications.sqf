params["_node"];

// half of the garri in fortif, rest in city

private _garri = _node getVariable "GDGM_garrison";
private _pos = _node getVariable "GDGM_position";
private _amount = floor(_garri / 10);
private _owner = _node getVariable "GDGM_owner";

//max 5?
//depending on garrison? 1 per 5 garri
if(_amount > 5) then {
	_amount = 5;
};

for [{private _i = 0}, {_i < _amount}, {_i = _i + 1}] do {	
	private _spawnPos = [ 
		_pos, //trouver une pos sure
		0, //min dist
		GDGM_maxInstaDistance, //max dist
		12, //object dist
		0, //water mode 0=no water
		0.25, //max grad between 0 and 1
		0, 
		["GDGM_noFortif"], 
	[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;

	// private _marker_object = createMarker [str _spawnPos, _spawnPos];
	// _marker_object setMarkerTypeLocal "loc_Fortress";	
	// _marker_object setMarkerTextLocal "fortif";

	_fortif = createAgent ["logic", _spawnPos, [], 0, "form"];
	_fortif setVariable ["GDGM_position",_spawnPos];
	_fortif setVariable ["GDGM_type","fortification"];
	_fortif setVariable ["GDGM_owner",_owner];
	//_fortif setVariable ["GDGM_markerName",_markerName];
	_fortif setVariable ["GDGM_spawnedObjects",[]];
	_fortif setVariable ["GDGM_isSpawned",false];
	_fortif setVariable ["GDGM_ownerNode",_node];

	//trigger 
	_trg = createTrigger ["EmptyDetector", _spawnPos];	
	_trg setVariable ["GDGM_installation", _fortif];
	_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false, GDGM_YAxisSpawnDistance];	
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_trg setTriggerTimeout [3,3,3,false];
	_trg setTriggerStatements ["this && [(thisTrigger getVariable 'GDGM_installation') getVariable 'GDGM_ownerNode'] call GDGM_fnc_isOnFrontline && [thisList] call GDGM_fnc_isOtherThanPlaneInList", "
		if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_spawnInsta};
	", "
		if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_despawnInsta};
	"];
	_trg setTriggerInterval 10;

	_fortif setVariable ["GDGM_trigger",_trg];
	GDGM_allFortif pushBack _fortif;
};

//roadblocks 
GDGM_deleteRoadsRecursive = {
	params["_road","_roadsArray"];
	
	private _index = -1;
	{
		if(_x == _road) then {
			_index = _forEachIndex;
			break;
		};
	} forEach _roadsArray;

	if(_index == -1) exitWith{};

	_roadsArray deleteAt _index;
	private _connectedRoads = roadsConnectedTo _road;

	{
		[_x, _roadsArray] call GDGM_deleteRoadsRecursive;
		
	} forEach _connectedRoads;
};


private _roads = _pos nearRoads GDGM_roadBlocksOutterLimit;
private _roadsInner = _pos nearRoads GDGM_roadBlocksInnerLimit;
_roads = _roads - _roadsInner;

if(count _roads == 0) exitwith {};

private _roadSegments = [];

while {count _roads > 0} do {
	private _road = selectRandom _roads;
	private _info = getRoadInfo _road;
	_info params ["_mapType", "_width", "_isPedestrian", "_texture", "_textureEnd", "_material", "_begPos", "_endPos", "_isBridge"];
	//skip if pedestrian or in zone noFortif
	if(_isPedestrian || (getPos _road) inArea "GDGM_noFortif") then {_roads = _roads - [_road]; continue};
	private _roadDirection = _begPos getDir _endPos;
	private _dirToNode = [getPos _road, _pos] call BIS_fnc_dirTo;
	private _difference = _roadDirection - _dirToNode;
	if(_difference < 90 && _difference > -90) then {_roadDirection = _roadDirection + 180};
	
	_roadSegments pushBack [getPos _road, _roadDirection];

	//stop at 4 per node
	if(count _roadSegments >= 4) then {break};

	[_road, _roads] call GDGM_deleteRoadsRecursive;
};

_node setVariable ["GDGM_roadBlocks", _roadSegments];



