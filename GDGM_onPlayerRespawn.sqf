params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

//Effet de camera au respawn
// execVM "scripts\cameraSpawn.sqf";
[] spawn GDGM_fnc_openIntroCam;

//set side 
_newUnit setVariable ["GDGM_side", side _newUnit];
_newUnit setVariable ["GDGM_ghostMode", (_oldUnit getVariable ["GDGM_ghostMode", false]), true];
_newUnit setVariable ["GDGM_hasDroppedCrate", false, true];

player addAction
[
	"<t color='#0044c2'>Arty menu</t>",	// title
	{
		execVM "scripts\arty\arty_openmenu.sqf";
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"backpack player == 'B_assaultPack_khk'", 	// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

player addAction
[
	"<t color='#0044c2'>Air Support menu</t>",	// title
	{
		[] spawn GDGM_fnc_openCasMenu;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"backpack player == 'B_assaultPack_khk'", 	// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];