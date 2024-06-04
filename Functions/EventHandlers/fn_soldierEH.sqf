params["_array",["_reserve",false]];

{
	//store side
	_x setVariable ["GDGM_owner", side _x];
	_x setVariable ["GDGM_reserve", _reserve];
	_x setVariable ["GDGM_type", "man"];

	//EH
	if(_reserve) then {
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if(!isServer) exitWith {};

			_unit setVariable ["GDGM_reserve", false];
		}];	
	} else {
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if(!isServer) exitWith {};

			private _side = _unit getVariable "GDGM_owner";
			[_side, -1] call GDGM_fnc_addReserves;
		}];	
	};

	//ait threat detection
	_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if(!isServer) exitWith {};

			("Killed exec " + (name _unit)) remoteExec ["systemChat",0];

			//check plane 
			if((vehicle _killer) isKindOf "Helicopter" || (vehicle _killer) isKindOf "plane") then {
				[_unit getVariable "GDGM_owner" , 0.1 * GDGM_threatLevelCoef] call GDGM_fnc_addThreatLevel;
			};
		}];	
} forEach _array;