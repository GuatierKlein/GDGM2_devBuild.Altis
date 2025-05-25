//constructor for city node, location can be a logic
params["_location",["_owner",civilian],["_garrison",-1]];

private _connectedNodesArray = [];

_pos = getPosASL _location;
_supplies = 0;

private _nearestNode = [_pos] call GDGM_fnc_findClosestNode;
private _text = _location getVariable "GDGM_name";
private _weight = 1;
private _targetGarrison = GDGM_bigTownGarri;

if(_garrison == -1) then {
	_garrison = _targetGarrison;
};

if(_owner == civilian) then {
	if(_pos inArea "GDGM_bluforControlledZone") then {
		_owner = west;
	} else {
		if(_pos inArea "GDGM_indControlledZone") then {
			_owner = independent;
		} else {
			if(_pos inArea "GDGM_opforControlledZone") then {
				_owner = east;
			} else {
				_owner = GDGM_defaultOwner;
			};			
		};
	};
};

_node = createAgent ["logic", _pos, [], 0, "form"];
_node setVariable ["GDGM_name", _text];
_node setVariable ["GDGM_position",_pos];
_node setVariable ["GDGM_connectedNodes",_connectedNodesArray];
_node setVariable ["GDGM_garrison",_garrison];
_node setVariable ["GDGM_targetGarrison",_targetGarrison];
_node setVariable ["GDGM_supplies",_supplies];
_node setVariable ["GDGM_owner",_owner];
_node setVariable ["GDGM_weight",_weight]; //value btwn 0 and 1, importance of the node
_node setVariable ["GDGM_aggWeight",0];
_node setVariable ["GDGM_markerName",(str _pos + "_marker")];
_node setVariable ["GDGM_type","airport"];
_node setVariable ["GDGM_isSpawned",false];
_node setVariable ["GDGM_spawnedObjects",[]];
_node setVariable ["GDGM_underAttack",false];
_node setVariable ["GDGM_isEncircled",true];
_node setVariable ["GDGM_isContested",false];
_node setVariable ["GDGM_spawnMarker",""];
_node setVariable ["GDGM_roadBlocks",[]];
_node setVariable ["GDGM_destructionAmount", 0];
_node setVariable ["GDGM_reinfGroups", []];
_node setVariable ["GDGM_instaGroups", []];
_node setVariable ["GDGM_noAttack", _pos inArea "GDGM_noAttackZone" || _pos inArea "GDGM_noAttackZone_1"];

// [_node] call GDGM_fnc_createFortifications; // faut pas que ça spawn sur la piste -> ajouter un marker ?

//trigger 
_trg = createTrigger ["EmptyDetector", _pos, false];	
_trg setVariable ["GDGM_installation", _node];
_trg setTriggerArea [GDGM_spawnDistance, GDGM_spawnDistance, 0, false, GDGM_YAxisSpawnDistance];	
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_trg setTriggerTimeout [3,3,3,false];
_trg setTriggerStatements ["(this && [thisTrigger, thisList] call GDGM_fnc_spawnNodeCondition) || [thisTrigger, thisList] call GDGM_fnc_spawnNodeConditionPrio", "
	if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_spawnNode};
", "
	if (isServer) then {[thisTrigger getVariable 'GDGM_installation'] spawn GDGM_fnc_despawnNode};
"];
_trg setTriggerInterval 10;

_node setVariable ["GDGM_trigger",_trg];
_node setVariable ["GDGM_triggerCiv",objNull];

("Created FOB node in " + _text) remoteExec ["systemChat",0];

_node;

