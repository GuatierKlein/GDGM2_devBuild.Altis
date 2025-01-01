params["_trigger","_list"];

/*
runs on condition of triggers and determines whether to return true and spawn or false and despawn 
ex: this && [thisTrigger] call GDGM_fnc_spawnNodeCondition;
!!! do not care about player presence, -> handled by the trigger
*/

private _node = _trigger getVariable "GDGM_installation";
private _underAttack = _node getVariable "GDGM_underAttack";
private _res = false;

if(_underAttack) then {
	_res = true;
};

_res;

