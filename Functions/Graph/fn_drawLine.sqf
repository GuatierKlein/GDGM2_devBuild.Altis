params["_pos1","_pos2",["_color","colorred"]];

//put points in the right order
if(_pos1 select 1 > _pos2 select 1) then {
	private _posTemp = _pos1;
	_pos1 = _pos2;
	_pos2 = _posTemp;
};

//draw
_middle = [((_pos1 select 0) + (_pos2 select 0)) / 2, ((_pos1 select 1) + (_pos2 select 1)) / 2, ((_pos1 select 2) + (_pos2 select 2)) / 2];
_length = _pos1 distance2D _pos2;
_dirVector = [(_pos1 select 0) - (_pos2 select 0), (_pos1 select 1) - (_pos2 select 1)];
_cos = [1,0] vectorCos _dirVector;
_dir = acos _cos;
_name = str _pos1 + str _pos2 + "_line";

_marker_object = createMarker [_name , _middle];
_marker_object setMarkerShape "RECTANGLE";
_marker_object setMarkersize [_length / 2, 10];
_marker_object setMarkerBrush "Solid";
_marker_object setMarkerColor _color;
// _marker_object setMarkerAlpha 0.8;
_marker_object setMarkerDir _dir;

GDGM_lineMarkers pushBack _name;