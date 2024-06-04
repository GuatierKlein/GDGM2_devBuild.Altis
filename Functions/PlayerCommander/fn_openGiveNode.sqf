//clientside
params["_side"];
openMap true;
// systemChat "Click on the map to choose the spawn position";

GDGM_tpMapClickEH = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if(!_mapIsOpened) then {
		onMapSingleClick "";
		removeMissionEventHandler ["Map", _thisEventHandler];
		systemChat "Spawn canceled";
	};
}];

private _code = "[_pos, '" + _side + "'] remoteExec['GDGM_fnc_giveNode',2]";
onMapSingleClick (_code + "; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_tpMapClickEH]; openMap false; true");

