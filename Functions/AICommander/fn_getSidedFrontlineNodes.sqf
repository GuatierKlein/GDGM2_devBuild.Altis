params["_side"];

private _friendlyNodes = [];
private _ennemyNodes = [];

{
	if([_x, _side, false, true] call GDGM_fnc_isOnFrontlineSide && !(_x getVariable "GDGM_underAttack")) then {
		if(_x getVariable "GDGM_owner" == _side) then {
			if(!(_x getVariable "GDGM_isEncircled")) then {
				_friendlyNodes pushBack _x;
			};		
		} else {
			if(!(_x getVariable "GDGM_noAttack")) then {
				_ennemyNodes pushBack _x;
			};
		};
	};	
} forEach GDGM_civiNodes;

private _res = [_friendlyNodes, _ennemyNodes];
_res;