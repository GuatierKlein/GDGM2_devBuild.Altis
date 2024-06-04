	params["_bg"];

	private _units = _bg select 0;
	private _res = [0,0,0,0,0];

	{
		switch (_x select 0) do {
			case "Msquad": { _res set [0, (_res select 0) +( _x select 1)] };
			case "apc": { _res set [1, (_res select 1) +( _x select 1)] };
			case "tank": { _res set [2, (_res select 2) +( _x select 1)] };
			default { };
		};
		
	} forEach _units;

	_res;