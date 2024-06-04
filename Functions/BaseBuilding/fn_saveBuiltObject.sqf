params ["_object","_id"];

private _pos = getPosASL _object;
private _dir = getDir _object;
private _type = typeOf _object;
private _disableSim = !(simulationEnabled _object);
private _speType = _object getVariable ["GDGM_speType", ""];

GDGM_builtObjectsSave pushBack [_type,_pos,_dir,_disableSim,_speType];

(_type + " added to save! (you need to save the mission for this action to be effective)") remoteExec ["systemChat",_id];