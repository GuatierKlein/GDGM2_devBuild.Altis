params["_node"];

private _trg = _node getVariable "GDGM_trigger";

deleteVehicle _trg;

GDGM_allNodes = GDGM_allNodes - [_node];
GDGM_strategicNodes = GDGM_strategicNodes - [_node];
deleteVehicle _node;