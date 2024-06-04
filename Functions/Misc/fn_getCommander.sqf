params["_side"];

private _res = objNull;

switch (_side) do {
	case west: { if(!isNil "BLU_commander") then {_res = BLU_commander} };
	case east: { if(!isNil "OPF_commander") then {_res = OPF_commander} };
	case independent: { if(!isNil "IND_commander") then {_res = IND_commander} };
};

_res;