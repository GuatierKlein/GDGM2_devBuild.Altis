GDGM_fnc_setEncircledRecursive = {
	params["_node"];

	_node setVariable ["GDGM_isEncircled", false];

	private _side = _node getVariable "GDGM_owner";
	private _connectedNodes = _node getVariable "GDGM_connectedNodes";

	{
		if((_x getVariable "GDGM_owner") == _side && _x getVariable "GDGM_isEncircled") then {
			[_x] call GDGM_fnc_setEncircledRecursive;
		};
	} forEach _connectedNodes;
};


//set all to encircled
{
	_x setVariable ["GDGM_isEncircled", true];
} forEach GDGM_civiNodes;

{
	[_x] call GDGM_fnc_setEncircledRecursive;
} forEach GDGM_supplyNodes;


// GDGM_isEncircled

//lancer depuis chaque supply node, est appeler recursivement sur les voisin du même side
//start à true
//un noeud n'est pas encerclé si un des noeud voisin du meme side n'est pas encerclé (OU si il touche un suuply node, 
//les supply points ne sont jamais encerclé donc pas la peine de tester)