params["_fromNode","_toNode", "_bestChoiceBG","_attackingSide", "_taskId", ["_isDivison", false], "_divisionName"];

private _defendingSide = _toNode getVariable "GDGM_owner";
private _tankPool = [];
private _heavyVehPool = [];
private _pos = _fromNode getVariable "GDGM_position";
private _attackPos = _toNode getVariable "GDGM_position";
private _spawnedUnits = [];

private _spawnMsg = "Spawning attack on " + (_toNode getVariable "GDGM_name");
["GDGM_attackSpawned", [[_attackingSide] call GDGM_fnc_getFactionName, (_toNode getVariable "GDGM_name")]] remoteExec["BIS_fnc_showNotification", 0];
_spawnMsg remoteExec ["systemChat",0];

//force spawn attacked node 
_toNode setVariable ["GDGM_underAttack",true];

sleep 120;

// arty on frontline 
private _supplies = [_attackingSide] call GDGM_fnc_getPoints;
if(_supplies - 20 >= 0) then {
	// [_attackingSide, -20] call GDGM_fnc_addPoints;
	private _frontlineSquares = [_attackPos, 1500, true, _defendingSide] call GDGM_fnc_getSquaresWithinDist;
	private _artyPos = [];

	if(GDGM_artyFortif) then {
		{
			_artyPos = _x getVariable "GDGM_position";	
			[_artyPos getPos [floor(random 20), floor(random 360)], "Sh_82mm_AMOS", 35, 5, 6] spawn BIS_fnc_fireSupportVirtual;
			sleep 5;
		} forEach _frontlineSquares;
	};

	// arty barrage 
	[_attackPos getPos [floor(random 200), floor(random 360)], "Sh_82mm_AMOS", 300, 20, 5] spawn BIS_fnc_fireSupportVirtual;
};

//spawn BG 
[_pos, _toNode, _attackingSide, _bestChoiceBG] spawn GDGM_fnc_spawnBG;

//bombings
[_toNode, _attackingSide, 5] spawn GDGM_fnc_bombTown;

//after x minutes, remove under attack so that everything can despawn
sleep (GDGM_attackForceSpawnTime*60);
[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
_toNode setVariable ["GDGM_underAttack",false];
_spawnMsg = "Attack on " + (_toNode getVariable "GDGM_name") + " is over, you can safely leave the area.";
_spawnMsg remoteExec ["systemChat",0];
sleep 60;
_spawnMsg = "Reminder: attack on " + (_toNode getVariable "GDGM_name") + " is over, you can safely leave the area.";
_spawnMsg remoteExec ["systemChat",0];


	
