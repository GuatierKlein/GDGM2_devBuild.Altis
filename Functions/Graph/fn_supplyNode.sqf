//constructor for city node, location can be a logic
params["_logic",["_weight",-1],["_owner",east],["_garrison",100]];

//to remove 
// _owner = meme que owner node

_pos = getPos _logic;
_text = "Supply point";

//player side 
if(_pos inArea "GDGM_playerControlledZone") then {
	_owner = west;
};

//if type = civilian -> locationposition ...

_node = createAgent ["logic", _pos, [], 0, "form"];
_node setVariable ["GDGM_name",_text];
_node setVariable ["GDGM_position",_pos];
_node setVariable ["GDGM_connectedNodes",[]];
_node setVariable ["GDGM_garrison",_garrison];
_node setVariable ["GDGM_supplies",0];
_node setVariable ["GDGM_owner",_owner];
_node setVariable ["GDGM_weight",_weight]; //value btwn 0 and 1, importance of the node
_node setVariable ["GDGM_markerName",(str _pos + "_supplyMarker")];
_node setVariable ["GDGM_type","supply"];
_node setVariable ["GDGM_isEncircled",false];

//link to closest node
_closestNode = [_node] call GDGM_fnc_findClosestNodeFromNode;
_node setVariable ["GDGM_connectedNodes",[_closestNode]];
_text = (_closestNode getVariable "GDGM_name") + " supply point";
_node setVariable ["GDGM_name",_text];
_node setVariable ["GDGM_owner",_closestNode getVariable "GDGM_owner"];
_closestNode setVariable ["GDGM_weight",1];

_node;



