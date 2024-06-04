params["_leader", "_clientId", "_pos"];

private _side = side _leader;
private _reserves = [_side] call GDGM_fnc_getReserves;

if!([_pos, _side, _clientId] call GDGM_fnc_HCValidateSpawnPos) exitWith {systemChat "Invalid position"};

if(_reserves < 7) exitWith {"Not enough reserves, you need 7 reserves to spawn a squad" remoteExec ["systemChat", _clientId]};

private _grp = createGroup [_side, true];
[_pos, _grp, _side, [], 7, "NONE", true] spawn GDGM_fnc_spawnSquad;

sleep 5;

_leader hcSetGroup [_grp];
"Squad added to your High command menu (ctrl+space to open)" remoteExec ["systemChat", _clientId];
