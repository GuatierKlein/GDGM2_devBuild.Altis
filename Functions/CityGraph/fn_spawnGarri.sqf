params["_node","_owner"];

//get highest garri friendly node 
private _connectedNodes = _node getVariable "GDGM_connectedNodes";
private _maxGarri = 0;
private _maxNode = _connectedNodes select 0;
private _found = false;
private _pos = _node getVariable "GDGM_position";
private _spawnedUnits = [];

{
	private _ownerCurrent = _x getVariable "GDGM_owner";
	private _garri = _x getVariable "GDGM_garrison";

	if(_ownerCurrent == _owner && _garri > _maxGarri) then {
		_found = true;
		_maxGarri = _garri;
		_maxNode = _x;
	};
} forEach _connectedNodes;

//si noeud trouvé, faire spawn les renforts, sinon envoyer helo
if(!_found) exitWith {[_pos, _owner] spawn GDGM_fnc_reinfHeliOnPos};

private _posFrom = _maxNode getVariable "GDGM_position";
private _nearbyRoads = [_posFrom select 0, _posFrom select 1] nearRoads 200;

if(count _nearbyRoads == 0) exitWith {[_pos, _owner] spawn GDGM_fnc_reinfHeliOnPos};

//spawn first
private _road = selectRandom _nearbyRoads;
private _info = getRoadInfo _road;
private _dir = (_info select 6) getDir (_info select 7);
_nearbyRoads = _nearbyRoads - [_road];
private _grp = createGroup [_owner ,true]; 
[getPosASL _road, _grp, _owner, _spawnedUnits, true, _dir] spawn GDGM_fnc_spawnTransport;
_wp = _grp addWaypoint [[_pos select 0, _pos select 1, 0], 100];
_wp setWaypointType "GETOUT";
_wp setWaypointBehaviour "AWARE";

//spawn second
private _road = selectRandom _nearbyRoads;
private _grp = createGroup [_owner ,true]; 
private _info = getRoadInfo _road;
private _dir = (_info select 6) getDir (_info select 7);
[getPosASL _road, _grp, _owner, _spawnedUnits, true, _dir] spawn GDGM_fnc_spawnTransport;
_wp = _grp addWaypoint [[_pos select 0, _pos select 1, 0], 100];
_wp setWaypointType "GETOUT";
_wp setWaypointBehaviour "AWARE";

//add spawned units to toNode
sleep 20;
private _previouslySpawned = _node getVariable "GDGM_spawnedObjects";
_node setVariable ["GDGM_spawnedObjects",_previouslySpawned + _spawnedUnits];