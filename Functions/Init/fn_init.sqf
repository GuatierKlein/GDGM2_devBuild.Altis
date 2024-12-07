private _handle = objNull;

GDGM_allNodes = []; 
GDGM_civiNodes = []; //only civilian nodes
GDGM_supplyNodes = []; //only supply nodes
GDGM_entryNodes = [];
GDGM_allSquares = [];
GDGM_allFortif = [];
GDGM_allWaterFortif = [];
GDGM_logiCrateArray = [];
GDGM_builtObjectsSave = [];
GDGM_allDivisions = createHashMap;
GDGM_BLUFOR_divisions = [];
GDGM_OPFOR_divisions = [];
GDGM_IND_divisions = [];
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
	//set commanders
	if(count _save > 2) then {
		private _commanders = _save select 2;
		GDGM_OPFOR_commanderStyle = _commanders select 0;
		GDGM_BLUFOR_commanderStyle =  _commanders select 1;
		GDGM_IND_commanderStyle =  _commanders select 2;
	};
	//graph
	[_save select 1] call GDGM_fnc_graph;
	//built objects 
	[_save select 3] call GDGM_fnc_loadBuiltObjects;
};
[] call GDGM_fnc_Planes;
[] call GDGM_fnc_initCommanders;
[] call GDGM_fnc_generateStartIntel;
"Loading complete!" remoteExec ["systemChat",0];

[] spawn GDGM_fnc_tickLoop;
[] spawn GDGM_fnc_raidLoop;
[] spawn GDGM_fnc_ambientMusic;
[] spawn GDGM_fnc_daySpeedLoop;

