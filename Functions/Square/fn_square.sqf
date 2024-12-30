params["_Xcoord","_Ycoord"];

// 500*500 squares

private _square = createAgent ["logic", [0,0,0], [], 0, "form"];

private _markerName = ("square_" + str _Xcoord + str _Ycoord + str _square);
private _middleCoord = [_Xcoord * 500 + 250, _Ycoord * 500 + 250, 0];
private _color = "colorred";

private _closestNode = [_middleCoord] call GDGM_fnc_findClosestNode;
private _closestNodePos = _closestNode getVariable "GDGM_position";

//look if FOB closer than closestnode 
private _distWithClosestNode = _closestNodePos distance2D _middleCoord;

private _owner = _closestNode getVariable "GDGM_owner";

if([_middleCoord, _distWithClosestNode] call GDGM_fnc_isFOBWithinDist) then {
	_owner = GDGM_playerSide;
};

if(_owner == west) then {
	_color = "colorblue";
} else {
	if(_owner == resistance) then {
		_color = "colorgreen";
	}; 
};

_square setVariable ["GDGM_Xcoord",_Xcoord];
_square setVariable ["GDGM_Ycoord",_Ycoord];
_square setVariable ["GDGM_middle",_middleCoord];
_square setVariable ["GDGM_owner",_owner];
_square setVariable ["GDGM_markerName",_markerName];
_square setVariable ["GDGM_spawnedObjects",[]];
_square setVariable ["GDGM_isSpawned",false];
_square setVariable ["GDGM_type","frontline"];
_square setVariable ["GDGM_position",[0,0,0]]; // emplacement of the entrenchment


_marker_object = createMarker [_markerName, _middleCoord];
_marker_object setMarkerShape "RECTANGLE";
_marker_object setMarkersize [250, 250];
_marker_object setMarkerBrush "Solid";
_marker_object setMarkerColor _color;
_marker_object setMarkerAlpha 0.25;

_square;