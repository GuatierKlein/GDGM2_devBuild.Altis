params["_node"];

//get highest garri friendly node 
private _connectedNodes = _node getVariable "GDGM_connectedNodes";
private _owner = _node getVariable "GDGM_owner";
private _encircled = _node getVariable "GDGM_isEncircled";
private _maxGarri = 0;
private _maxNode = _connectedNodes select 0;
private _found = false;
private _pos = _node getVariable "GDGM_position";

//if encircled helico
if(_encircled) exitWith {[_pos, _owner] spawn GDGM_fnc_reinfHeliOnPos;};

{
	private _ownerCurrent = _x getVariable "GDGM_owner";
	private _garri = _x getVariable "GDGM_garrison";

	if(_ownerCurrent == _owner && _garri > _maxGarri) then {
		_found = true;
		_maxGarri = _garri;
		_maxNode = _x;
	};
} forEach _connectedNodes;


//si noeud trouvé, faire spawn les renforts, sinon envoyer helo
if(!_found) exitWith {[_pos, _owner] spawn GDGM_fnc_reinfHeliOnPos;};

// find best BG 
private _bestChoiceBG = [_owner] call GDGM_fnc_findBestBG;
if(count _bestChoiceBG == 0) exitWith {[_pos, _owner] spawn GDGM_fnc_reinfHeliOnPos};

//spawn bg
[_owner, -(_bestChoiceBG select 1)] spawn GDGM_fnc_addPoints;
[_maxNode getVariable "GDGM_position", _node, _owner, _bestChoiceBG select 0] spawn GDGM_fnc_spawnBG;

