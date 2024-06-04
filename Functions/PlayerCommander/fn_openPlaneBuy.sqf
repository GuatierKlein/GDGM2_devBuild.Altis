createdialog "dialogBuyVehicle";

private _side = side player;
private _veh_array = [];

buttonSetAction [161203, "
	[] spawn GDGM_fnc_spawnPlaneBuy;
"];

switch (_side) do {
	case east: {_veh_array = GDGM_PLAYERS_CASPlanes + GDGM_PLAYERS_FighterPlanes};
	case west: {_veh_array =  GDGM_PLAYERS_CASPlanes + GDGM_PLAYERS_FighterPlanes };
	case independent: {_veh_array =  GDGM_PLAYERS_CASPlanes + GDGM_PLAYERS_FighterPlanes };
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



