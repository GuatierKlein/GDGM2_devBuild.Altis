params["_node"];

private _pos = _node getVariable "GDGM_position";
private _groups = _node getVariable "GDGM_instaGroups";

{
	//enableAI
	{
		_x enableAI "PATH";
		_x setUnitPos "AUTO";
		
	} forEach units _x;

	//call back
	_wp = _x addWaypoint [[_pos select 0, _pos select 1, 0], 50];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setwaypointcombatmode "YELLOW"; 
	_wp setWaypointCompletionRadius 50;
} forEach _groups;