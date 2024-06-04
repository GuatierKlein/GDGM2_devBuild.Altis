params["_pos", "_client"];

private _reserve = [GDGM_intelPlayerSide] call GDGM_fnc_getReserves;

if(GDGM_isPlayerReconning) exitWith {"You are already doing a recon mission." remoteExec ["systemChat",_client];};
if(_reserve < 8) exitwith {"Not enough reserves" remoteExec ["systemChat",_client];};

GDGM_isPlayerReconning = true;

private _closeNodes = [_pos, 1000] call GDGM_fnc_findCLoseNodes;
private _closeSquares = [_pos, 1000] call GDGM_fnc_getSquaresWithinDist;

[GDGM_intelPlayerSide, -8] call GDGM_fnc_addReserves;
[GDGM_intelPlayerSide, -20] call GDGM_fnc_addPoints;
["GDGM_reconParty_go"] remoteExec["BIS_fnc_showNotification", 0];

sleep 600;
GDGM_isPlayerReconning = false;

if(random 1 > 0.66) exitWith {
	["GDGM_reconParty_failure"] remoteExec["BIS_fnc_showNotification", 0];
};

//frontline
{
	private _owner = _x getVariable "GDGM_owner";

	if(_owner == GDGM_intelPlayerSide) then {
		continue;
	};

	private _position = _x getVariable "GDGM_position";
	private _isFrontline = [_x, GDGM_intelPlayerSide] call GDGM_fnc_isSidedFrontLine;
	
	if(!_isFrontline || random 1 > 0.5 || ((_position select 0) == 0 && (_position select 1) == 0)) then {
		continue;
	};

	[_position, _owner, "Frontline position"] call GDGM_fnc_createIntel;
} forEach _closeSquares;

//nodes
{
	private _owner = _x getVariable "GDGM_owner";
	private _ownerNode = _x getVariable "GDGM_ownerNode";
	if(_owner == GDGM_intelPlayerSide || !(_ownerNode in _closeNodes) || random 1 > 0.5) then {
		continue;
	};

	private _pos = _x getVariable "GDGM_position";

	[_pos, _owner, "Entrenched position"] call GDGM_fnc_createIntel;
	
} forEach GDGM_allFortif;

["GDGM_reconParty_success"] remoteExec["BIS_fnc_showNotification", 0];
[GDGM_intelPlayerSide, 8] call GDGM_fnc_addReserves;