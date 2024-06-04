params["_node","_side",["_underAttack",false], ["_ignoreEncircled", false]];

//_ignoreEncircled -> does not take ennemy nodes connected with only friendly encicled nodes

private _connectedNodes = _node getVariable "GDGM_connectedNodes";
private _res = false;

if(_ignoreEncircled) then {
	//ignore encicled
	if(_node getVariable "GDGM_owner" == _side) then {
		{	
			if(_x getVariable "GDGM_owner" != _side) then {
				_res = true;
				break;
			};	
		} forEach _connectedNodes;
	} else {
		{	
			if(_x getVariable "GDGM_owner" == _side && !(_x getVariable "GDGM_isEncircled")) then {
				_res = true;
				break;
			};	
		} forEach _connectedNodes;
	};
} else {
	//normal
	if(_node getVariable "GDGM_owner" == _side) then {
		{	
			if(_x getVariable "GDGM_owner" != _side) then {
				_res = true;
				break;
			};	
		} forEach _connectedNodes;
	} else {
		{	
			if(_x getVariable "GDGM_owner" == _side) then {
				_res = true;
				break;
			};	
		} forEach _connectedNodes;
	};
};


if(_underAttack && _node getVariable "GDGM_underAttack") then {
	_res = false;
};

// debug 
// if(_res) then {
// 	private _marker_object = createMarker [str (getPos _node), getPos _node];
// 	_marker_object setMarkerTypeLocal "mil_triangle";	
// 	_marker_object setMarkerTextLocal "frontline";
// 	_marker_object setMarkerColor "colorgreen";
// };

_res;