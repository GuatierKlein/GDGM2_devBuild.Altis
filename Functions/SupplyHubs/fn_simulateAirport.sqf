params ["_node"];

private _side = _node getVariable "GDGM_owner";
private _airportPos = _node getVariable "GDGM_position";
private _corridorPos = [0,0,0];
private _planePool = [];
private _crewPool = [];
private _baseUnit = "";
private _nodeName = _node getVariable "GDGM_name";

switch (_side) do {
	case east: {_corridorPos = getMarkerPos "GDGM_OPFOR_airCorridor"; _planePool = GDGM_OPFOR_transportPlanes; _crewPool = GDGM_OPFOR_CrewDummies; _baseUnit = GDGM_OPFOR_baseUnit};
	case west: {_corridorPos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _planePool = GDGM_BLUFOR_transportPlanes; _crewPool = GDGM_BLUFOR_CrewDummies; _baseUnit = GDGM_BLUFOR_baseUnit};
	case independent: {_corridorPos = getMarkerPos "GDGM_IND_airCorridor"; _planePool = GDGM_IND_transportPlanes; _crewPool = GDGM_IND_CrewDummies; _baseUnit = GDGM_IND_baseUnit};
};

if(count _planePool == 0) exitWith {
	systemChat format ["No transport planes available for %1", _side];
};

_corridorPos = _corridorPos vectorAdd [0, 0, 100]; // set height to 100m

while {_node getVariable "GDGM_owner" == _side} do {
	// systemChat format ["Spawning plane for %1 at %2", _side, _corridorPos];
	private _grp = createGroup [_side, true];
	private _plane = selectRandom _planePool;
	private _crewLoadout = selectRandom _crewPool;
	private _veh = createVehicle [_plane, _corridorPos, [], 0, "FLY"];
	private _crew = _grp createUnit [ _baseUnit, _corridorPos, [], 0, "FORM"];

	_crew setUnitLoadout getUnitLoadout _crewLoadout;
	_crew moveInDriver _veh;
	_crew setRank "LIEUTENANT";

	_crew setBehaviour "CARELESS";
	_veh allowFleeing 0;
	_veh flyInHeight 100;

	[_grp, [_airportPos SELECT 0, _airportPos select 1, 0], _veh] spawn BIS_fnc_wpLand;

	private _counter = 0;

	waitUntil {
		sleep 5;
		_counter = _counter + 5;
		(
			isTouchingGround _veh &&
			speed _veh < 5 &&
			(getPosATL _veh select 2) < 2
		)
		|| _counter > 600
		|| !alive _veh
	};

	if(alive _veh && damage _veh < 0.5 && _counter < 600) then { 
		// hint "atterit";
		if(_side == GDGM_playerSide && GDGM_airport_displayLandingNotif) then {
			["GDGM_planeLanded", [_nodeName]] remoteExec["BIS_fnc_showNotification", 0];
			//give stuff
		};

		sleep 120;

		private _wpReturn = _grp addWaypoint [_corridorPos, 0];
		_wpReturn setWaypointType "MOVE";
		_wpReturn setWaypointStatements ["true", "
			deleteVehicle vehicle this;
			{ deleteVehicle _x } forEach units group this;
		"];
	} else {
		// hint "avion crash";
		{ deleteVehicle _x } forEach units _grp;
		deleteVehicle _veh;
	};

	sleep (random GDGM_airport_timeBtwnPlane); // wait before spawning next plane
};