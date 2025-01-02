"Updating fobs..." remoteExec ["systemChat",0];

{
	private _pos = getPosASL _x;
	if(_pos distance2D (([_pos] call GDGM_fnc_findClosestNode) getVariable "GDGM_position") < 500) then {continue};

    private _location = createLocation ["NameCity", _pos, 1, 1];	
    _location setText "";

    if((locationPosition _location) inArea "GDGM_blackList_marker" 
            || (locationPosition _location) inArea "GDGM_blackList_marker_1" 
            || !((locationPosition _location) inArea "GDGM_AO")) 
    then { continue};

    private _node = [_location, GDGM_playerSide] call GDGM_fnc_FOBNode;
    [_node] call GDGM_fnc_nodeMarker;
    GDGM_allNodes pushBack _node;
    GDGM_strategicNodes pushBack _node;
    GDGM_customLocationsPositions pushBack _pos;
	
} forEach GDGM_playerFOBs;

"Fobs updated" remoteExec ["systemChat",0];