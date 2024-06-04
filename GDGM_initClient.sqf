#include "Data\Battlegroups\main.sqf";
#include "Data\Installations\buildables.sqf";
#include "GDGM_settings.sqf";

waitUntil{!isNull (findDisplay 46)};

GDGM_keyDownEH = findDisplay 46 displayAddEventHandler ["KeyDown", { [_this] spawn GDGM_fnc_openPlayerMenu }];