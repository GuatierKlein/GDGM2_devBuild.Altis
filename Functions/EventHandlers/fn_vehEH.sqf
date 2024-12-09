params["_veh","_cost",["_type","none"],["_reserve",false], ["_isDivion", false], ["_divisionName", ""]];

//store side
_veh setVariable ["GDGM_owner", side _veh];
_veh setVariable ["GDGM_cost", _cost];
_veh setVariable ["GDGM_reserve", _reserve];
_veh setVariable ["GDGM_type", _type];

//EH
_veh addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if(!isServer) exitWith {};

	private _side = _unit getVariable "GDGM_owner";
	private _cost = _unit getVariable "GDGM_cost";

	[_side, -_cost] call GDGM_fnc_addPoints;
	_unit setVariable ["GDGM_reserve", false];

	if(vehicle _unit isKindOf "tank" && ((vehicle _killer) isKindOf "Helicopter" || (vehicle _killer) isKindOf "plane")) then {
		[_unit getVariable "GDGM_owner" , 0.5 * GDGM_threatLevelCoef] call GDGM_fnc_addThreatLevel;
	};
}];	

if(_isDivion) then {
	_veh setVariable ["GDGM_divisionName", _divisionName];
};
