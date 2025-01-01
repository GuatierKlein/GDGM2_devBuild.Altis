//constructor for city node, location can be a logic
params["_logic"];

//to remove 
// _owner = meme que owner node

_pos = getPos _logic;

//if type = civilian -> locationposition ...

_node = createAgent ["logic", _pos, [], 0, "form"];
_node setVariable ["GDGM_position",_pos];
_node setVariable ["GDGM_connectedNodes",[]];
_node setVariable ["GDGM_garrison",0];
_node setVariable ["GDGM_supplies",0];
_node setVariable ["GDGM_weight",0]; //value btwn 0 and 1, importance of the node
_node setVariable ["GDGM_markerName",(str _pos + "_entryMarker")];
_node setVariable ["GDGM_type","entry"];
_node setVariable ["GDGM_isEncircled",false];

//link to closest node
_closestNode = [_node] call GDGM_fnc_findClosestNodeFromNode;
_node setVariable ["GDGM_connectedNodes",[_closestNode]];
[_closestNode, _node] spawn GDGM_fnc_addNodeConnection;
_text = (_closestNode getVariable "GDGM_name") + " entry point";
_node setVariable ["GDGM_name",_text];
_node setVariable ["GDGM_owner", civilian];
_closestNode setVariable ["GDGM_weight",1];

_node;





