params["_square"];

private _owner = _square getVariable "GDGM_owner";
private _line = _square getVariable "GDGM_Ycoord";
private _column = _square getVariable "GDGM_Xcoord";
private _res = [];


if(_line > 0) then {
	//above
	if(((GDGM_allSquares select (_line - 1)) select _column) getVariable "GDGM_owner" == _owner && [((GDGM_allSquares select (_line - 1)) select _column)] call GDGM_fnc_isFrontLine) then {
		_res pushBack ((GDGM_allSquares select (_line - 1)) select _column);
	};
};

if(_column > 0) then {
	//left
	if(((GDGM_allSquares select _line) select (_column - 1)) getVariable "GDGM_owner" == _owner && [((GDGM_allSquares select _line) select (_column - 1))] call GDGM_fnc_isFrontLine) then {
		_res pushBack ((GDGM_allSquares select _line) select (_column - 1));
	};
};

if(_line < GDGM_squareAmount) then {
	//below
	if(((GDGM_allSquares select (_line + 1)) select _column) getVariable "GDGM_owner" == _owner && [((GDGM_allSquares select (_line + 1)) select _column)] call GDGM_fnc_isFrontLine) then {
		_res pushBack ((GDGM_allSquares select (_line + 1)) select _column);
	};
};

if(_column < GDGM_squareAmount) then {
	//right
	if(((GDGM_allSquares select _line) select (_column + 1)) getVariable "GDGM_owner" == _owner && [((GDGM_allSquares select _line) select (_column + 1))] call GDGM_fnc_isFrontLine) then {
		_res pushBack ((GDGM_allSquares select _line) select (_column + 1));
	};
};

_res;