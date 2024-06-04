private _allPlayers = call BIS_fnc_listPlayers;

private _res = ({(vehicle _x) isKindOf "plane"} count _allPlayers > 0);
_res;