//increment raid 
GDGM_planeRaid_nb = GDGM_planeRaid_nb + 1;

//find random ennemy node 
private _eligibleNodes = [];
{
	if(_x getVariable "GDGM_owner" == GDGM_planeModePlayerSide || _x getVariable "GDGM_underAttack") then {continue};
	_eligibleNodes pushBack _x;
} forEach GDGM_civiNodes;

private _node = selectRandom _eligibleNodes;

[GDGM_planeModePlayerSide, _node] spawn (selectRandom [GDGM_fnc_planeRaid_AmmoDepot, GDGM_fnc_planeRaid_AmmoDepot, GDGM_fnc_planeRaid_bomberSquadron, GDGM_fnc_planeRaid_fighterSquadron]);
