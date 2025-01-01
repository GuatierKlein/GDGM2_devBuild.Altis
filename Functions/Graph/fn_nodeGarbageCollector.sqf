//nodes
{
	private _trg = _x getVariable "GDGM_trigger";
	if!(triggerActivated _trg) then {
		[_x] spawn GDGM_fnc_despawnNode;
	};
} forEach GDGM_civiNodes;

//insta
{
	private _trg = _x getVariable "GDGM_trigger";
	if!(triggerActivated _trg) then {
		[_x] spawn GDGM_fnc_despawnInsta;
	};
} forEach GDGM_allFortif;

//squares
{
	private _y = _x;
	{
		private _pos = _x getVariable "GDGM_position";
		if((_pos select 0) != 0 && (_pos select 1) != 0) then {
			private _trg = _x getVariable "GDGM_trigger";
			if!(triggerActivated _trg) then {
				[_x] spawn GDGM_fnc_despawnInsta;
			};
		};		
	} forEach _y;
} forEach GDGM_allSquares;

"Garbage collected" remoteExec ["systemChat",0];