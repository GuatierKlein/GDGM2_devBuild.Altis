params["_square"];

private _owner = _square getVariable "GDGM_owner";
private _line = _square getVariable "GDGM_Ycoord";
private _column = _square getVariable "GDGM_Xcoord";
private _frontline = false;


if(_line > 0) then {
	//above
	private _neighbourOwner = ((GDGM_allSquares select (_line - 1)) select _column) getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_frontline = true;
	};
};

if(_column > 0 && !_frontline) then {
	//left
	private _neighbourOwner = ((GDGM_allSquares select _line) select (_column - 1)) getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_frontline = true;
	};
};

if(_line < GDGM_squareAmount - 1 && !_frontline) then {
	//below
	private _neighbourOwner = ((GDGM_allSquares select (_line + 1)) select _column) getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_frontline = true;
	};
};

if(_column < GDGM_squareAmount - 1 && !_frontline) then {
	//right
	private _neighbourOwner = ((GDGM_allSquares select _line) select (_column + 1)) getVariable "GDGM_owner";
	if(_neighbourOwner != _owner && _neighbourOwner != civilian) then {
		_frontline = true;
	};
};

_frontline;