params["_pos", "_ennemySide", "_text"];

private _markerName = "intel_" + str _pos;
private _markerType = "";

switch (_ennemySide) do {
	case east: { _markerType = "o_inf" };
	case west: { _markerType = "b_inf" };
	case independent: { _markerType = "n_inf" };
};

createMarker [_markerName, _pos];
_markerName setMarkerType _markerType;
_markerName setMarkerText _text;