private _allPlayers = call BIS_fnc_listPlayers;

private _res = _allPlayers select {(vehicle _x) isKindOf "plane"};

systemChat "lalala";

if(count _res == 0) then {
	_res pushBack (selectRandom _allPlayers);
};
_res = selectRandom _res;

_res;