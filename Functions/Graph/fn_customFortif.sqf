params["_logic"];

// half of the garri in fortif, rest in city

private _spawnPos = getpos _logic;
private _closestNode = [_spawnPos] call GDGM_fnc_findClosestNode;
private _owner = _closestNode getVariable "GDGM_owner";

// private _marker_object = createMarker [str _spawnPos, _spawnPos];
// _marker_object setMarkerTypeLocal "loc_Fortress";	
// _marker_object setMarkerTextLocal "fortif";

_fortif = createAgent ["logic", _spawnPos, [], 0, "form"];
_fortif setVariable ["GDGM_position",_spawnPos];
_fortif setVariable ["GDGM_type","fortification"];
_fortif setVariable ["GDGM_owner",_owner];
_fortif setVariable ["GDGM_spawnedObjects",[]];
_fortif setVariable ["GDGM_isSpawned",false];
_fortif setVariable ["GDGM_ownerNode",_closestNode];

//trigger 
_trg = createTrigger ["EmptyDetector", _spawnPos];	
_trg setVariable ["GDGM_installation", _fortif];
_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false];	
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_trg setTriggerTimeout [3,3,3,false];
//custom fortifications don't need to be on frontline to spawn
_trg setTriggerStatements ["this", " 
	if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_spawnInsta};
", "
	if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_despawnInsta};
"];
_trg setTriggerInterval 10;

_fortif setVariable ["GDGM_trigger",_trg];
GDGM_allFortif pushBack _fortif;

deleteVehicle _logic;