GDGM_AOUpperLeftPos = [];
GDGM_AODownRightPos = [];
GDGM_exitFunction = false;

openMap true;
systemChat "Click on the map to set upper left corner of the AO";

GDGM_setAOClickEH = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if(!_mapIsOpened) then {
		onMapSingleClick "";
		removeMissionEventHandler ["Map", _thisEventHandler];
		systemChat "AO canceled";

		GDGM_exitFunction = true;
	};
}];

private _code = "GDGM_AOUpperLeftPos = _pos;";
onMapSingleClick (_code + "; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_setAOClickEH]; true");
waitUntil{count GDGM_AOUpperLeftPos != 0 || GDGM_exitFunction};
if(GDGM_exitFunction) exitWith {};

createMarkerLocal ["GDGM_AOupperLeftMarker", GDGM_AOUpperLeftPos];
"GDGM_AOupperLeftMarker" setMarkerTypeLocal "hd_dot";
systemChat "Upper Left Selected";
systemChat "Click on the map to set down right corner of the AO";


_code = "GDGM_AODownRightPos = _pos;";
onMapSingleClick (_code + "; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_setAOClickEH]; openMap false; true");
waitUntil{count GDGM_AODownRightPos != 0 || GDGM_exitFunction};
if(GDGM_exitFunction) exitWith {};
// createMarkerLocal ["GDGM_AODownRightMarker", GDGM_AODownRightPos];
// "GDGM_AODownRightMarker" setMarkerTypeLocal "hd_dot";
// "GDGM_AODownRightMarker" setMarkerTextLocal "Down right";
systemChat "Down Right Selected";

deleteMarkerLocal "GDGM_AOupperLeftMarker";

[GDGM_AOUpperLeftPos, GDGM_AODownRightPos] remoteExec ["GDGM_fnc_setAO", 2];