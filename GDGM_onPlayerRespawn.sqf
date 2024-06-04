params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

//Effet de camera au respawn
// execVM "scripts\cameraSpawn.sqf";
[] spawn GDGM_fnc_openIntroCam;

//set side 
_newUnit setVariable ["GDGM_side", side _newUnit];
_newUnit setVariable ["GDGM_ghostMode", (_oldUnit getVariable ["GDGM_ghostMode", false]), true];
_newUnit setVariable ["GDGM_hasDroppedCrate", false, true];