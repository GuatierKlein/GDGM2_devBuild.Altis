params["_attackingSide","_node"];

private _pos = _node getVariable "GDGM_position";
private _waitTime = 3600;

//create task
private _title = str _attackingSide + ": kill the officer at " + (_node getVariable "GDGM_name");
private _desc = ([daytime, "HH:MM"] call BIS_fnc_timeToString) + ", " + str _attackingSide + " commander wants you to kill an ennemy officer in " + (_node getVariable "GDGM_name") + ". This objective will be available until " + ([1] call GDGM_fnc_getIRLTime);
private _taskId = str _attackingSide + str _node + str dayTime;

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

[_node, _taskId, _attackingSide] spawn GDGM_fnc_spawnAssassination; 


