params["_node"];

private _connectedNodes = _node getVariable "GDGM_connectedNodes";
private _owner = _node getVariable "GDGM_owner";
private _res = false;

{	
	if(_x getVariable "GDGM_owner" != _owner) then {
		_res = true;
		break;
	};	
} forEach _connectedNodes;

// debug 
// if(_res) then {
// 	private _marker_object = createMarker [str (getPos _node), getPos _node];
// 	_marker_object setMarkerTypeLocal "mil_triangle";	
// 	_marker_object setMarkerTextLocal "frontline";
// 	_marker_object setMarkerColor "colorgreen";
// };

_res;