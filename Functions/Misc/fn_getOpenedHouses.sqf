params["_pos",["_distance", GDGM_nodeScanSpawnRadius], ["_ignoreDestoyed", false]];

private _housesRaw = nearestTerrainObjects [_pos, ["house"], _distance, false , true];
private _houses = [_housesRaw, [], {count (_x buildingPos -1)}, "DESCEND", {count (_x buildingPos -1) != 0 && (_ignoreDestoyed || damage _x < 0.5)}] call BIS_fnc_sortBy;

_houses;