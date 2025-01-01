params["_node"];

private _pos = _node getVariable "GDGM_position";
private _groups = _node getVariable "GDGM_reinfGroups";

{
	//delete waypoints
	for "_i" from (count waypoints _x - 1) to 0 step -1 do
	{
		deleteWaypoint [_x, _i];
	};
	sleep 1;

	//call back
	_wp = _x addWaypoint [[_pos select 0, _pos select 1, 0], 50];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setwaypointcombatmode "YELLOW"; 
	_wp setWaypointCompletionRadius 50;
} forEach _groups;