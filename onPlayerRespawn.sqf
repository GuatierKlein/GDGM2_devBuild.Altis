#include "GDGM_onPlayerRespawn.sqf";

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

call BAR_fnc_applyKit;

if(!isNil "BAR_enableCustomKitOnRespawn") then {
	if(BAR_enableCustomKitOnRespawn) then {
		player setUnitLoadout BAR_customKit;
	};
};



// player addAction
// [
// 	"<t color='#0044c2'>Arty menu</t>",	// title
// 	{
// 		execVM "scripts\arty\arty_openmenu.sqf";
// 	},
// 	nil,		// arguments
// 	1.5,		// priority
// 	true,		// showWindow
// 	true,		// hideOnUse
// 	"",			// shortcut
// 	"backpack player == 'UK3CB_ION_O_B_RadioBag_DES'", 	// condition
// 	5,			// radius
// 	false,		// unconscious
// 	"",			// selection
// 	""			// memoryPoint
// ];


