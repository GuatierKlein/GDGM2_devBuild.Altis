params["_node"];

private _markerName = _node getVariable "GDGM_markerName";
private _name = _node getVariable "GDGM_name";
private _garri = _node getVariable "GDGM_garrison";
private _text = _name + ": " + str _garri;
_markerName setMarkerText _text;