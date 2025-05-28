params["_side","_nodeFrom","_nodeTo","_garrisonStrength","_bg","_cost","_reserveCost","_combatPower", ["_isDivison", false], ["_divisionName", ""]];

[format ["%1 attacks with %2 supplies and %3 reserves", str _side, str _cost, str _reserveCost]] call GDGM_fnc_logRPT;

//create task
private _title = ([_side] call GDGM_fnc_getFactionName) + " is attacking " + (_nodeTo getVariable "GDGM_name");
private _desc = ([daytime, "HH:MM"] call BIS_fnc_timeToString) + ", " + ([_side] call GDGM_fnc_getFactionName) + " is attacking " + (_nodeTo getVariable "GDGM_name") + " from " + (_nodeFrom getVariable "GDGM_name") + ". ";
private _pos = _nodeTo getVariable "GDGM_position";
private _taskId = str _side + str _nodeFrom + str _nodeTo + str dayTime;
private _waitTime = 20*60;
// private _waitTime = 1;
_desc = _desc + "This attack will auto resolve in 20 minutes.";

[true, _taskId, [_desc, _title, ""], _pos, "CREATED", -1, true] call BIS_fnc_taskCreate;

//draw arrow 
private _arrow = [_nodeFrom getVariable "GDGM_position", _nodeTo getVariable "GDGM_position", [0,0,1,0.5],[150,0.25,2]] call BIS_fnc_drawArrow;

//create trigger
_trg = createTrigger ["EmptyDetector", _pos, false];	
_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false];	
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_trg setTriggerTimeout [10,10,10,false];
_trg setTriggerStatements ["this && [thisList] call GDGM_fnc_isOtherThanPlaneInList", "", ""];
_trg setTriggerInterval 20;

//once trigger activated we spawn
private _i = 0;
waitUntil { sleep 1; _i = _i + 1; triggerActivated _trg || _i > _waitTime };

deleteVehicle _trg;

if(_i <= _waitTime) then {
	//spend points
	[_side, -_cost] spawn GDGM_fnc_addPoints;
	//chack reserves 
	if(_reserveCost > [_side] call GDGM_fnc_getReserves) exitwith {
		[_taskId,"CANCELED"] call BIS_fnc_taskSetState;
		_arrow call BIS_fnc_drawArrow;
	};
	//spawn attack
	[_nodeFrom, _nodeTo, _bg, _side, _taskId, _isDivison, _divisionName] spawn GDGM_fnc_startAttack;
	_arrow call BIS_fnc_drawArrow;
} else {
	//spend points
	[_side, -_cost] spawn GDGM_fnc_addPoints;
	//auto resolve
	private _result = [_combatPower, _reserveCost, _garrisonStrength, _side, _nodeTo getVariable "GDGM_owner", _bg] call GDGM_fnc_autoResolveAttack;
	[_nodeTo, 0.2] call GDGM_fnc_addDestruction;
	systemChat str (_result select 0);
	if(_result select 0) then {
		//attack succes 
		[_nodeTo, _side] spawn GDGM_fnc_changeOwner;
		[_taskId,"CANCELED"] call BIS_fnc_taskSetState;
		_arrow call BIS_fnc_drawArrow;

	} else {
		private _garri = floor(_garrisonStrength * (_result select 1));
		_nodeTo setVariable ["GDGM_garrison", _garri];
		[_nodeTo] spawn GDGM_fnc_updateNodeMarker;
		_arrow call BIS_fnc_drawArrow;
		[_taskId,"CANCELED"] call BIS_fnc_taskSetState;
	};
};


