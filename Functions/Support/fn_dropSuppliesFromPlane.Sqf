params["_plane", "_gearMap"];

//medical crate
private _crate1 = "ACE_medicalSupplyCrate" createVehicle ([0,0,0]);
_para = createVehicle ["B_Parachute_02_F", (getPosATL _plane) vectorAdd [0, 0, -5], [], 0, "CAN_COLLIDE"];
_crate1 attachTo [_para, [0, 0, -0.5]];

sleep 1;

//spawn custon crate
_crate2 = "Box_Syndicate_Ammo_F" createVehicle ([0,0,0]);
clearItemCargoGlobal _crate2;
clearMagazineCargoGlobal _crate2;
clearWeaponCargoGlobal _crate2;
_para = createVehicle ["B_Parachute_02_F", (getPosATL _plane) vectorAdd [0, 0, -5], [], 0, "CAN_COLLIDE"];
_crate2 attachTo [_para, [0, 0, -0.5]];

//add inventory
// {
// 	_crate addMagazineCargoGlobal [_x, _y];
// } forEach _gearMap;

_crate2 addItemCargoGlobal ["Toolkit", 1];
_crate2 addItemCargoGlobal ["Medikit", 10];

//kit select 
[[_crate2], "scripts\kit_select\kitSelectAction.sqf"] remoteExec["execVM",0];

sleep 1;

//spawn custon crate
_crate3 = "Box_Syndicate_Ammo_F" createVehicle ([0,0,0]);
clearItemCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;
clearWeaponCargoGlobal _crate3;
_para = createVehicle ["B_Parachute_02_F", (getPosATL _plane) vectorAdd [0, 0, -5], [], 0, "CAN_COLLIDE"];
_crate3 attachTo [_para, [0, 0, -0.5]];

//add inventory
// {
// 	_crate addMagazineCargoGlobal [_x, _y];
// } forEach _gearMap;

_crate3 addItemCargoGlobal ["Toolkit", 1];
_crate3 addItemCargoGlobal ["Medikit", 10];

//kit select 
[[_crate3], "scripts\kit_select\kitSelectAction.sqf"] remoteExec["execVM",0];

sleep 20;
_smoke = "SmokeShellBlue" createVehicle position _crate1;
_smoke attachTo [_crate1, [0,0,0]];
sleep 1;
_smoke = "SmokeShellBlue" createVehicle position _crate2;
_smoke attachTo [_crate2, [0,0,0]];
sleep 1;
_smoke = "SmokeShellBlue" createVehicle position _crate3;
_smoke attachTo [_crate3, [0,0,0]];