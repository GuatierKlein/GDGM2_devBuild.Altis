//key 199

params["_ehData"];

private _key = _ehData select 1;
private _shift = _ehData select 2;

if!(_key == 199 && _shift) exitWith{}; 

hint "Chargement des données serveur... Patientez";

private _data = [missionNamespace, "GDGM_logiData", []] call BIS_fnc_getServerVariable;

// Vérifie qu'on a bien reçu les données
if (_data isEqualTo [] || count _data < 12) exitWith {
    hint "Erreur : données logistiques manquantes ou incomplètes.";
};

closeDialog 0;
createDialog "dialogPlayerMenu";

_data params [
    "_OPFOR_supplies",
    "_IND_supplies",
    "_BLUFOR_supplies",
    "_OPFOR_reserves",
    "_IND_reserves",
    "_BLUFOR_reserves",
    "_player_supplies",
    "_player_reserves",
    "_OPFOR_vehReserves",
    "_IND_vehReserves",
    "_BLUFOR_vehReserves",
    "_player_vehReserves"
];

//label init
_GDGM_clientReserveTrucks = "";
_GDGM_clientReserveAPC = "";
_GDGM_clientReserveTanks = "";
_GDGM_clientReserveTHeli = "";
_GDGM_clientReserveCHeli = "";

_GDGM_BLUFOR_supplies = "";
_GDGM_OPFOR_supplies = "";
_GDGM_IND_supplies = "";

_GDGM_BLUFOR_reserves = "";
_GDGM_OPFOR_reserves = "";
_GDGM_IND_reserves = "";

switch (GDGM_playerSide) do {
	case west: {
		_GDGM_BLUFOR_supplies = str _BLUFOR_supplies + "|" + (str _player_supplies);
		_GDGM_OPFOR_supplies = str _OPFOR_reserves;
		_GDGM_IND_supplies = str _IND_supplies;

		_GDGM_BLUFOR_reserves = str _BLUFOR_reserves + "|" + (str _player_reserves);
		_GDGM_OPFOR_reserves = str _OPFOR_reserves;
		_GDGM_IND_reserves = str _IND_reserves;

		_GDGM_clientReserveTrucks = (str (_BLUFOR_vehReserves select 0)) + "|" + (str (_player_vehReserves select 0)); 
		_GDGM_clientReserveAPC = (str (_BLUFOR_vehReserves select 1)) + "|"  + (str (_player_vehReserves select 1));
		_GDGM_clientReserveTanks = (str (_BLUFOR_vehReserves select 2)) + "|"  + (str (_player_vehReserves select 2));
		_GDGM_clientReserveTHeli = (str (_BLUFOR_vehReserves select 3)) + "|"  + (str (_player_vehReserves select 3));
		_GDGM_clientReserveCHeli = (str (_BLUFOR_vehReserves select 4)) + "|"  + (str (_player_vehReserves select 4));
	};
	case east: {
		_GDGM_BLUFOR_supplies = str _BLUFOR_supplies;
		_GDGM_OPFOR_supplies = str _OPFOR_supplies + "|" + (str _player_supplies);
		_GDGM_IND_supplies = str _IND_supplies;

		_GDGM_BLUFOR_reserves = str _BLUFOR_reserves;
		_GDGM_OPFOR_reserves =str _OPFOR_reserves + "|" + (str _player_reserves);
		_GDGM_IND_reserves = str _IND_reserves;

		_GDGM_clientReserveTrucks = (str (_OPFOR_vehReserves select 0)) + "|"  + (str (_player_vehReserves select 0)); 
		_GDGM_clientReserveAPC = (str (_OPFOR_vehReserves select 1)) + "|"  + (str (_player_vehReserves select 1));
		_GDGM_clientReserveTanks = (str (_OPFOR_vehReserves select 2)) + "|"  + (str (_player_vehReserves select 2));
		_GDGM_clientReserveTHeli = (str (_OPFOR_vehReserves select 3)) + "|"  + (str (_player_vehReserves select 3));
		_GDGM_clientReserveCHeli = (str (_OPFOR_vehReserves select 4)) + "|"  + (str (_player_vehReserves select 4));
	};
	case independent: {
		_GDGM_BLUFOR_supplies = str _BLUFOR_supplies;
		_GDGM_OPFOR_supplies = str _OPFOR_supplies;
		_GDGM_IND_supplies = str _IND_supplies + "|" + (str _player_supplies);

		_GDGM_BLUFOR_reserves = str _BLUFOR_reserves;
		_GDGM_OPFOR_reserves = str _OPFOR_reserves;
		_GDGM_IND_reserves = str _IND_reserves + "|" + (str _player_reserves);

		_GDGM_clientReserveTrucks = (str (_IND_vehReserves select 0)) + "|"  + (str (_player_vehReserves select 0)); 
		_GDGM_clientReserveAPC = (str (_IND_vehReserves select 1)) + "|"  + (str (_player_vehReserves select 1));
		_GDGM_clientReserveTanks = (str (_IND_vehReserves select 2)) + "|"  + (str (_player_vehReserves select 2));
		_GDGM_clientReserveTHeli = (str (_IND_vehReserves select 3)) + "|"  + (str (_player_vehReserves select 3));
		_GDGM_clientReserveCHeli = (str (_IND_vehReserves select 4)) + "|"  + (str (_player_vehReserves select 4));
	};
};

hint "Menu ouvert";

ctrlSetText [110311, _GDGM_BLUFOR_supplies]; //west
ctrlSetText [110312, _GDGM_OPFOR_supplies]; //east
ctrlSetText [110313, _GDGM_IND_supplies]; //independent

ctrlSetText [08053, _GDGM_BLUFOR_reserves]; //west
ctrlSetText [08052, _GDGM_OPFOR_reserves]; //east
ctrlSetText [08051, _GDGM_IND_reserves]; //independent

ctrlSetText [29051, _GDGM_clientReserveTrucks]; //trucks
ctrlSetText [29052, _GDGM_clientReserveAPC]; //apc
ctrlSetText [29053, _GDGM_clientReserveTanks]; //tanks
ctrlSetText [29054, _GDGM_clientReserveTHeli]; //thelo
ctrlSetText [29055, _GDGM_clientReserveCHeli]; //chelo

if(player getVariable "GDGM_ghostMode") then {
	ctrlSetText [01091, "Deactivate ghost mode"];
} else {
	ctrlSetText [01091, "Activate ghost mode"];
};


