_unit = _this select 0;

createDialog "dialogRecruitment";

_display = findDisplay 21041;
_display setVariable ["GDGM_caller", _unit];

// _unit_array = [
// 	"UK3CB_MEI_I_RIF_11", 
// 	"UK3CB_MEI_I_RIF_5", 
// 	"UK3CB_MEI_I_RIF_2", 
// 	"UK3CB_MEI_I_RIF_1", 
// 	"UK3CB_MEI_I_RIF_4", 
// 	"UK3CB_MEI_I_SNI", 
// 	"UK3CB_MEI_I_ENG", 
// 	"UK3CB_MEI_I_GL", 
// 	"UK3CB_MEI_I_LAT", 
// 	"UK3CB_MEI_I_MD", 
// 	"UK3CB_MEI_I_AR_01", 
// 	"UK3CB_MEI_I_AT", 
// 	"UK3CB_MEI_I_AA"
// ];

// {
// 	_unitName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
// 	lbAdd [210411,_unitName];
// 	lbSetData [210411,_foreachIndex,_x];
// } foreach _unit_array;


while {dialog} do {
	GDGM_playerGroup = [];
	_index = lbCurSel 210411;
	_obj = lbData [210411,_index];
	_picture = getText (configFile >> "CfgVehicles" >> _obj >> "editorPreview");
	ctrlSetText [210412,_picture];
	//current group 
	lbClear 210413;
	{
		if(!isPlayer _x) then {
			_unitName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
			lbAdd [210413,_unitName];
			GDGM_playerGroup pushBack _x;
		};
	} foreach units group player;
	sleep 0.5;
};