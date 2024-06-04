params["_obj"];

_obj setVariable ["GDGM_speType", "ammo", true];

private _pos = getPosASL _obj;
private _markerName = "ammo" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "Ammo box";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_dot";

clearItemCargoGlobal _obj;
clearWeaponCargoGlobal _obj;
clearMagazineCargoGlobal _obj;

[[_obj], "Scripts\kit_select\kitSelectAction.sqf"] remoteExec ["execVM",0];