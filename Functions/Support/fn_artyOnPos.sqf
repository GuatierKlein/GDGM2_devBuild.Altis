params["_pos","_side"];

private _price = 10;
private _supplies = 0;

//check if enough
switch (_side) do {
	case west: {_supplies = GDGM_BLUFOR_supplies };
	case east: {_supplies = GDGM_OPFOR_supplies };
	case independent: {_supplies = GDGM_IND_supplies };
};

if(_supplies - _price < 0) exitwith {};

//spend points
switch (_side) do {
	case west: {GDGM_BLUFOR_supplies = GDGM_BLUFOR_supplies - _price };
	case east: {GDGM_OPFOR_supplies = GDGM_OPFOR_supplies - _price };
	case independent: {GDGM_IND_supplies = GDGM_IND_supplies - _price };
};

//arty 
[_pos getPos [floor(random 50), floor(random 360)], "Sh_155mm_AMOS", 20, 10, 5] spawn BIS_fnc_fireSupportVirtual;

