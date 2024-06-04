//clientside
openMap true;
systemChat "Click on the map to choose the position to recon";

GDGM_tpMapClickEH = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if(!_mapIsOpened) then {
		onMapSingleClick "";
		removeMissionEventHandler ["Map", _thisEventHandler];
		systemChat "Spawn canceled";
	};
}];

private _code = "[_pos, clientOwner] remoteExec['GDGM_fnc_reconParty',2]";

onMapSingleClick (_code + "; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_tpMapClickEH]; openMap false; true");

