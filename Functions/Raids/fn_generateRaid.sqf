params["_side"];

//exit if no player in side 
// if({side _x == _side} count allPlayers == 0) exitWith {};

//find random ennemy node 
private _eligibleNodes = [];
{
	if(_x getVariable "GDGM_owner" == _side || _x getVariable "GDGM_underAttack") then {continue};
	_eligibleNodes pushBack _x;
} forEach GDGM_civiNodes;

private _node = selectRandom _eligibleNodes;

//create raid on it 
private _functions = [GDGM_fnc_generateConvoyAmbush, GDGM_fnc_generateAssassination, GDGM_fnc_generateStealIntel];
[_side, _node] spawn (selectRandom _functions);


