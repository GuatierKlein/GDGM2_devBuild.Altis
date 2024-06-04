params["_pos","_amount","_radius"];

private _res = [];
private _tmpPos = [];
private _patrolPoint = [];
private _offset = floor(random 360);

for [{private _i = 0}, {_i < _amount}, {_i = _i + 1}] do {
	_tmpPos = _pos getPos [_radius,((_i * (360 / _amount)) + _offset) % 360];

	_patrolPoint = [ 
		_tmpPos, //trouver une pos sure
		0, //min dist
		200, //max dist
		3, //object dist
		0, //water mode 0=no water
		0.4, //max grad between 0 and 1
		0, 
		[], 
	[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;

	if(_patrolPoint select 0 == 0 && _patrolPoint select 1 == 0) then {continue};

	// private _marker_object = createMarker [str _patrolPoint, _patrolPoint];
	// _marker_object setMarkerTypeLocal "mil_box";	
	// _marker_object setMarkerTextLocal "patrol";

	_res pushBack _patrolPoint;
};

_res;
