params["_side"];

//find nodes
private _friendlyNodes = GDGM_strategicNodes select { _x getVariable "GDGM_owner" == _side };

if(count _friendlyNodes < 2) exitWith {};

private _nodeFrom = selectRandom _friendlyNodes;
_friendlyNodes = _friendlyNodes - [_nodeFrom];
private _nodeTo = selectRandom _friendlyNodes;
private _pos = _nodeFrom getVariable "GDGM_position";
private _posTo = _nodeTo getVariable "GDGM_position";

//find pos
private _spawnPos = [ 
	_pos, //trouver une pos sure
	0, //min dist
	500, //max dist
	10, //object dist
	0, //water mode 0=no water
	0.25, //max grad between 0 and 1
	0, 
	["GDGM_noFortif"], 
[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;

//spawn crate
private _crate = "B_CargoNet_01_ammo_F" createVehicle (_spawnPos);

//create task
private _title = "Heli logi run : ammo to " + (_nodeTo getVariable "GDGM_name");
private _desc = ([daytime, "HH:MM"] call BIS_fnc_timeToString) + ", there is an ammo load that must be transported from " + (_nodeFrom getVariable "GDGM_name") + " to " + (_nodeTo getVariable "GDGM_name") + ". The crate must be dropped within 200m of the node (This mission is for pilots)";
private _taskId = str _side + str _nodeFrom + str dayTime;

[_side, _taskId, [_desc, _title, ""], _spawnPos, "CREATED", -1, true] call BIS_fnc_taskCreate;

GDGM_heliRaid_nb = GDGM_heliRaid_nb + 1;

//succeed task
waitUntil { sleep 30; ((getPosATL _crate) select 2) < 5 && _posTo distance2D _crate < 100 };
[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;

[_side, 20] spawn GDGM_fnc_addPoints;

sleep 30;
deleteVehicle _crate;
GDGM_heliRaid_nb = GDGM_heliRaid_nb - 1;





