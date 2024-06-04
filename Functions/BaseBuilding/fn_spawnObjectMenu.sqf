systemChat "Spawning object!";
_index = lbCurSel 190411;
_object = (GDGM_defenses_array select _index) select 0;
_cost = (GDGM_defenses_array select _index) select 1;
_disableSim = (GDGM_defenses_array select _index) select 2;


_display = findDisplay 19041;
_unit = _display getVariable "GDGM_unit_building";	

_id = clientOwner;

if(count (GDGM_defenses_array select _index) < 4) then {
	[_object,_unit,_id,_cost,_disableSim] remoteExec ["GDGM_fnc_spawnBuildObject",2]; 
} else {
	_type = (GDGM_defenses_array select _index) select 3;
	[_object,_unit,_id,_cost,_disableSim,_type] remoteExec ["GDGM_fnc_spawnBuildObject",2]; 
};

closeDialog 0;