params ["_veh","_side"];

if(!isNull (driver _veh) && alive (driver _veh)) exitwith {hint "Driver seat already taken"};

if(isNull (driver _veh)) then {
	deleteVehicle (driver _veh);
};

private _grpEQUI = createGroup _side;
private _unitPool = [];
private _baseUnit = "";

switch (_side) do {
	case east: {_unitPool = GDGM_OPFOR_CrewDummies; _baseUnit = GDGM_OPFOR_baseUnit};
	case west: {_unitPool = GDGM_BLUFOR_CrewDummies; _baseUnit = GDGM_BLUFOR_baseUnit};
	case independent: {_unitPool = GDGM_IND_CrewDummies; _baseUnit = GDGM_IND_baseUnit};
};

private _crewDriver = _grpEQUI createUnit [_baseUnit, [0,0], [], 0, "NONE"]; 
hint "Pilot created";
_crewDriver setUnitLoadout getUnitLoadout (selectRandom GDGM_BLUFOR_CrewDummies);

_crewDriver moveInDriver _veh;
_crewDriver disableAI "ALL";

_veh setVariable ["GDGM_driver",_crewDriver,true];
_veh setVariable ["GDGM_hasDriver",true,true];
_crewDriver setVariable ["GDGM_linkedVeh",_veh,true];
_crewDriver addEventHandler ["GetOutMan",{deleteVehicle (_this select 0); hint "Pilot removed";}];
_crewDriver addEventHandler ["SeatSwitchedMan",{deleteVehicle (_this select 0); hint "Pilot removed";}];

_crewDriver addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	(_unit getVariable "GDGM_linkedVeh") setVariable ["GDGM_hasDriver",false,true];
}];

