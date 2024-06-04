params["_client","_side"];
//_side -> string

GDGM_clientReservesEast = GDGM_OPFOR_reserves;
GDGM_clientReservesWest = GDGM_BLUFOR_reserves;
GDGM_clientReservesInd = GDGM_IND_reserves;


switch (_side) do {
	case "WEST": {
		GDGM_clientReserveTrucks = GDGM_BLUFOR_vehReserves select 0;
		GDGM_clientReserveAPC = GDGM_BLUFOR_vehReserves select 1;
		GDGM_clientReserveTanks = GDGM_BLUFOR_vehReserves select 2;
		GDGM_clientReserveTHeli = GDGM_BLUFOR_vehReserves select 3;
		GDGM_clientReserveCHeli = GDGM_BLUFOR_vehReserves select 4;
	};
	case "EAST": {
		GDGM_clientReserveTrucks = GDGM_OPFOR_vehReserves select 0;
		GDGM_clientReserveAPC = GDGM_OPFOR_vehReserves select 1;
		GDGM_clientReserveTanks = GDGM_OPFOR_vehReserves select 2;
		GDGM_clientReserveTHeli = GDGM_OPFOR_vehReserves select 3;
		GDGM_clientReserveCHeli = GDGM_OPFOR_vehReserves select 4;
	};
	case "GUER": {
		GDGM_clientReserveTrucks = GDGM_IND_vehReserves select 0;
		GDGM_clientReserveAPC = GDGM_IND_vehReserves select 1;
		GDGM_clientReserveTanks = GDGM_IND_vehReserves select 2;
		GDGM_clientReserveTHeli = GDGM_IND_vehReserves select 3;
		GDGM_clientReserveCHeli = GDGM_IND_vehReserves select 4;
	};
	default {
		GDGM_clientReserveTrucks = 0;
		GDGM_clientReserveAPC = 0;
		GDGM_clientReserveTanks = 0;
		GDGM_clientReserveTHeli = 0;
		GDGM_clientReserveCHeli = 0;
	};
};


_client publicVariableClient "GDGM_clientReservesEast";
_client publicVariableClient "GDGM_clientReservesWest";
_client publicVariableClient "GDGM_clientReservesInd";
_client publicVariableClient "GDGM_clientReserveTrucks";
_client publicVariableClient "GDGM_clientReserveAPC";
_client publicVariableClient "GDGM_clientReserveTanks";
_client publicVariableClient "GDGM_clientReserveTHeli";
_client publicVariableClient "GDGM_clientReserveCHeli";