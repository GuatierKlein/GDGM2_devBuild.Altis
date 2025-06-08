private _handle = objNull;

GDGM_allNodes = []; 
GDGM_strategicNodes = []; //only civilian nodes
GDGM_supplyNodes = []; //only supply nodes
GDGM_entryNodes = [];
GDGM_airportNodes = [];
GDGM_allSquares = [];
GDGM_allFortif = [];
GDGM_allWaterFortif = [];
GDGM_logiCrateArray = [];
GDGM_builtObjectsSave = [];
GDGM_isArtyFree_east = true;
GDGM_isArtyFree_west = true;
GDGM_isArtyFree_ind = true;
GDGM_isCASFree_east = true;
GDGM_isCASFree_west = true;
GDGM_isCASFree_ind = true;
GDGM_isFlareArtyFree_east = true;
GDGM_isFlareArtyFree_west = true;
GDGM_isFlareArtyFree_ind = true;
GDGM_nbNodeSpawn = 0;
GDGM_planeModeEnabled = false;
GDGM_destructionUpdateQueue = [];
GDGM_isPlayerReconning = false;
GDGM_playerFOBs = [];
GDGM_BLUFOR_skipTurn = false;
GDGM_OPFOR_skipTurn = false;
GDGM_IND_skipTurn = false;
GDGM_BLUFOR_skipSupplyTurn = false;
GDGM_OPFOR_skipSupplyTurn = false;
GDGM_IND_skipSupplyTurn = false;
GDGM_lastSupportRequestTime = 0;
GDGM_gracePeriodDone = false;
GDGM_allDivisions = createHashMap;
GDGM_BLUFOR_divisions = [];
GDGM_OPFOR_divisions = [];
GDGM_IND_divisions = [];
GDGM_divIndex = 0;
GDGM_customLocationsPositions = [];
GDGM_savedUserKitHashMap = createHashMap;

//singleplayer 
if(!isMultiplayer) then {
	GDGM_smallTownGarri = GDGM_singlePlayerGarriCoef * GDGM_smallTownGarri;
	GDGM_mediumTownGarri = GDGM_mediumTownGarri * GDGM_smallTownGarri;
	GDGM_bigTownGarri = GDGM_bigTownGarri * GDGM_smallTownGarri;
	GDGM_reducedSideOnlySpawnAttacks = true; 
	GDGM_reducedSideLimitedSpawn = true;
	GDGM_maxBGReserve = GDGM_maxBGReserve * GDGM_singlePlayerGarriCoef;
};

waitUntil { GDGM_init_type != -1 };
// "LeadTrack01c_F" remoteExec["playMusic",0];

if(GDGM_init_type == 1) then {
	//new
	"Creating new GDGM 2.0 world..." remoteExec ["hint",0];
	[] call GDGM_fnc_graph;
} else {
	//load
	"Loading GDGM 2.0 world..." remoteExec ["hint",0];
	private _save = profileNamespace getVariable missionName;
	if(isNil "_save") exitWith {[] call GDGM_fnc_graph};
	//set points 
	
	private _points = _save select 0;
	GDGM_OPFOR_supplies = (_points select 0) select 0;
	GDGM_BLUFOR_supplies = (_points select 1) select 0;
	GDGM_IND_supplies = (_points select 2) select 0;
	//reserves
	GDGM_OPFOR_reserves = (_points select 0) select 1;
	GDGM_BLUFOR_reserves = (_points select 1) select 1;
	GDGM_IND_reserves = (_points select 2) select 1;
	//veh reserves 
	GDGM_OPFOR_vehReserves = (_points select 0) select 2;
	GDGM_BLUFOR_vehReserves = (_points select 1) select 2;
	GDGM_IND_vehReserves = (_points select 2) select 2;
	//player points 
	if(count _points > 3) then {
		GDGM_player_supplies = (_points select 3) select 0;
		GDGM_player_reserves = (_points select 3) select 1;
		GDGM_player_vehReserves = (_points select 3) select 2;
	};
	//set commanders
	private _commanders = _save select 2;
	GDGM_OPFOR_commanderStyle = _commanders select 0;
	GDGM_BLUFOR_commanderStyle =  _commanders select 1;
	GDGM_IND_commanderStyle =  _commanders select 2;
	//custom locations 
	if(count _save > 5) then {
		GDGM_customLocationsPositions = _save select 5;
	};
	//load user kits
	if(count _save > 6) then {
		{
			GDGM_savedUserKitHashMap set [_x select 0, _x select 1];
		} forEach (_save select 6);
	};
	//load date 
	if(count _save > 7) then {
		setDate (_save select 7);
	};

	[_save select 3] call GDGM_fnc_loadBuiltObjects;
	[_save select 4] call GDGM_fnc_initDivisions;
	[_save select 1] call GDGM_fnc_graph;
};

//logi data 
missionNamespace setVariable ["GDGM_logiData", [
    GDGM_OPFOR_supplies,
    GDGM_IND_supplies,
    GDGM_BLUFOR_supplies,
    GDGM_OPFOR_reserves,
    GDGM_IND_reserves,
    GDGM_BLUFOR_reserves,
    GDGM_player_supplies,
    GDGM_player_reserves,
    GDGM_OPFOR_vehReserves,
    GDGM_IND_vehReserves,
    GDGM_BLUFOR_vehReserves,
	GDGM_player_vehReserves
]];

[] call GDGM_fnc_Planes;
[] call GDGM_fnc_initCommanders;
[] call GDGM_fnc_generateStartIntel;
[] call GDGM_fnc_initCustomAA;
"Loading complete!" remoteExec ["systemChat",0];

[] spawn GDGM_fnc_tickLoop;
[] spawn GDGM_fnc_raidLoop;
[] spawn GDGM_fnc_ambientMusic;
[] spawn GDGM_fnc_daySpeedLoop;
[] spawn GDGM_fnc_initAirports;

