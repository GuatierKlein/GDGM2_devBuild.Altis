//clientside
_adj_pos = [0,0,0];

//check points 
private _varName = "";
private _cost = 20; //cost of supply drop

switch (side player) do {
	case west: { _varName = "GDGM_BLUFOR_supplies" };
	case east: { _varName = "GDGM_OPFOR_supplies" };
	case independent: { _varName = "GDGM_IND_supplies" };
	default { };
};

//arty fire
private _availablePoints = [missionNamespace, _varName, 0] call BIS_fnc_getServerVariable;
private _availablePointsPlayer = [missionNamespace, "GDGM_player_supplies", 0] call BIS_fnc_getServerVariable;

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

if (_x_coord != "000" && _y_coord != "000") then {
	player sideRadio "radio_airsupport_request";
	[player,"Requesting a supply drop at grid " + _pos_grid] remoteExec ["globalChat",0];
	sleep 20;
	[west, "Base"] sideRadio "radio_airsupport_standby";
	[_commander,"Roger that " + name player + ", contacting air forces in the region"] remoteExec ["globalChat",0];
	sleep 40;

	//supply cost
	["player", _cost] remoteExec["GDGM_fnc_addPoints", 2];
	[west, "Base"] sideRadio "radio_airsupport_ok";
	[_commander,"Air supply drop on the way to your location, hang tight, over."] remoteExec ["globalChat",0];

	//spawn air support
	[ _pos_real, side player, player] remoteExec ["GDGM_fnc_supplyDrop", 2];
} else {
	systemChat "Coordinates can't be 0";	
};