//update squares
{
	private _y = _x;
	{
		private _markerName = _x getVariable "GDGM_markerName";
		private _middle = _x getVariable "GDGM_middle";
		private _closestNode = [_middle] call GDGM_fnc_findClosestNode;
		private _owner = _closestNode getVariable "GDGM_owner";
		_x setVariable ["GDGM_owner", _owner];

		switch (_owner) do {
			case west: {_markerName setMarkerColor "Colorblue" };
			case east: {_markerName setMarkerColor "Colorred" };
			case independent: {_markerName setMarkerColor "Colorgreen" };
		};		
	} forEach _y;
} forEach GDGM_allSquares;