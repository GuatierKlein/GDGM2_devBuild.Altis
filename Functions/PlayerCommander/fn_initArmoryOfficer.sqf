
//supply officer
if(isNil "GDGM_armoryOfficer") exitWith {};

[[GDGM_armoryOfficer], "scripts/kit_select/kitSelectAction.sqf"] remoteExec ["execVM", 0];
[[GDGM_armoryOfficer], "scripts/tp/tp_action.sqf"] remoteExec ["execVM", 0];