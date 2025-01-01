//return all reachable nodes by road from a pos, measures with roads units
params["_pos",["_debug",false]];
GDGM_roadSearchRadius = 100;
private _reachableNodes = [];

GDGM_fnc_roadPathLengthRecursive = {
	params["_count","_road","_length","_reachableNodes","_originalNode","_path"];

	private _roadType = (getRoadInfo _road) select 0;
	private _add = 1;
	// private _maxRoadPathLengthIfNoneFound = GDGM_maxRoadPathLength * 3;
	private _color = "colorred";
	private _stop = false;
	_path pushBack _road;

	if(_roadType == "TRACK") then {
		_add = 3;
		_color = "coloryellow";
	} else {
		if(_roadType == "ROAD") then {
			_add = 2;
			_color = "colororange";
		};
	};

	if(_debug) then {
		private _marker_object = createMarker [str (getPos _road), getPos _road];
		_marker_object setMarkerTypeLocal "mil_triangle";
		_marker_object setMarkerColorLocal _color;
		_marker_object setMarkerTextLocal (str _length);
	};

	_length = _length + _add;

	//une fois sur 5 on check les villes pas loin
	if(_count % 5 == 0) then {
		_closeNodes = [getPos _road, GDGM_locationSearchRadius] call GDGM_fnc_findCLoseNodes;
		{
			if(_originalNode != _x) then {
				_reachableNodes pushBackUnique _x;	
				_stop = true;	
			};	
		} forEach _closeNodes;	
	};

	// if((_length > GDGM_maxRoadPathLength && count _reachableNodes != 0) || _length > _maxRoadPathLengthIfNoneFound) exitwith {};
	if(_length > GDGM_maxRoadPathLength || _stop) exitwith {};

	_connectedRoads = roadsConnectedTo _road;
	{		
		if(_x in _path) then {continue};
		[_count + 1, _x, _length, _reachableNodes, _originalNode, _path] call GDGM_fnc_roadPathLengthRecursive;
	} forEach _connectedRoads;
};

//lancer fonction
private _allRoads = [_pos select 0, _pos select 1] nearRoads GDGM_roadSearchRadius;

if(count _allRoads != 0) then {
	private _road = _allRoads select 0;
	private _originalNode = [_pos] call GDGM_fnc_findClosestNode;
	[0, _road, 0, _reachableNodes, _originalNode, []] call GDGM_fnc_roadPathLengthRecursive;
};

_reachableNodes;

