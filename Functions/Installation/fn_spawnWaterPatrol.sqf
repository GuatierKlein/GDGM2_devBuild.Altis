params["_square"];

private _pos = _square getVariable "GDGM_middle";
private _destSquare = selectRandom GDGM_allWaterFortif;
private _destPos = _destSquare getVariable "GDGM_middle";
private _owner = _square getVariable "GDGM_owner";
private _grp = createGroup [_owner ,true]; 
private _spawnedUnits = [];

[_pos, _grp, _owner, _spawnedUnits] spawn GDGM_fnc_spawnBoat;
sleep 2;
_wp = _grp addWaypoint [[_destPos select 0, _destPos select 1, 0], 150];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setwaypointcombatmode "YELLOW"; 
_wp setWaypointCompletionRadius 50;

_wp = _grp addWaypoint [[_pos select 0, _pos select 1, 0], 150];
_wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "AWARE";
_wp setwaypointcombatmode "YELLOW"; 
_wp setWaypointCompletionRadius 50;

_spawnedUnits = _spawnedUnits + (_square getVariable "GDGM_spawnedObjects");

_square setVariable ["GDGM_isSpawned", true];
_square setVariable ["GDGM_spawnedObjects",_spawnedUnits];