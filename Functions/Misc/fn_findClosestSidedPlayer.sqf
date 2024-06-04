params ["_pos","_side"];

private _players = allPlayers - entities "HeadlessClient_F";
private _res = _players select 0;
private _minDist = _pos distanceSqr _res;

{
	private _dist = _pos distanceSqr _x;
	if(_dist < _minDist) then {
		_minDist = _dist;
		_res = _x;
	};
} forEach _players;

_res;