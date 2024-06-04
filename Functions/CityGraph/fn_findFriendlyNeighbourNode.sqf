params["_side","_node",["_acceptEncircled",true]];

private _neighbours = _node getVariable "GDGM_connectedNodes";
private _res = objNull;
private _maxGarri = 0;

{
	if(_x getVariable "GDGM_owner" == _side && _x getVariable "GDGM_garrison" > _maxGarri) then {
		if(_acceptEncircled) then {
			_res = _x;
			_maxGarri = _x getVariable 'GDGM_garrison';
		} else {
			if!(_x getVariable "GDGM_isEncircled") then {
				_res = _x;
				_maxGarri = _x getVariable 'GDGM_garrison';
			};
		};
	};	
} forEach _neighbours;

_res;