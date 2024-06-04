params["_node","_amount"];

private _destruction = (_node getVariable "GDGM_destructionAmount") + _amount;
if(_destruction > 1) then {_destruction = 1};
_node setVariable ["GDGM_destructionAmount", _destruction];
GDGM_destructionUpdateQueue pushBack _node;

systemChat str (_node getVariable "GDGM_destructionAmount");