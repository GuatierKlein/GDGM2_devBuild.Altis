params["_side","_divisionName","_friendlyFrontlineNodes","_ennemyFrontlineNodes","_supply"];

private _maxRatio = 0;
private _maxNode = objNull;
private _ratio = 0;
private _division = GDGM_allDivisions get _divisionName;
private _reserves = _division get "reserves";

//find best BG
private _bestChoiceBG = [_division] call GDGM_fnc_findBestBGDivision;

if(count _bestChoiceBG == 0) exitwith{systemChat "no bg"}; 

//compute ratios
{
	private _weight = _x getVariable "GDGM_aggWeight";
	private _encircled = _x getVariable "GDGM_isEncircled";
	private _garri = _x getVariable "GDGM_garrison";
	private _pos = _x getVariable "GDGM_position";
	private _closestFriendlyPlayer = [_pos, _side] call GDGM_fnc_findClosestSidedPlayer;
	private _distanceWithClosestPlayer = _pos distance _closestFriendlyPlayer;
	_ratio = _weight * ((_bestChoiceBG select 2) / _garri);
	// systemChat str _ratio;
	// systemChat str _distanceWithClosestPlayer;
	// systemChat str _garri;
	// systemChat str (_bestChoiceBG select 2);

	if(_encircled) then {
		_weight = _weight + 0.75;
	};
	
	if(_ratio > _maxRatio && _distanceWithClosestPlayer > 500) then {
		_maxNode = _x;
		_maxRatio = _ratio;
	};
} forEach _ennemyFrontlineNodes;

//no match
if(_maxRatio < 0.5 || isNull _maxNode) exitwith{systemChat "no match"}; 

//trouver ville de départ
private _fromNode = [_side, _maxNode, false] call GDGM_fnc_findFriendlyNeighbourNode;

if(isNull _fromNode) exitwith{systemChat "no from node"};

//lancer attaque sur maxNode
[_side, _fromNode, _maxNode, _maxNode getVariable "GDGM_garrison", _bestChoiceBG select 0, _bestChoiceBG select 1,  _bestChoiceBG select 2, _bestChoiceBG select 4, true, _divisionName] spawn GDGM_fnc_prepareAttack;



