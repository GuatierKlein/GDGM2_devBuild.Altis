createDialog "dialogPlayerShare";

private _playerShare = [missionNamespace, "GDGM_player_incomeShare", 0] call BIS_fnc_getServerVariable;

sliderSetRange [250511,0,1];
sliderSetPosition [250511, _playerShare];

while {dialog} do {
	private _playerShare = sliderPosition 250511; 											
	ctrlSetText [250512, str _playerShare];
};

