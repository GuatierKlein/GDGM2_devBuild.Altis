// [[[[Unitpool, amount], ...], supply cost, reserves necessary, display name, combat power],...]
//unitPool = "heavyveh"...

/*
Values 
7 men per squad 
2 per apc 
1 per transport
*/


GDGM_battlegroupPool = [];

//small infantry BG 
GDGM_battlegroupPool pushBack [[["squad", 2]], 15, 14 , "2 infantry squads", 30];
GDGM_battlegroupPool pushBack [[["squad", 4]], 30, 28 , "1 infantry platoon", 60];

//medium infantry BG 
GDGM_battlegroupPool pushBack [[["lightVeh", 2], ["squad", 4] ], 40, 32, "1 infantry platoon", 90];
GDGM_battlegroupPool pushBack [[["lightVeh", 2], ["Msquad", 4] ], 80, 32, "1 Motorized platoon", 100];

//medium infantry BG 
// GDGM_battlegroupPool pushBack [[["lightVeh", 2], ["squad", 8] ], 80, 70, "2 infantry platoons", 150];

//small mechanised BG 
GDGM_battlegroupPool pushBack [[["apc", 1], ["Msquad", 3]], 100, 26, "1 mechanized platoon", 120];

//medium mechanised BG 
GDGM_battlegroupPool pushBack [[["apc", 2], ["Msquad", 6]], 200, 54, "2 mechanized platoon", 240];

GDGM_battlegroupPool pushBack [[["tank", 1], ["apc", 1], ["Msquad", 3]], 150, 29, "1 armored platoon", 150];
GDGM_battlegroupPool pushBack [[["tank", 1], ["apc", 2], ["Msquad", 6]], 300, 57, "2 armored platoon", 300];

//medium mechanised BG 
// GDGM_battlegroupPool pushBack [[["apc", 6], ["Msquad", 10]], 45, 92, "1 mechanized company", 180];
//price = 5 * 4 + 3 * 15 == 65

// //small armored BG 
// GDGM_battlegroupPool pushBack [[["Msquad",8], ["tank", 2], ["apc", 2]], 100, "Armored platoon (40 men)"];
// //price = 5 * 4 + 2 * 15 + 2 * 20 == 110

// //medium armored BG 
// GDGM_battlegroupPool pushBack [[["Msquad",10], ["tank", 2], ["apc", 4]], 120, "Armored platoon (50 men)"];
// //price = 5 * 4 + 4 * 15 + 2 * 20 == 120
//lightVeh