//clientside
createDialog "dialogCas";

artillery_pieces_array_client = [];
ammo_array = [];
_artillery_names_array = [];

ctrlSetText [190613,GDGM_cas_X_coord]; //X
ctrlSetText [190614,GDGM_cas_Y_coord]; //Y
ctrlSetText [190615,GDGM_cas_timeOnTarget]; //shots

//get display name
{
	lbAdd [190616,_x];
} foreach ["fighter", "cas", "helo"];

while {dialog} do {
	GDGM_art_X_coord = ctrlText 040512;
	GDGM_art_Y_coord = ctrlText 040513;
	GDGM_art_shots = ctrlText 040515;
	GDGM_art_dist = ctrlText 040518;
	GDGM_art_angle = ctrlText 040519;
	sleep 0.3;
};


