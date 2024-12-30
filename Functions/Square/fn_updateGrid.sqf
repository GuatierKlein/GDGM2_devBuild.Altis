//update squares
{
	private _y = _x;
	{
		private _markerName = _x getVariable "GDGM_markerName";
		private _middle = _x getVariable "GDGM_middle";
		private _closestNode = [_middle] call GDGM_fnc_findClosestNode;
		private _closestNodePos = _closestNode getVariable "GDGM_position";

		//look if FOB closer than closestnode 
		private _distWithClosestNode = _closestNodePos distance2D _middle;
		private _owner = _closestNode getVariable "GDGM_owner";

		if([_middle, _distWithClosestNode] call GDGM_fnc_isFOBWithinDist) then {
			_owner = GDGM_playerSide;
		};


		_x setVariable ["GDGM_owner", _owner];

		switch (_owner) do {
			case west: {_markerName setMarkerColor "Colorblue" };
			case east: {_markerName setMarkerColor "Colorred" };
			case independent: {_markerName setMarkerColor "Colorgreen" };
		};		
	} forEach _y;
} forEach GDGM_allSquares;