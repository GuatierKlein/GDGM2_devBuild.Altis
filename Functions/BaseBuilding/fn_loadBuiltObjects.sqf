params["_objectsSave"];

_save_name = "GDGM_fortif_save_" + missionName;
GDGM_builtObjectsSave = _objectsSave;

if (!isNil "_objectsSave") then {
	"Loading fortifications" remoteExec ["systemChat",0];	
	{
		private _type = _x select 0;
		private _pos = _x select 1;
		private _dir = _x select 2;
		private _disableSim = _x select 3;
		private _speType = _x select 4;
		// private _type = "";
		// if(count _x > 4) then {
		// 	_type = _x select 4;
		// };

		private _obj = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
		_obj setPosASL _pos;

		_obj setDir _dir;
		if(_disableSim) then {
			_obj enableSimulationGlobal false;
		};		

		if(_speType != "") then {
			switch (_speType) do {
				case "camp": { [_obj] spawn GDGM_fnc_makeCamp };
				case "hq": { [_obj] spawn GDGM_fnc_makeHQ };
				case "ammo": { [_obj] spawn GDGM_fnc_makeAmmo };
				case "aid": { [_obj] spawn GDGM_fnc_makeAidPost };
				case "radio": { [_obj] spawn GDGM_fnc_makeRadio };
				case "veh": { [_obj] spawn GDGM_fnc_makeVehDepot };
				default { };
			};
		};
	} foreach _objectsSave;
};