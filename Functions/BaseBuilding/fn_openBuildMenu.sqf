params["_unit"];

//test if engineer 
// if!(_unit getUnitTrait "engineer") exitWith {systemChat "You must be an engineer to build"};

GDGM_logi_points_client = -1;
GDGM_can_build_client = false;

[clientOwner,_unit] remoteExec ["GDGM_fnc_sendLogiArray",2];  

waitUntil { sleep 0.1 ; GDGM_logi_points_client != -1 };

if (GDGM_can_build_client) then {

	createDialog "dialogBuild";

	private _display = findDisplay 19041;
	_display setVariable ["GDGM_unit_building", _unit];

	{
		private _objName = getText (configFile >> "CfgVehicles" >> _x select 0 >> "displayName");
		if(count _x > 3) then {
			private _prefix = "";
			switch (_x select 3) do {
				case "hq": { _prefix = "(HQ) " };
				case "camp": { _prefix = "(Camp) " };
				case "ammo": { _prefix = "(Ammo) " };
				case "aid": { _prefix = "(Aid) " };
				case "radio": { _prefix = "(Radio) " };
				case "veh": { _prefix = "(Depot) " };
				default { };
			};
			_objName = _prefix + _objName;
		};
		lbAdd [190411,_objName];
	} foreach GDGM_defenses_array;

	//points amount 
	ctrlSetText [190413,str GDGM_logi_points_client];

	while {dialog} do {
		private _index = lbCurSel 190411;
		if(_index == -1) then {
			continue;
		};
		_obj = (GDGM_defenses_array select _index) select 0;
		_cost = (GDGM_defenses_array select _index) select 1;
		_picture = getText (configFile >> "CfgVehicles" >> _obj >> "editorPreview");
		ctrlSetText [190412,_picture];
		ctrlSetText [190414,str _cost];
		sleep 0.1;
	};
} else {
	systemChat "Cannot build";
};
