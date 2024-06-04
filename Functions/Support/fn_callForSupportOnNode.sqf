params["_node","_side"];

private _pos = _node getVariable "GDGM_position";

private _vehPool = [];

switch (_side) do {
	case east: { _vehPool = GDGM_OPFOR_armedHelos };
	case west: { _vehPool = GDGM_BLUFOR_armedHelos };
	case independent: { _vehPool = GDGM_IND_armedHelos };
};

if(count _vehPool == 0) exitWith {};


[_pos, _side, 3] spawn GDGM_fnc_heliOnPos;

// [_pos, _side] spawn GDGM_fnc_reinfHeliOnPos;

// sleep 10;

// if(random 1 > 0.5) then {
// 	[_pos, _side] spawn GDGM_fnc_heliOnPos;
// } else {
// 	[_pos, _side] spawn GDGM_fnc_reinfHeliOnPos;
// 	[_pos, _side] spawn GDGM_fnc_reinfHeliOnPos;
// };
