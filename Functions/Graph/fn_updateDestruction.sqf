{
	private _trg = _x getVariable "GDGM_trigger";
	
	if!(triggerActivated _trg) then {
		private _destruction = _x getVariable "GDGM_destructionAmount";
		private _houses = [_x getVariable "GDGM_position"] call GDGM_fnc_getOpenedHouses;
		[_houses, _destruction] spawn GDGM_fnc_destroyTown;
	};
} forEach GDGM_destructionUpdateQueue;

GDGM_destructionUpdateQueue = [];