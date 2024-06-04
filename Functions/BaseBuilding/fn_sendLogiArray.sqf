params["_id", "_unit"];

private _points = 0;
private _can_build = true;

if (count GDGM_logiCrateArray != 0) then {
	{
		if (_unit distance _x < 50) then {
			_points = _points + (_x getVariable "gdgm_logi_points"); 
		};
	} foreach GDGM_logiCrateArray;
} else {
	//no crates
	"There is no logistic crate on the map" remoteExec ["systemChat",_id];
};

if(_points == 0) then {
	_can_build = false;
};

GDGM_logi_points_client = _points;
GDGM_can_build_client = _can_build;
_id publicVariableClient "GDGM_can_build_client";
_id publicVariableClient "GDGM_logi_points_client";

