params["_save"];

_graph = createAgent ["logic", [0,0,0], [], 0, "form"];

//custom nodes
private _customNodes =  nearestObjects [[0,0,0], ["LocationCity_F"], worldSize * 2];
private _customLocs = [];

{	private _pos = getPosASL _x;
	private _location = createLocation ["NameCity", _pos, 1, 1];	
	_customLocs pushBack _location;
	_location setText (_x getVariable "GDGM_name");
	deleteVehicle _x;
} forEach _customNodes;

//saved custom nodes 

{	
	private _location = createLocation ["NameCity", _x, 1, 1];	
	_customLocs pushBack _location;
	_location setText "";
} forEach GDGM_customLocationsPositions;

//civi nodes
if(isNil "_save") then {
	//create
	_allLocs = nearestLocations [[0,0,0], ["NameCity","NameVillage","NameCityCapital"], worldSize * 2];
	_allLocs = _allLocs - _customLocs;
	//remove blacklisted locs 
	{
		if(
			(locationPosition _x) inArea "GDGM_blackList_marker" 
				|| (locationPosition _x) inArea "GDGM_blackList_marker_1" 
				|| !((locationPosition _x) inArea "GDGM_AO")
			) then {continue};
		_customLocs pushBack _x;
	} forEach _allLocs;
	//create civi nodes
	{
		private _node = [_x] call GDGM_fnc_cityNode;
		GDGM_allNodes pushBack _node;
		GDGM_strategicNodes pushBack _node;
	} forEach _customLocs;
	//airport nodes
	{
		private _node = [_x] call GDGM_fnc_airportNode;
		GDGM_allNodes pushBack _node;
		GDGM_strategicNodes pushBack _node;
		GDGM_airportNodes pushBack _node;
	} forEach GDGM_airports;
} else {
	//load
	{
		private _pos = _x select 0;
		private _garri = _x select 1;
		private _owner = _x select 2;
		private _type = _x select 3;
		private _destruction = 0;
		//retro compatibility
		if(count _x >  4) then {
			_destruction = _x select 4;
		};

		if(!_pos inArea "GDGM_AO") then {
			continue;
		};

		switch (_type) do {
			case ("civilian"): {
				private _nearestCity = nearestLocation [_pos, ""];
				private _node = [_nearestCity, _owner, _garri, _destruction] call GDGM_fnc_cityNode;
				GDGM_allNodes pushBack _node;
				GDGM_strategicNodes pushBack _node;
			};
			case ("fob"): {
				private _nearestCity = nearestLocation [_pos, ""];
				private _node = [_nearestCity, _owner, _garri] call GDGM_fnc_FOBNode;
				GDGM_allNodes pushBack _node;
				GDGM_strategicNodes pushBack _node;
			};
			case ("airport"): {
				private _node = [_pos, _owner, _garri] call GDGM_fnc_airportNode;
				GDGM_allNodes pushBack _node;
				GDGM_strategicNodes pushBack _node;
				GDGM_airportNodes pushBack _node;
			};
		};
	} forEach _save;
};


//check for min dist
private _i = 0;

while {count GDGM_strategicNodes > _i} do {
	private _y = GDGM_strategicNodes select _i;
	private _posY = _y getVariable "GDGM_position";
	private _garriY = _y getVariable "GDGM_targetGarrison";
	private _node2keep = objNull;
	private _node2delete = objNull;
	private _yName = _y getVariable "GDGM_name";

	{
		if(_y == _x) then {continue};
		private _posX = _x getVariable "GDGM_position";

		if(_posX distance2D _posY > GDGM_minDistBtwn2Nodes) then {continue};

		private _garriX = _x getVariable "GDGM_targetGarrison";

		if(_garriX > _garriY) then {
			private _newPos = [(( _posX select 0) + (_posY select 0)) / 2,(( _posX select 1) + (_posY select 1)) / 2,0];
			private _xName = _x getVariable "GDGM_name";
			_x setVariable ["GDGM_position", _newPos];
			_x setVariable ["GDGM_name", (_xName + "/" + _yName)];
			[_y] call GDGM_fnc_deleteNode;
			break;
		} else {
			private _newPos = [(( _posX select 0) + (_posY select 0)) / 2,(( _posX select 1) + (_posY select 1)) / 2,0];
			private _xName = _x getVariable "GDGM_name";
			_y setVariable ["GDGM_position", _newPos];
			_y setVariable ["GDGM_name", (_xName + "/" + _yName)];
			[_x] call GDGM_fnc_deleteNode;
			break;
		};
	} forEach GDGM_strategicNodes;	

	_i = _i + 1;
};

"Linking nodes... (can take several minutes)" remoteExec ["systemChat",0];

//build graph with civi nodes
private _nbNodes = count GDGM_strategicNodes;
{
	//civilian nodes	
	private _closeNodes = [_x getVariable "GDGM_position"] call GDGM_fnc_findNodesConnectedWithRoads;
	((_x getVariable "GDGM_name") + " is linked (" + str _forEachIndex + "/" + str _nbNodes + ")") remoteExec ["systemChat",0];

	if(count _closeNodes != 0) then {
		[_x, _closeNodes] call GDGM_fnc_addNodeConnections;	
	} else {
		_closestNode = [_x] call GDGM_fnc_findClosestNodeFromNode;
		[_x, _closestNode] call GDGM_fnc_addNodeConnection;	
	};	

} forEach GDGM_strategicNodes;

"Nodes linked" remoteExec ["systemChat",0];
"Testing node connections..." remoteExec ["systemChat",0];

//test connection 
_continue = true;

while {_continue} do {
	_unConnectedNodes = [];
	_minDist = worldSize * worldSize;
	_minDistNode = objNull;
	_minDistNextNode = objNull;
	_continue = false;

	{
		if!([_x, GDGM_strategicNodes select 0] call GDGM_fnc_isConnectedTo) then {
			_continue = true;
			_unConnectedNodes pushBack _x;
			_closeNodes = [_x, true] call GDGM_fnc_findCloseNodesFromNode;
			_dist = _x distanceSqr (_closeNodes select 0);
			_msg = "Testing connections on " + (_x getVariable "GDGM_name") + "(" + str _forEachIndex + "/" + str _nbNodes + ")";
			_msg remoteExec ["systemChat",0];

			if(_dist < _minDist) then {
				_minDist = _dist;
				_minDistNode = _x;
				_minDistNextNode = _closeNodes select 0;
			};

			//[[_x],"Coloryellow", str (_x distanceSqr (_closeNodes select 0))] spawn GDGM_fnc_markNodes;
		};
	} forEach GDGM_strategicNodes;
	if(_continue) then {
		[_minDistNode, _minDistNextNode] call GDGM_fnc_addNodeConnection;	
	};	
};

//custom fortifs
"Creating custom fortifications..." remoteExec ["systemChat",0];
_allCustomFortif = nearestObjects [[0,0,0], ["LocationOutpost_F"], worldSize * 2];
{
	[_x] call GDGM_fnc_customFortif;
} forEach _allCustomFortif;

"Creating supply nodes..." remoteExec ["systemChat",0];
//supply node 
_allSupply = nearestObjects [[0,0,0], ["LocationResupplyPoint_F"], worldSize * 2];
{
	_node = [_x] call GDGM_fnc_supplyNode;
	GDGM_supplyNodes pushBack _node;
	GDGM_allNodes pushBack _node;
} forEach _allSupply;

//entry points
_allEntry = nearestObjects [[0,0,0], ["LocationEvacPoint_F"], worldSize * 2];
{
	_node = [_x] call GDGM_fnc_entryNode;
	GDGM_entryNodes pushBack _node;
	GDGM_allNodes pushBack _node;
} forEach _allEntry;

"Removing blacklisted connections..." remoteExec ["systemChat",0];

//remove blackList connection
{
	//find nodes
	private _pos1 = _x select 0;
	private _pos2 = _x select 1;
	private _minDist1 = 10000;
	private _closestNode1 = objNull;
	private _minDist2 = 10000;
	private _closestNode2 = objNull;
	{
		private _pos = _x getVariable "GDGM_position";
		private _dist1 = _pos distance2D _pos1;
		private _dist2 = _pos distance2D _pos2;
		if(_dist1 < _minDist1) then {
			_minDist1 = _dist1;
			_closestNode1 = _x;
		};
		if(_dist2 < _minDist2) then {
			_minDist2 = _dist2;
			_closestNode2 = _x;
		};
	} forEach GDGM_strategicNodes;
	
	//remove connection
	private _array = _closestNode1 getVariable "GDGM_connectedNodes";
	_closestNode1 setVariable ["GDGM_connectedNodes", _array - [_closestNode2]];

	private _array = _closestNode2 getVariable "GDGM_connectedNodes";
	_closestNode2 setVariable ["GDGM_connectedNodes", _array - [_closestNode1]];
} forEach GDGM_connectionBlackList;

"Addind forced connections..." remoteExec ["systemChat",0];

//add forced connections 
{
	private _pos1 = _x select 0;
	private _pos2 = _x select 1;
	private _minDist1 = 10000;
	private _closestNode1 = objNull;
	private _minDist2 = 10000;
	private _closestNode2 = objNull;
	{
		private _pos = _x getVariable "GDGM_position";
		private _dist1 = _pos distance2D _pos1;
		private _dist2 = _pos distance2D _pos2;
		if(_dist1 < _minDist1) then {
			_minDist1 = _dist1;
			_closestNode1 = _x;
		};
		if(_dist2 < _minDist2) then {
			_minDist2 = _dist2;
			_closestNode2 = _x;
		};
	} forEach GDGM_strategicNodes;
	
	[_closestNode1, _closestNode2] call GDGM_fnc_addNodeConnection;
} forEach GDGM_connectionForced;

"Computing aggregate weights..." remoteExec ["systemChat",0];

//compute weights

{
	[_x] call GDGM_fnc_computeNodeWeight;
} forEach GDGM_strategicNodes;

//encirclements 
"Finding encirclements" remoteExec ["systemChat",0];
call GDGM_fnc_updateEncircle;

"Drawing graph.." remoteExec ["systemChat",0];

//draw lines 
GDGM_lineMarkers = [];
{
	_y = _x;
	[_y] call GDGM_fnc_nodeMarker;
	_nodes = _y getVariable "GDGM_connectedNodes";
	_YSide = _y getVariable "GDGM_owner";
	{
		_XSide = _x getVariable "GDGM_owner";
		_color = [_XSide,_YSide] call GDGM_fnc_getLineColor;
		[_y getVariable "GDGM_position", _x getVariable "GDGM_position",_color] call GDGM_fnc_drawLine;
	} foreach _nodes;	
} forEach GDGM_allNodes;

"Graph drawn" remoteExec ["systemChat",0];

"Drawing squares..." remoteExec ["systemChat",0];
//squares
[] call GDGM_fnc_grid;










