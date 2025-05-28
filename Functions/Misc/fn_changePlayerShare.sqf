private _playerShare = sliderPosition 250511;

[missionNamespace, "GDGM_player_incomeShare", _playerShare] call BIS_fnc_setServerVariable;

//chat log									
_msg = "Changed player share to " + str _playerShare;
_msg remoteExec ["systemChat",0];
