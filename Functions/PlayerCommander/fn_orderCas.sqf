//clientside
_adj_pos = [0,0,0];

//check points 
private _varName = "";
private _cost = 0;
private _casOk = false;

switch (side player) do {
	case west: { _varName = "GDGM_BLUFOR_supplies" };
	case east: { _varName = "GDGM_OPFOR_supplies" };
	case independent: { _varName = "GDGM_IND_supplies" };
	default { };
};

//arty fire
private _type = lbCurSel 190616;
private _tot = ctrlText 190615;
_tot = parseNumber _tot;
_tot = 0 max _tot; 
_tot = 10 min _tot; 

_type = ["fighter", "cas", "helo"] select _type;
private _indexReserve = 0;

switch (_type) do {
	case "fighter": { _indexReserve = 4 };
	case "cas": { _indexReserve = 4 };
	case "helo": { _indexReserve = 3 };
};

private _availablePoints = [missionNamespace, _varName, 0] call BIS_fnc_getServerVariable;
private _availablePointsPlayer = [missionNamespace, "GDGM_player_supplies", 0] call BIS_fnc_getServerVariable;
private _isCasAvailableEast = [missionNamespace, "GDGM_isCASFree_east", false] call BIS_fnc_getServerVariable;
private _isCasAvailableWest = [missionNamespace, "GDGM_isCASFree_west", false] call BIS_fnc_getServerVariable;
private _isCasAvailableInd = [missionNamespace, "GDGM_isCASFree_ind", false] call BIS_fnc_getServerVariable;
private _vehReservesEast = [missionNamespace, "GDGM_OPFOR_vehReserves", [0,0,0,0,0]] call BIS_fnc_getServerVariable;
private _vehReservesWest = [missionNamespace, "GDGM_BLUFOR_vehReserves", [0,0,0,0,0]] call BIS_fnc_getServerVariable;
private _vehReservesInd = [missionNamespace, "GDGM_IND_vehReserves", [0,0,0,0,0]] call BIS_fnc_getServerVariable;

switch (side player) do {
	case west: { _casOk = _isCasAvailableWest && (_vehReservesWest select _indexReserve) > 0};
	case east: { _casOk = _isCasAvailableEast && (_vehReservesEast select _indexReserve) > 0 };
	case independent: { _casOk = _isCasAvailableInd && (_vehReservesInd select _indexReserve) > 0 };
};

if(_availablePoints + _availablePointsPlayer + _cost < 0) exitWith {
	hint "Pas assez de points logistiques";
};

//recup la pos grid
_x_coord = ctrlText 190613;
_y_coord = ctrlText 190614;

_pos_grid = _x_coord + _y_coord;

_realPosition = _pos_grid call BIS_fnc_gridToPos;

_pos = _realPosition select 0;
_pos_real = [_pos select 0,_pos select 1,0];
_commander = [side player] call GDGM_fnc_getCommander;

if (_tot != 0 && _x_coord != "000" && _y_coord != "000") then {
	// [player, getMissionPath "Sounds\Voices\arty_request.ogg"] remoteExec ["say3D", 0];
	player sideRadio "radio_airsupport_request";
	[player,"Requesting air support at grid " + _pos_grid] remoteExec ["globalChat",0];
	sleep 20;
	[west, "Base"] sideRadio "radio_airsupport_standby";
	[_commander,"Roger that " + name player + ", contacting air forces in the region"] remoteExec ["globalChat",0];
	sleep 40;

	//check if cas is available
	if (!_casOk) exitWith {
		[_commander,"Air support is unavailable at the moment, over."] remoteExec ["globalChat",0];
		[west, "Base"] sideRadio "radio_airsupport_denied";
	};

	//supply cost
	["player", _cost] remoteExec["GDGM_fnc_addPoints", 2];
	[west, "Base"] sideRadio "radio_airsupport_ok";
	[_commander,"Air support on the way to your location, hang tight, over."] remoteExec ["globalChat",0];

	//spawn air support
	[ _pos_real, side player, _type, _tot * 60, true] remoteExec ["GDGM_fnc_airSupport", 2];
} else {
	systemChat "Shots and coordinates can't be 0";	
};



