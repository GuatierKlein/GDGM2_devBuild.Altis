params["_side","_friendlyFrontlineNodes","_ennemyFrontlineNodes","_supply"];


private _reserves = [_side] call GDGM_fnc_getReserves;

//regarri 
[_side, 0.75] spawn GDGM_fnc_tickDefensive;
private _maxRatio = 0;
private _maxNode = objNull;

[format ["supplies for %1 after regarri: %2", str _side, [_side] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;

//find best BG
private _bestChoiceBG = [_side] call GDGM_fnc_findBestBG;

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

	if(_encircled) then {
		_weight = _weight + 0.75;
	};
	
	if(_ratio > _maxRatio && random 1 < 0.8 && _distanceWithClosestPlayer > 500) then {
		_maxNode = _x;
		_maxRatio = _ratio;
	};
} forEach _ennemyFrontlineNodes;

//no match
if(_maxRatio < 1 || isNull _maxNode || _reserves < 50) exitwith{}; 

// systemChat (_maxNode getVariable "GDGM_name");

//trouver ville de départ
private _fromNode = [_side, _maxNode, false] call GDGM_fnc_findFriendlyNeighbourNode;

if(isNull _fromNode) exitwith{systemChat "no from node"};

//lancer attaque sur maxNode
[_side, _fromNode, _maxNode, _maxNode getVariable "GDGM_garrison", _bestChoiceBG select 0, _bestChoiceBG select 1,  _bestChoiceBG select 2, _bestChoiceBG select 4] spawn GDGM_fnc_prepareAttack;






