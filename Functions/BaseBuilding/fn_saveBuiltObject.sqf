params ["_object","_id"];

private _pos = getPosASL _object;
private _dir = getDir _object;
private _type = typeOf _object;
private _disableSim = !(simulationEnabled _object);
private _speType = _object getVariable ["GDGM_speType", ""];

GDGM_builtObjectsSave pushBack [_type,_pos,_dir,_disableSim,_speType];

(_type + " added to save! (you need to save the mission for this action to be effective)") remoteExec ["systemChat",_id];

if(_speType == "hq") then {
    if(_pos distance2D (([_pos] call GDGM_fnc_findClosestNode) getVariable "GDGM_position") < 500) exitWith {};

    //créer un node ici, ça ne devrait rien changer car il ne sera pas dans le graphe
    private _location = createLocation ["NameCity", _pos, 1, 1];	
    _location setText "FOB";

    if((locationPosition _location) inArea "GDGM_blackList_marker" 
            || (locationPosition _location) inArea "GDGM_blackList_marker_1" 
            || !((locationPosition _location) inArea "GDGM_AO")) 
    exitWith {};

    private _node = [_location, GDGM_playerSide] call GDGM_fnc_cityNode;
    GDGM_allNodes pushBack _node;
    GDGM_civiNodes pushBack _node;
    GDGM_customLocationsPositions pushBack _pos;
};
