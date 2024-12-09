//parameters
GDGM_init_type = 1; //1 = create, 2 = load, -1 = wait
GDGM_spawnDistance = 1500;
GDGM_YAxisSpawnDistance = 500;
GDGM_maxRoadPathLength = 300;
GDGM_locationSearchRadius = 250;
GDGM_timeBetweenAITicks = 60*60; //in seconds
GDGM_AITimeBuffer = 30; //time before AI start up
GDGM_maxNodeSpawn = 5;
GDGM_mineProbability = 0.1; 
GDGM_mineProbabilityRoadBonus = 0.1; 
GDGM_minDistBtwn2Nodes = 400;
GDGM_nodeTriggerInterval = 10;
GDGM_nodeContestArea = 200;
GDGM_roadBlocksOutterLimit = 350;
GDGM_roadBlocksInnerLimit = 250;
GDGM_nodeScanSpawnRadius = 200; //radius in which the system will scan for spawn suitable houses in a node
GDGM_captureThreshold = 15; //in percent
GDGM_surrenderProbability = 1;
GDGM_surrenderDistance = 75;
GDGM_heavyWeaponSpawnProbability = 1;
GDGM_maxInstaDistance = 500;
GDGM_enableMoraleSystem = true;
GDGM_spawnFrontlineBuildings = true;
GDGM_sides = [];
// GDGM_sides = [opfor, west]; //remettre apres test des divisions
GDGM_defaultOwner = opfor;
GDGM_independentName = "INDFOR";
GDGM_eastName = "OPFOR";
GDGM_westName = "BLUFOR";
GDGM_reducedSide = west; 
GDGM_reducedSideOnlySpawnAttacks = false; // reduced side will only spawn when under attack
GDGM_reducedSideLimitedSpawn = false; // limit spawn for reduced side
GDGM_civilianAlreadySpawnedNodeMax = 1;
GDGM_attackForceSpawnTime = 20; // temps que dure une attaque
GDGM_waterPatrolProba = 0;
GDGM_maxBGReserve = 60; //max bg size allowed
GDGM_introCamLeftSide = west;
GDGM_introCamRightSide = east;

//attacks
GDGM_artyFortif = true;
GDGM_bombTown = true;

//raids 
GDGM_maxRaidPerSide = 2;

//support 
GDGM_planeAttackType =  2; //0 - guns, 1 - missiles, 2 - guns & missiles, 3 - bomb
GDGM_supplyTruckMaxReach = 1000;

//options
GDGM_enableHelicopters = true;
GDGM_addAddPilot = true;

//intel 
GDGM_enableIntel = true;
GDGM_intelPlayerSide = blufor;
GDGM_startIntelProba = 0.25;

//revenue
GDGM_supplyPointRevenue = 30;
GDGM_maxSupply = 600;
GDGM_maxReserves = 400;
GDGM_civiNodesRevenue = 2;
GDGM_maxVehStockpiles = [50, 25, 10, 5, 5];

//plane mode 
GDGM_enablePlaneMode = true;
GDGM_planeModePlayerSide = blufor;
GDGM_maxPlaneRaidNb = 1;
GDGM_maxHeliRaidNb = 1;
GDGM_threatLevelCoef = 1; //ajout 0.1 * GDGM_threatLevelCoef to threat when man killed by plane
GDGM_airResponseCoef = 1;

//OPFOR logistics
GDGM_OPFOR_supplies = 100;
GDGM_OPFOR_reserves = 200;
GDGM_OPFOR_fixedReservesPerTurn = 50;
GDGM_OPFOR_vehReserves = [30, 1, 1, 10, 2]; //[trucks, apcs, tanks, transport helos, combat aircrafts]
GDGM_OPFOR_vehReservesIncome = [5, 1, 0.25, 0.25, 0.25]; 
GDGM_OPFOR_cowardice = 1;
GDGM_OPFOR_moraleOffset = 0;
GDGM_OPFOR_skill = 0.35;
//BLUFOR logistics
GDGM_BLUFOR_supplies = 250;
GDGM_BLUFOR_reserves = 200;
GDGM_BLUFOR_fixedReservesPerTurn = 50;
GDGM_BLUFOR_vehReserves = [20, 5, 0, 0, 10]; //[trucks, apcs, tanks, transport helos, combat aircrafts]
GDGM_BLUFOR_vehReservesIncome = [5, 1, 0.25, 0.25, 0.25]; 
GDGM_BLUFOR_cowardice = 0.5;
GDGM_BLUFOR_moraleOffset = 0;
GDGM_BLUFOR_skill = 0.3;
//IND logistics
GDGM_IND_supplies = 0;
GDGM_IND_reserves = 0;
GDGM_IND_fixedReservesPerTurn = 0;
GDGM_IND_vehReserves = [0, 0, 0, 0, 0]; //[trucks, apcs, tanks, transport helos, combat aircrafts]
GDGM_IND_vehReservesIncome = [0, 0, 0, 0, 0]; 
GDGM_IND_cowardice = 1;
GDGM_IND_moraleOffset = 0;
GDGM_IND_skill = 0;

GDGM_smallTownSize = 20;
GDGM_bigTownSize = 60;
GDGM_smallTownGarri = 10;
GDGM_mediumTownGarri = 20;
GDGM_bigTownGarri = 35;

//aggressive, cautious, defensive 
GDGM_OPFOR_commanderStyle = "aggressive";
GDGM_BLUFOR_commanderStyle = "cautious";
GDGM_IND_commanderStyle = "cautious";

//units
GDGM_OPFOR_baseUnit = "O_T_Soldier_F";
GDGM_BLUFOR_baseUnit = "B_G_Soldier_F";
GDGM_IND_baseUnit = "";
GDGM_CIV_units = ["C_man_1"];

//OPFOR loadouts
GDGM_OPFOR_rifleDummies = [loadout_opfor];
GDGM_OPFOR_greDummies = [loadout_opfor];
GDGM_OPFOR_MGDummies = [loadout_opfor];
GDGM_OPFOR_SLDummies = [loadout_opfor];
GDGM_OPFOR_ATDummies = [loadout_opfor];
GDGM_OPFOR_CrewDummies = [loadout_opfor];
GDGM_OPFOR_OfficerDummies = [loadout_opfor];
GDGM_OPFOR_RadioDummies = [loadout_opfor];
GDGM_OPFOR_SniperDummies = [loadout_opfor];

GDGM_OPFOR_statics = ["B_HMG_01_high_F"];
GDGM_OPFOR_heavyWeap = ["B_HMG_01_high_F"];
GDGM_OPFOR_transports = [
"O_MRAP_02_F"
];
GDGM_OPFOR_lightArmedVeh = [
"O_MRAP_02_hmg_F"
];
GDGM_OPFOR_heavyArmedVeh = [
"O_APC_Wheeled_02_rcws_v2_F"
];
GDGM_OPFOR_tanks = [
"O_MBT_04_cannon_F"
];
GDGM_OPFOR_transportHelos = ["O_Heli_Light_02_unarmed_F"];
GDGM_OPFOR_armedHelos = ["O_Heli_Attack_02_dynamicLoadout_F"];
GDGM_OPFOR_ammoTrucks = ["O_Truck_03_ammo_F"];
GDGM_OPFOR_CASPlanes = ["O_Plane_CAS_02_dynamicLoadout_F"];
GDGM_OPFOR_FighterPlanes = ["O_Plane_Fighter_02_F"];
GDGM_OPFOR_AA = ["B_HMG_01_high_F"];
GDGM_OPFOR_patrolBoats = [];

//BLUFOR loadouts
GDGM_BLUFOR_rifleDummies = [loadout_blufor];
GDGM_BLUFOR_greDummies = [loadout_blufor];
GDGM_BLUFOR_MGDummies = [loadout_blufor];
GDGM_BLUFOR_SLDummies = [loadout_blufor];
GDGM_BLUFOR_ATDummies = [loadout_blufor];
GDGM_BLUFOR_CrewDummies = [loadout_blufor];
GDGM_BLUFOR_OfficerDummies = [loadout_blufor];
GDGM_BLUFOR_RadioDummies = [loadout_blufor];
GDGM_BLUFOR_SniperDummies = [loadout_blufor];

GDGM_BLUFOR_statics = ["B_HMG_01_high_F"];
GDGM_BLUFOR_heavyWeap = ["B_HMG_01_high_F"];
GDGM_BLUFOR_transports = ["B_MRAP_01_F"];
GDGM_BLUFOR_lightArmedVeh = ["B_MRAP_01_hmg_F"];
GDGM_BLUFOR_heavyArmedVeh = ["B_APC_Wheeled_01_cannon_F"];
GDGM_BLUFOR_tanks = ["B_MBT_01_cannon_F"];
GDGM_BLUFOR_transportHelos = ["B_Heli_Transport_01_F"];
GDGM_BLUFOR_armedHelos = ["B_Heli_Attack_01_dynamicLoadout_F"];
GDGM_BLUFOR_ammoTrucks = ["B_Truck_01_ammo_F"];
GDGM_BLUFOR_CASPlanes = ["B_Plane_CAS_01_dynamicLoadout_F"];
GDGM_BLUFOR_FighterPlanes = ["B_Plane_Fighter_01_F"];
GDGM_BLUFOR_AA = ["B_HMG_01_high_F"];
GDGM_BLUFOR_patrolBoats = [];

//INDEPENDANTS loadouts
GDGM_IND_rifleDummies = [];
GDGM_IND_greDummies = [];
GDGM_IND_MGDummies = [];
GDGM_IND_SLDummies = [];
GDGM_IND_ATDummies = [];
GDGM_IND_CrewDummies = [];
GDGM_IND_OfficerDummies = [];
GDGM_IND_RadioDummies = [];
GDGM_IND_SniperDummies = [];

GDGM_IND_statics = [];
GDGM_IND_heavyWeap = [];
GDGM_IND_transports = [];
GDGM_IND_lightArmedVeh = [];
GDGM_IND_heavyArmedVeh = [];
GDGM_IND_tanks = [];
GDGM_IND_transportHelos = [];
GDGM_IND_armedHelos = [];
GDGM_IND_ammoTrucks = [];
GDGM_IND_CASPlanes = [];
GDGM_IND_FighterPlanes = [];
GDGM_IND_AA = [];
GDGM_IND_patrolBoats = [];

//players pool  
GDGM_PLAYERS_transports = [

];
GDGM_PLAYERS_lightArmedVeh = [

];
GDGM_PLAYERS_heavyArmedVeh = [

];
GDGM_PLAYERS_tanks = [

];
GDGM_PLAYERS_CASPlanes = [

];
GDGM_PLAYERS_FighterPlanes = [

];

//music 
GDGM_musicList = [
"LeadTrack06_F",
"AmbientTrack01_F",
"AmbientTrack04_F",
"LeadTrack01_F_EPA",
"Music_Roaming_Night",
"Music_Freeroam_02_MissionStart",
"AmbientTrack01a_F_Tacops",
"AmbientTrack01b_F_Tacops",
"AmbientTrack02b_F_Tacops",
"AmbientTrack03a_F_Tacops",
"AmbientTrack01_F_Orange",
"AmbientTrack01_F_EPB",
"EventTrack03_F_EPB",
"EventTrack01_F_EPB",
"EventTrack01_F_EPC",
"LeadTrack01_F",
"LeadTrack02_F",
"LeadTrack01_F_EPA",
"Track_C_20",
"Track_P_15",
"Track_P_07",
"Track_R_01",
"Track_R_11",
"Wasteland"
];

//wrecks 
GDGM_wrecksPool = [
"Land_Wreck_BMP2_F"
];

GDGM_connectionBlackList = [

];

//scripts settings 
//addpilot
//mannequin pour l'équipement du pilot
GDGM_addPilot_kitUsed = kit_crew;
//classname du pilot
GDGM_addPilot_baseUnit = "B_G_Soldier_F";

//kit_select
GDGM_kitSelect_availableKits = []; //mannequins
GDGM_kitSelect_availableKitsNames = []; //nons

//special divisions

//DON't MODIFIY BETWEEN THESE COMMENTS
GDGM_allDivisions = createHashMap;
GDGM_BLUFOR_divisions = [];
GDGM_OPFOR_divisions = [];
GDGM_IND_divisions = [];
//DON't MODIFIY BETWEEN THESE COMMENTS

[
	"TestDivision", //name,
	east, //side 
	createHashMapFromArray [ //dummies
		["rifle", [loadout_opfor_div]],
		["gre", [loadout_opfor_div]],
		["mg", [loadout_opfor_div]],
		["at", [loadout_opfor_div]],
		["sl", [loadout_opfor_div]],
		["crew", [loadout_opfor_div]],
		["sn", [loadout_opfor_div]],
		["rto", [loadout_opfor_div]],
		["off", [loadout_opfor_div]]
	],
	createHashMapFromArray [ //vehicles
		["light", ["O_T_MRAP_02_hmg_ghex_F"]],
		["heavy", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F"]],
		["transport", ["O_T_Truck_03_transport_ghex_F"]],
		["tank", ["O_T_MBT_02_railgun_ghex_F"]]
	],
	[50,10,5,0], //veh reserves
	400, //reserves
	0, //suuplies, not implemented
	0.8 //skill
] call GDGM_fnc_division;