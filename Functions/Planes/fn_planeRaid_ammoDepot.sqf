params["_side","_node"];

private _pos = _node getVariable "GDGM_position";
private _ennemySide = _node getVariable "GDGM_owner";

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

//spawn ammo trucks
private _spawnPool = [];
private _crewPool = [];
private _aaPool = [];
private _crewPool = [];
private _baseUnit = [];

switch (_ennemySide) do {
	case east: { _spawnPool = GDGM_OPFOR_ammoTrucks; _crewPool = GDGM_OPFOR_CrewDummies; _baseUnit = GDGM_OPFOR_baseUnit; _aaPool = GDGM_OPFOR_AA; _crewPool = GDGM_OPFOR_rifleDummies};
	case west: { _spawnPool = GDGM_BLUFOR_ammoTrucks; _crewPool = GDGM_BLUFOR_CrewDummies; _baseUnit = GDGM_BLUFOR_baseUnit; _aaPool = GDGM_BLUFOR_AA; _crewPool = GDGM_BLUFOR_rifleDummies};
	case independent: { _spawnPool = GDGM_IND_ammoTrucks; _crewPool = GDGM_IND_CrewDummies; _baseUnit = GDGM_IND_baseUnit; _aaPool = GDGM_IND_AA; _crewPool = GDGM_IND_rifleDummies};
};

private _veh1 = (selectRandom _spawnPool) createVehicle (_spawnPos);
private _veh2 = (selectRandom _spawnPool) createVehicle (_spawnPos);

//aa 
if(random 1 > 0.5) then {
	private _veh3 = (selectRandom _aaPool) createVehicle (_spawnPos);
	_veh3 setFuel 0;

	_newGrp = createGroup [_ennemySide ,true]; 
	_unit = _newGrp createUnit [_baseUnit,  _pos, [], 0, "FORM"];
	_unit setUnitLoadout getUnitLoadout (selectRandom _crewPool);
	_unit moveInGunner _veh3;
	_unit assignAsGunner _veh3;
};

//create task
private _title = "Air raid : supply trucks in " + (_node getVariable "GDGM_name");
private _desc = ([daytime, "HH:MM"] call BIS_fnc_timeToString) + ", " + ([_ennemySide] call GDGM_fnc_getFactionName) + " is assembling supply trucks in " + (_node getVariable "GDGM_name") + ", destroy them! (This mission is for pilots)";
private _taskId = str _side + str _node + str dayTime;

[_side, _taskId, [_desc, _title, ""], _spawnPos, "CREATED", -1, true] call BIS_fnc_taskCreate;

//succeed task
waitUntil { sleep 30; !alive _veh1 && !alive _veh2 };
[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;

[_ennemySide, -50] spawn GDGM_fnc_addPoints;

GDGM_planeRaid_nb = GDGM_planeRaid_nb - 1;
[_ennemySide, 1] call GDGM_fnc_addThreatLevel;




