#include "GDGM_onPlayerRespawn.sqf";

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

call BAR_fnc_applyKit;

if(!isNil "BAR_enableCustomKitOnRespawn") then {
	if(BAR_enableCustomKitOnRespawn) then {
		player setUnitLoadout BAR_customKit;
	};
};


