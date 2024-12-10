class CfgFunctions
{
	class GDGM
	{
		class Init 
		{
			class init {};
		};
		class CityGraph
		{
			class cityNode {};
			class nodeMarker {};
			class graph {};
			class addNodeConnection {};
			class addNodeConnections {};
			class nodesInDist {};
			class drawLine {};
			class findClosestNodeFromNode {};
			class findCloseNodesFromNode {};
			class findClosestNode {};
			class isConnectedTo {};
			class markNodes {};
			class findNodesConnectedWithRoads {};
			class findCLoseNodes {};
			class getLineColor {};
			class supplyNode {};
			class createFortifications {};
			class isOnFrontline {};
			class isOnFrontlineSide {};
			class spawnNode {};
			class despawnNode {};
			class contestNode {};
			class surrenderNode {};
			class changeOwner {};
			class updateGraph {};
			class findFriendlyNeighbourNode {};
			class spawnNodeCondition {};
			class spawnNodeConditionPrio {};
			class updateNodeMarker {};
			class computeNodeWeight {};
			class nodeGarbageCollector {};
			class spawnGarri {};
			class updateEncircle {};
			class entryNode {};
			class customFortif {};
			class deleteNode {};
			class findClosestSidedUnconstestedNode {};
			class findClosestSidedNode {};
			class destroyTown {};
			class updateDestruction {};
			class addDestruction {};
			class spawnDestructionEffects {};
			class callBackPatrols {};
		};
		class Square
		{
			class square {};
			class grid {};
			class updateGrid {};
			class getSquaresWithinDist {};
		};
		class FrontLine
		{
			class frontLine {};
			class createSquareFrontLine {};
			class isFrontLine {};
			class isSidedFrontLine {};
			class getFrontLineNeighbours {};
			class spawnMineField {};
			class findClosestEnnemySquare {};
			class createMineMarker {};
		};
		class Installation
		{
			class despawnInsta {};
			class spawnInsta {};
			class spawnRoadBlocks {};
			class callBackInsta {};
			class spawnWaterPatrol {};
		};
		class Misc
		{
			class giveNode {};
			class despawnAllNodesUnderAttack {};
			class isMinorPlayer {};
			class changeTime {};
			class getOpenedHouses {};
			class findPatrolPoints {};
			class surrenderUnits {};
			class surrenderUnitsHC {};
			class findTriggerDominantSide {};
			class spawnSquad {};
			class spawnAPC {};
			class spawnTank {};
			class spawnTransport {};
			class spawnHelo {};
			class spawnHQ {};
			class spawnHeloTransport {};
			class spawnLightArmedVeh {};
			class spawnFighterPlane {};
			class spawnBoat {};
			class getOutScanner {};
			class addPoints {};
			class addPointsString {};
			class getPoints {};
			class addReserves {};
			class addVehReserves {};
			class addVehReservesString {};
			class getReserves {};
			class getVehReserves {};
			class getVehReservesString {};
			class getVehReservesPerTurn {};
			class getReservesPerTurn {};
			class getCommanderStyle {};
			class spawnBG {};
			class ambientMusic {};
			class initCommanders {};
			class getCommander {};
			class addPilot {};
			class findClosestSidedPlayer {};
			class getFactionName {};
			class getCowardice {};
			class isOtherThanPlaneInList {};
			class getSideSkill {};
			class daySpeedLoop {};
			class tpGroupOnMe {};
			class getSkipTurn{};
			class setSkipTurn{};
			class tryAddPoints {};
			class disarmUnit {};
			class gobackToFight {};
			class playCaptureAnim {};
			class getSkipTurnSupply {};
			class setSkipTurnSupply {};
		};
		class Events
		{
			class startAttack {};
			class prepareAttack {};
			class autoResolveAttack {};
			class bombTown {};
			class startOffensive {};
		};
		class Support
		{
			class artyOnPos {};
			class heliOnPos {};
			class reinfHeliOnPos {};
			class reinfOnNode {};
			class callForSupportOnNode {};
			class ammoOnPos {};
			class fireSupportArty {};
			class fireSupportCASPlane {};
			class fireSupportFlares {};
			class supportChooser {};
			class airStrike {};
		};
		class EventHandlers
		{
			class soldierEH {};
			class garriEH {};
			class vehEH {};
			class groupEH {};
		};
		class AICommander {
			class sideTick {};
			class divisionTick {};
			class getSidedFrontlineNodes {};
			class tickDefensive {};
			class tickAggressive {};
			class tickCautious {};
			class tickLoop {};
			class tickSupply {};
			class findBestBG {};
			class findBestBGDivision {};
			class findBestBGReserves {};
			class getSideNodes {};
			class convertBGToVehReserveCost {};
			class tickFrontlineSupplies {};
			class tickAggressiveDivision {};
		};
		class Save {
			class save {};
			class getDeployedReservesPoints {};
			class hintlastSave {};
			class eraseSave {};
		};
		class Send {
			class sendPoints {};
			class sendReserves {};
			class sendReservesAll {};
			class sendCommanderStyle {};
			class sendLogiPoints {};
		};
		class PlayerCommander {
			class openTimeMenu {};
			class openSelectAttack {};
			class openSelectCommander {};
			class playerPrepareAttack {};
			class changeCommanderStyle {};
			class openVehBuy {};
			class openPlaneBuy {};
			class openRecruitAI {};
			class despawnRecruit {};
			class spawnRecruit {};
			class spawnVehBuy {};
			class spawnPlaneBuy {};
			class openPlayerMenu {};
			class openTPMap {};
			class tpToFriendlyTown{};
			class teleportPlayer {};
			class playerReinf {};
			class toggleGhostMode {};
			class vehToGarage {};
			class openGiveNode {};
			class playerAmmo {};
		};
		class Raids {
			class generateRaid {};
			class generateConvoyAmbush {};
			class generateAssassination {};
			class generateStealIntel{};
			class spawnConvoyAmbush {};
			class spawnAssassination {};
			class spawnStealIntel{};
			class raidLoop {};
			class addRaidNb {};
		};
		class Civilian {
			class civilianLife {};
			class spawnNodeConditionCiv {};
			class civilianWalkLoop {};
		};
		class BaseBuilding {
			class openBuildMenu {};
			class sendLogiArray {};
			class makeLogiCrate {};
			class spawnLogiCrate {};
			class deleteLogiCrate {};
			class spawnBuildObject {};
			class reimburseBuildObject {};
			class spawnObjectMenu {};
			class saveBuiltObject {};
			class loadBuiltObjects {};
			class aidPostHeal {};
			class makeCamp {};
			class makeHQ {};
			class makeAmmo {};
			class makeAidPost {};
			class makeRadio{};
			class makeVehDepot {};
			class isFOBWithinDist {};
		};
		class HighCommand {
			class HCSpawnSquad {};
			class HCSpawnMotSquad {};
			class HCSpawnLightVeh {};
			class HCSpawnAPC {};
			class HCSpawnTank {};
			class HCValidateSpawnPos {};
			class HCSpawnClient {};
		};
		class Planes {
			class Planes {};
			class isPlayerInPlane {};
			class enablePlaneMode {};
			class disablePlaneMode {};
			class planeRaid_AmmoDepot {};
			class planeRaid_generateRaid {};
			class planeRaid_bomberSquadron {};
			class planeRaid_fighterSquadron {};
			class getThreatLevel {};
			class addThreatLevel {};
			class getSpawnedPlanes {};
			class addSpawnedPlanes {};
			class isPlayerInHeli {};
			class enableHeliMode {};
			class disableHeliMode {};
			class heliRaid_generateLogiRun {};
			class getRandomPilot {};
		};
		class Morale {
			class addMorale {};
			class initGroupMorale {};
			class moraleDeath {};
			class moraleCheck {};
			class moraleFlee {};
			class getMoraleOffset {};
			class addMoraleOffset {};
		};

		class Intel {
			class createIntel {};
			class generateStartIntel {};
			class reconParty {};
			class reconPartyClient {};
		};

		class Logistics {
			class createSeeLink {};
		}

		class Intro {
			class openIntroCam {};
		}

		class Division {
			class division {};
			class initDivisions {};
		}
	};
};