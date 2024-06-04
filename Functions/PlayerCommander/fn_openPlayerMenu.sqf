//key 199

params["_ehData"];

private _key = _ehData select 1;
private _shift = _ehData select 2;

if!(_key == 199 && _shift) exitWith{}; 

closeDialog 0;
createDialog "dialogPlayerMenu";

GDGM_clientPointsEast = -1000;
GDGM_clientPointsWest = -1000;
GDGM_clientPointsInd = -1000;

GDGM_clientReservesEast = -1000;
GDGM_clientReservesWest = -1000;
GDGM_clientReservesInd = -1000;

GDGM_clientReserveTrucks = -1;
GDGM_clientReserveAPC = -1;
GDGM_clientReserveTanks = -1;
GDGM_clientReserveTHeli = -1;
GDGM_clientReserveCHeli = -1;



[clientOwner] remoteExec ["GDGM_fnc_sendLogiPoints",2]; 
[clientOwner, str (side player)] remoteExec ["GDGM_fnc_sendReservesAll",2]; 

waitUntil { 
	GDGM_clientPointsEast != -1000 
	&& GDGM_clientPointsWest != -1000 
	&& GDGM_clientPointsInd != -1000
	&& GDGM_clientReservesEast != -1000
	&& GDGM_clientReservesWest != -1000
	&& GDGM_clientReservesInd != -1000
	&& GDGM_clientReserveTrucks != -1
	&& GDGM_clientReserveAPC != -1
	&& GDGM_clientReserveTanks != -1
	&& GDGM_clientReserveTHeli != -1
	&& GDGM_clientReserveCHeli != -1
};

ctrlSetText [110311, str GDGM_clientPointsWest]; //west
ctrlSetText [110312, str GDGM_clientPointsEast]; //east
ctrlSetText [110313, str GDGM_clientPointsInd]; //independent

ctrlSetText [08053, str GDGM_clientReservesWest]; //west
ctrlSetText [08052, str GDGM_clientReservesEast]; //east
ctrlSetText [08051, str GDGM_clientReservesInd]; //independent

ctrlSetText [29051, str GDGM_clientReserveTrucks]; //trucks
ctrlSetText [29052, str GDGM_clientReserveAPC]; //apc
ctrlSetText [29053, str GDGM_clientReserveTanks]; //tanks
ctrlSetText [29054, str GDGM_clientReserveTHeli]; //thelo
ctrlSetText [29055, str GDGM_clientReserveCHeli]; //chelo

if(player getVariable "GDGM_ghostMode") then {
	ctrlSetText [01091, "Deactivate ghost mode"];
} else {
	ctrlSetText [01091, "Activate ghost mode"];
};


