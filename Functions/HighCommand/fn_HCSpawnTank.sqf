params["_leader", "_clientId", "_pos"];

private _side = side _leader;
private _reserves = [_side] call GDGM_fnc_getReserves;
private _vehReserves = [_side] call GDGM_fnc_getVehReserves;

if!([_pos, _side, _clientId] call GDGM_fnc_HCValidateSpawnPos) exitWith {};

if(_vehReserves select 2 < 1) exitWith {"Your faction does not have any tanks" remoteExec ["systemChat", _clientId]};
if(_reserves < 2) exitWith {"Not enough reserves, you need 2 reserves to spawn a tank" remoteExec ["systemChat", _clientId]};

private _grp = createGroup [_side, true];
[_pos, _grp, _side, [], 0, true] spawn GDGM_fnc_spawnTank;

sleep 5;

_leader hcSetGroup [_grp];
"Tank added to your High command menu (ctrl+space to open)" remoteExec ["systemChat", _clientId];
