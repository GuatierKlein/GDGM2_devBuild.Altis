params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

//message
private _side = _oldUnit getVariable "GDGM_side";
private _msg = (name _oldUnit) + " was killed by " + (name _killer) + ", removing 1 reserve from " + ([_side] call GDGM_fnc_getFactionName);
_msg remoteExec ["systemChat",0];

//reserves
["player", -1] remoteExec ["GDGM_fnc_addReserves", 2];

//killer morale buff 
if(side _killer != _side) then {
	[side _killer, 1] remoteExec ["GDGM_fnc_addMoraleOffset", 2];
};