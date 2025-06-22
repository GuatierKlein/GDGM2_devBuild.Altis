//clientside
createDialog "dialogCas";

artillery_pieces_array_client = [];
ammo_array = [];
_artillery_names_array = [];

ctrlSetText [190613,GDGM_cas_X_coord]; //X
ctrlSetText [190614,GDGM_cas_Y_coord]; //Y
ctrlSetText [190615,GDGM_cas_timeOnTarget]; //shots

//get display name
lbAdd [190616, "fighter"];
lbAdd [190616, "cas"];

if(GDGM_enableHelicopters) then {
	lbAdd [190616, "helo"];
};

while {dialog} do {
	GDGM_cas_X_coord = ctrlText 040512;
	GDGM_cas_Y_coord = ctrlText 040513;
	GDGM_cas_timeOnTarget = ctrlText 040515;
	sleep 0.3;
};


