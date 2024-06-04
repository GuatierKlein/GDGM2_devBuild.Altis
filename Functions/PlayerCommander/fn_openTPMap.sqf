//clientside
openMap true;
systemChat "Click on the map to teleport";

GDGM_tpMapClickEH = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if(!_mapIsOpened) then {
		onMapSingleClick "";
		removeMissionEventHandler ["Map", _thisEventHandler];
		systemChat "Teleport canceled";
	};
}];

onMapSingleClick "[_pos, player, clientOwner] remoteExec ['GDGM_fnc_tpToFriendlyTown',2]; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_tpMapClickEH]; openMap false; true";

