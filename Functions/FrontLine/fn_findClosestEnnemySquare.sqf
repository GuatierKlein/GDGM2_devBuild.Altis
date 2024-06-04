params["_square"];

private _owner = _square getVariable "GDGM_owner";
private _line = _square getVariable "GDGM_Ycoord";
private _column = _square getVariable "GDGM_Xcoord";
private _res = [];


if(_line > 0) then {
	//above
	private _neighbour = (GDGM_allSquares select (_line - 1)) select _column;
	private _neighbourOwner = _neighbour getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_res pushBack _neighbour;
	};
};

if(_column > 0) then {
	//left
	private _neighbour = (GDGM_allSquares select _line) select (_column - 1);
	private _neighbourOwner = _neighbour getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_res pushBack _neighbour;
	};
};

if(_line < GDGM_squareAmount - 1) then {
	//below
	private _neighbour = (GDGM_allSquares select (_line + 1)) select _column;
	private _neighbourOwner = _neighbour getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_res pushBack _neighbour;
	};
};

if(_column < GDGM_squareAmount - 1) then {
	//right
	private _neighbour = (GDGM_allSquares select _line) select (_column + 1);
	private _neighbourOwner = _neighbour getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_res pushBack _neighbour;
	};
};

selectRandom _res;