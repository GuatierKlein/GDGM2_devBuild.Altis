"Saving game..." remoteExec ["systemChat",0];

private _nodeSave = []; //[pos, garri, owner, type]
private _pointsSave = []; //[east, west, independant]
private _commanderSave = []; //[east, west, independant]
private _divisionSave = []; //[model, reserves]
private _save = [];

//points
private _deployedReserves = [] call GDGM_fnc_getDeployedReservesPoints;
{
	private _reserves = [_x] call GDGM_fnc_getReserves;
	private _currentDeployedReserves = _deployedReserves select _forEachIndex;
	_pointsSave pushBack ([[_x] call GDGM_fnc_getPoints, _reserves + _currentDeployedReserves, (_deployedReserves select 3) select _forEachIndex]);	
} forEach [east, west, independent];

//commander style
{
	_commanderSave pushBack ([_x] call GDGM_fnc_getCommanderStyle);	
} forEach [east, west, independent];

//nodes
{
	private _pos = _x getVariable "GDGM_position";
	private _garri = _x getVariable "GDGM_garrison";
	private _owner = _x getVariable "GDGM_owner";
	private _type = _x getVariable "GDGM_type"; 
	private _destuction = _x getVariable "GDGM_destructionAmount";

	if(_type != "civilian") then {continue};
	
	_nodeSave pushBack [_pos, _garri, _owner, _type, _destuction];
} forEach GDGM_allNodes;

//divisions
{
	private _division = GDGM_allDivisions get _x;
	private _model = _division get "model";
	private _reserves = _division get "reserves";
	_divisionSave pushBack [_model, _reserves];
} forEach (keys GDGM_allDivisions);

_save = [_pointsSave, _nodeSave, _commanderSave, GDGM_builtObjectsSave, _divisionSave];

//save to profile 
profileNamespace setVariable [missionName, _save];
saveProfileNamespace;
"Gamed saved!" remoteExec ["systemChat",0];