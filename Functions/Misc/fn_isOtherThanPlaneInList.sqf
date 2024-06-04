params["_list"];

private _res = false;
{
	//check plane
	_res = !(_x isKindOf "plane");

	//check ghost mode
	if(_res) then {
		_res = false;
		if!(_x isKindOf "MAN") then { 
			//in veh
			private _y = _x;
			{
				if!(_x getVariable "GDGM_ghostMode") then {
					//ok to spawn
					_res = true;
					break;
				};			
			} forEach crew _y;
		} else {
			//on foot
			if!(_x getVariable "GDGM_ghostMode") then {
				//ok to spawn
				_res = true;
			};
		};
	};
	if(_res) then {break};
} forEach _list;

_res;