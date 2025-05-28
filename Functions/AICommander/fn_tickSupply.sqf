{
	private _owner = _x getVariable "GDGM_owner";
	if(_owner == GDGM_playerSide) then {
		// Player side, add player income share
		["player", GDGM_supplyPointRevenue * GDGM_player_incomeShare] call GDGM_fnc_addPoints;
		[_owner, GDGM_supplyPointRevenue * (1 - GDGM_player_incomeShare)] call GDGM_fnc_addPoints;
	} else {
		// AI side, add full income
		[_owner, GDGM_supplyPointRevenue] call GDGM_fnc_addPoints;
	};
} forEach GDGM_supplyNodes;

["GDGM_resupplied"] remoteExec["BIS_fnc_showNotification", 0];

{
	private _owner = _x getVariable "GDGM_owner";
	if(_owner == GDGM_playerSide) then {
		// Player side, add player income share
		["player", GDGM_strategicNodesRevenue * GDGM_player_incomeShare] call GDGM_fnc_addPoints;
		[_owner, GDGM_strategicNodesRevenue * (1 - GDGM_player_incomeShare)] call GDGM_fnc_addPoints;
	} else {
		[_owner, GDGM_strategicNodesRevenue] call GDGM_fnc_addPoints;	
	};
} forEach GDGM_strategicNodes;