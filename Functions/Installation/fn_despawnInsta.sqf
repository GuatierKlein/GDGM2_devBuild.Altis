params["_insta"];

private _objects = _insta getVariable "GDGM_spawnedObjects";

{
	deleteVehicle _x;	
	sleep 0.1;
} forEach _objects;

_insta setVariable ["GDGM_isSpawned", false];
_insta setVariable ["GDGM_spawnedObjects", []];

