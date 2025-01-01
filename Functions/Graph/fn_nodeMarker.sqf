params["_node"];

private _pos = _node getVariable "GDGM_position";

private _name = _node getVariable "GDGM_name";
// private _garrison =  str (_node getVariable "GDGM_garrison");
private _text = "";
private _shape = "";
private _type = _node getVariable "GDGM_type";

switch (_type) do {
	case "civilian": {
		_pos = _pos vectorAdd [0,-50,0];
		// _text = _name + ": " + _garrison;
		_text = _name;
		_shape = "mil_triangle";
	};
	case "supply": {
		_text = _name;
		_shape = "mil_box";
	};

	case "fob": {
		_text = _name;
		_shape = "loc_Bunker";
	};

	case "entry": {
		_text = _name;
		_shape = "mil_start";
	};
	default { };
};

if(_node getVariable "GDGM_isEncircled") then {
	_text = _text + " (ENCIRCLED)";
};


private _marker_object = _node getVariable "GDGM_markerName";
createMarker [_marker_object, _pos];

//color
if(_node getVariable "GDGM_owner" == east ) then {
	_marker_object setMarkerColorLocal "Colorred";
};
if(_node getVariable "GDGM_owner" == west ) then {
	_marker_object setMarkerColorLocal "Colorblue";
};
if(_node getVariable "GDGM_owner" == resistance ) then {
	_marker_object setMarkerColorLocal "Colorgreen";
};

if(_node getVariable "GDGM_owner" == civilian ) then {
	_marker_object setMarkerColorLocal "Coloryellow";
};

_marker_object setMarkerTypeLocal _shape;
_marker_object setMarkerText _text;