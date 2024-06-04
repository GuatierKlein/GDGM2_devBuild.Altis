createDialog "dialogAttackSelect";

private _side = side player;
GDGM_clientPoints = -1;
GDGM_clientReserves = -1;
//display supplies
[_side, clientOwner] remoteExecCall["GDGM_fnc_sendPoints",2];
[_side, clientOwner] remoteExecCall["GDGM_fnc_sendReserves",2];

waitUntil { (GDGM_clientPoints != -1 && GDGM_clientReserves != -1) || !dialog };

if(!dialog) exitWith {};
ctrlSetText [190213, str GDGM_clientPoints];
ctrlSetText [190214, str GDGM_clientReserves];

//display bg
{
	lbAdd [190211,((_x select 3) + ": (" + str (_x select 1) + ", " + str (_x select 2) + ")")];
} foreach GDGM_battlegroupPool;

//TODO  GDGM_fnc_playerPrepareAttack sur server
[_side] onMapSingleClick "[_pos, _this select 0, lbCurSel 190211, clientOwner] remoteExec ['GDGM_fnc_playerPrepareAttack',2]; true";



waitUntil { !dialog };
onMapSingleClick "";