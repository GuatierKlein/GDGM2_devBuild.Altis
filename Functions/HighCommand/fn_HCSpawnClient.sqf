//clientside
params["_type"];
openMap true;
systemChat "Click on the map to choose the spawn position";

GDGM_tpMapClickEH = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if(!_mapIsOpened) then {
		onMapSingleClick "";
		removeMissionEventHandler ["Map", _thisEventHandler];
		systemChat "Spawn canceled";
	};
}];

private _code = "";

switch (_type) do {
	case "squad": { _code = " [player, clientOwner, _pos] remoteExec['GDGM_fnc_HCSpawnSquad',2]" };
	case "motSquad": {_code = " [player, clientOwner, _pos] remoteExec['GDGM_fnc_HCSpawnMotSquad',2]" };
	case "lightVeh": {_code = " [player, clientOwner, _pos] remoteExec['GDGM_fnc_HCSpawnLightVeh',2]" };
	case "apc": {_code = " [player, clientOwner, _pos] remoteExec['GDGM_fnc_HCSpawnAPC',2]" };
	case "tank": {_code = " [player, clientOwner, _pos] remoteExec['GDGM_fnc_HCSpawnTank',2]" };
	default { };
};

onMapSingleClick (_code + "; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_tpMapClickEH]; openMap false; true");

