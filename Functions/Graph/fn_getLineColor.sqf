params["_side1","_side2"];

_color = "colorred";

if(_side1 == west && _side2 == west) then {
	_color = "colorblue";
};

if(_side1 == resistance && _side2 == resistance) then {
	_color = "colorgreen";
};

if(_side1 != _side2) then {
	_color = "colororange";
};

_color;