_index = lbCurSel 210413;
if(_index == -1) exitwith {};

_unit = GDGM_playerGroup select _index;

if(!isPlayer _unit) then {
	deleteVehicle _unit;
	systemChat "Unit dismissed!";
};
