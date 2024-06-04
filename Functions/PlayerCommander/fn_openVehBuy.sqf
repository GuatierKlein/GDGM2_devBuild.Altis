params[["_useMap", false]];
createdialog "dialogBuyVehicle";

private _side = side player;
private _veh_array = [];

buttonSetAction [161203, "
	[" + str _useMap +"] spawn GDGM_fnc_spawnVehBuy;
"];

switch (_side) do {
	case east: {_veh_array = GDGM_PLAYERS_transports + GDGM_PLAYERS_heavyArmedVeh + GDGM_PLAYERS_tanks + GDGM_PLAYERS_lightArmedVeh};
	case west: {_veh_array = GDGM_PLAYERS_transports + GDGM_PLAYERS_heavyArmedVeh + GDGM_PLAYERS_tanks + GDGM_PLAYERS_lightArmedVeh };
	case independent: {_veh_array = GDGM_PLAYERS_transports + GDGM_PLAYERS_heavyArmedVeh + GDGM_PLAYERS_tanks + GDGM_PLAYERS_lightArmedVeh };
};

{
	_vehName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	lbAdd [160412,_vehName];
	lbSetData [160412,_foreachIndex,_x];
} foreach _veh_array;


while {dialog} do {
	_index = lbCurSel 160412;
	_veh_obj = lbData [160412,_index];
	_picture = getText (configFile >> "CfgVehicles" >> _veh_obj >> "picture");
	ctrlSetText [160411,_picture];
	sleep 0.1;
};



