//update supply points 
{
	private _ownerNode = (_x getVariable "GDGM_connectedNodes") select 0;
	_x setVariable ["GDGM_owner", _ownerNode getVariable "GDGM_owner"];
} forEach GDGM_supplyNodes;

//update insta
{
	private _ownerNode = _x getVariable "GDGM_ownerNode";
	_x setVariable ["GDGM_owner", _ownerNode getVariable "GDGM_owner"];
} forEach GDGM_allFortif;

//update encirclement 
call GDGM_fnc_updateEncircle;

//update node colors 
{
	[_x] call GDGM_fnc_nodeMarker;
} forEach GDGM_allNodes;

//update lines 
{
	deleteMarker _x;	
} forEach GDGM_lineMarkers;

{
	private _y = _x;
	private _nodes = _y getVariable "GDGM_connectedNodes";
	private _YSide = _y getVariable "GDGM_owner";
	{
		private _XSide = _x getVariable "GDGM_owner";
		private _color = [_XSide,_YSide] call GDGM_fnc_getLineColor;
		[_y getVariable "GDGM_position", _x getVariable "GDGM_position",_color] call GDGM_fnc_drawLine;
	} foreach _nodes;	
} forEach GDGM_allNodes;



