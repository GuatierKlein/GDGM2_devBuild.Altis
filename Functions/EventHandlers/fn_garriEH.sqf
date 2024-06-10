params["_array","_node"];

{
	//store side
	_x setVariable ["GDGM_owner", side _x, true];
	_x setVariable ["GDGM_node", _node];
	_x setVariable ["GDGM_isGarri", true];

	//EH
	_x addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		if(!isServer) exitWith {};

		private _node = _unit getVariable "GDGM_node";
		private _garri = _node getVariable "GDGM_garrison";
		private _newGarri = _garri - 1;
		if(_newGarri < 0) then {
			_newGarri = 0;
		};
		_node setVariable ["GDGM_garrison", _newGarri];
	}];	

	
	//ait threat detection
	_x addMPEventHandler ["MPKilled", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];

			if(!isServer) exitWith {};
			
			// ("Killed G exec " + (name _unit)) remoteExec ["systemChat",0];

			//check plane 
			if((vehicle _killer) isKindOf "Helicopter" || (vehicle _killer) isKindOf "plane") then {
				[_unit getVariable "GDGM_owner" , 0.1 * GDGM_threatLevelCoef] call GDGM_fnc_addThreatLevel;
			};
		}];	
} forEach _array;