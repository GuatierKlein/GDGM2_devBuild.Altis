GDGM_squareAmount = floor(worldSize / 500);
 
for [{private _i = 0}, {_i < GDGM_squareAmount}, {_i = _i + 1}] do {
	_squares = [];
	for [{private _y = 0}, {_y < GDGM_squareAmount}, {_y = _y + 1}] do {
		_square = [_y,_i] call GDGM_fnc_square;
		_squares pushBack _square;
	};
	GDGM_allSquares pushBack _squares;
};

[] call GDGM_fnc_frontLine;
 