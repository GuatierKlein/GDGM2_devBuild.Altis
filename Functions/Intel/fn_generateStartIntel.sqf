if(!GDGM_enableIntel) exitWith {};

private _frontlineNodes = [GDGM_intelPlayerSide] call GDGM_fnc_getSidedFrontlineNodes;
private _ennemyNodes = _frontlineNodes select 1;
private _intelPosArray = [];

//nodes
{
	private _owner = _x getVariable "GDGM_owner";
	private _ownerNode = _x getVariable "GDGM_ownerNode";
	if(_owner == GDGM_intelPlayerSide || !(_ownerNode in _ennemyNodes) || random 1 > GDGM_startIntelProba) then {
		continue;
	};

	private _pos = _x getVariable "GDGM_position";

	[_pos, _owner, "Entrenched position"] call GDGM_fnc_createIntel;
	
} forEach GDGM_allFortif;

//frontline
{
	{
		private _owner = _x getVariable "GDGM_owner";
		private _position = _x getVariable "GDGM_position";

		if(_owner == GDGM_intelPlayerSide) then {
			private _isFrontline = [_x] call GDGM_fnc_isFrontLine;
			if(!_isFrontline || random 1 > 0.75 || ((_position select 0) == 0 && (_position select 1) == 0)) then {
				continue;
			};
			[_position, GDGM_intelPlayerSide, "Frontline position"] call GDGM_fnc_createIntel;
			continue;
		};

		private _isFrontline = [_x, GDGM_intelPlayerSide] call GDGM_fnc_isSidedFrontLine;
		
		if(!_isFrontline || random 1 > GDGM_startIntelProba || ((_position select 0) == 0 && (_position select 1) == 0)) then {
			continue;
		};

		[_position, _owner, "Frontline position"] call GDGM_fnc_createIntel;
	} forEach _x;
} forEach GDGM_allSquares;