params["_divisionName"];

private _division = GDGM_allDivisions get _divisionName;
private _side = _division get "side";

private _friendlyFrontlineNodes = [_side] call GDGM_fnc_getSidedFrontlineNodes;
private _ennemyFrontlineNodes = _friendlyFrontlineNodes select 1;
_friendlyFrontlineNodes = _friendlyFrontlineNodes select 0;

[_side, _divisionName, _friendlyFrontlineNodes, _ennemyFrontlineNodes, 0] spawn GDGM_fnc_tickAggressiveDivision;

