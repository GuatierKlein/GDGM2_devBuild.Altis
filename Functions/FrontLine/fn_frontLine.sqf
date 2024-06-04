//goes over all squares to determine where to build defences, once a game at launch, spawn a trigger 

{
	private _y = _x;
	{
		if([_x] call GDGM_fnc_isFrontline) then {
			[_x] call GDGM_fnc_createSquareFrontLine;

			//change marker 
			_markerName = _x getVariable "GDGM_markerName";
			_markerName setMarkerAlphaLocal 0.5;
			_markerName setMarkerBrush "DIAGGRID";
		};		
	} forEach _y;	
} forEach GDGM_allSquares;