{
	private _owner = _x getVariable "GDGM_owner";
	[_owner, GDGM_supplyPointRevenue] spawn GDGM_fnc_addPoints;
} forEach GDGM_supplyNodes;

["GDGM_resupplied"] remoteExec["BIS_fnc_showNotification", 0];

{
	private _owner = _x getVariable "GDGM_owner";
	[_owner, GDGM_strategicNodesRevenue] call GDGM_fnc_addPoints;	
} forEach GDGM_strategicNodes;