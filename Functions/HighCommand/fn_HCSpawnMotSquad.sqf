params["_leader", "_clientId", "_pos"];

private _side = side _leader;
private _reserves = [_side] call GDGM_fnc_getReserves;
private _vehReserves = [_side] call GDGM_fnc_getVehReserves;

if!([_pos, _side, _clientId] call GDGM_fnc_HCValidateSpawnPos) exitWith {};

if(_vehReserves select 0 < 1) exitWith {"Your faction does not have any trucks" remoteExec ["systemChat", _clientId]};
if(_reserves < 7) exitWith {"Not enough reserves, you need 7 reserves to spawn a squad" remoteExec ["systemChat", _clientId]};

private _grp = createGroup [_side, true];
[_pos, _grp, _side, [], true, 0, true] spawn GDGM_fnc_spawnTransport;

sleep 5;

_leader hcSetGroup [_grp];
"Squad added to your High command menu (ctrl+space to open)" remoteExec ["systemChat", _clientId];
