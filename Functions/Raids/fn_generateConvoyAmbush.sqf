params["_attackingSide","_node"];

private _pos = _node getVariable "GDGM_position";
private _spawnPoss = [];
private _nbVehicles = 4; //un veh armé, 2 camions
private _waitTime = 3600;

//find end point  
private _toNode = [_node getVariable "GDGM_owner",_node] call GDGM_fnc_findFriendlyNeighbourNode;

if(isNull _toNode) exitWith {"An error occured when trying to create the raid, please retry, this is due to the GDGM still being in development." remoteExec ["systemChat",0];};

//find road 
private _nearbyRoads = [_pos select 0, _pos select 1] nearRoads 350;

if(count _nearbyRoads < _nbVehicles) exitWith {"An error occured when trying to create the raid, please retry, this is due to the GDGM still being in development." remoteExec ["systemChat",0];};

//roads
for [{private _i = 0}, {_i < _nbVehicles}, {_i = _i + 1}] do {
	private _road = selectRandom _nearbyRoads;
	_nearbyRoads = _nearbyRoads - [_road];
	private _info = getRoadInfo _road;
	private _dir = (_info select 6) getDir (_info select 7);
	_spawnPoss pushBack [(getPos _road), _dir];
};

	//no roads  
	// _spawnPoss pushBack ([ 
	// 	_pos, //trouver une pos sure
	// 	0, //min dist
	// 	50, //max dist
	// 	3, //object dist
	// 	0, //water mode 0=no water
	// 	0.8, //max grad between 0 and 1
	// 	0, 
	// 	[], 
	// [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos);

//create task
private _title = str _attackingSide + ": convoy ambush at " + (_node getVariable "GDGM_name");
private _desc = ([daytime, "HH:MM"] call BIS_fnc_timeToString) + ", " + str _attackingSide + " commander wants you to ambush an ennemy convoy going from " + (_node getVariable "GDGM_name") + " to " + (_toNode getVariable "GDGM_name") + ". This objective will be available until" + [1] call GDGM_fnc_getIRLTime;
private _taskId = str _attackingSide + str _node + str _toNode + str dayTime;

[_attackingSide, _taskId, [_desc, _title, ""], _pos, "CREATED", -1, true] call BIS_fnc_taskCreate;

//create trigger
_trg = createTrigger ["EmptyDetector", _pos, false];	
_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false];	
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_trg setTriggerStatements ["this && [thisList] call GDGM_fnc_isOtherThanPlaneInList", "", ""];
_trg setTriggerInterval 5;

//once trigger activated we spawn
private _i = 0;
waitUntil { sleep 1; _i = _i + 1; triggerActivated _trg || _i > _waitTime };
deleteVehicle _trg;

if(_i > _waitTime) exitWith {
	[_taskId,"CANCELED"] call BIS_fnc_taskSetState;
	[_attackingSide, -1] call GDGM_fnc_addRaidNb;
};

"Spawning convoy in 5 minutes..." remoteExec ["systemChat",0];
sleep 300;
"Spawning convoy" remoteExec ["systemChat",0];
[_toNode, _spawnPoss, _taskId, _attackingSide] spawn GDGM_fnc_spawnConvoyAmbush; 


