params["_nodes",["_color","colorblack"],["_text",""]];

{
	private _marker_object = createMarker [str _x, _x getVariable "GDGM_position"];
	_marker_object setMarkerTypeLocal "mil_triangle";	
	_marker_object setMarkerTextLocal _text;
	_marker_object setMarkerColor _color;
} forEach _nodes;