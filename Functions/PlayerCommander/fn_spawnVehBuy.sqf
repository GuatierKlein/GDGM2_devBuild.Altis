params[["_useMap", false]];

private _index = lbCurSel 160412;
private _veh = lbData [160412,_index];
private _trucksPool = [];
private _APCPool = [];
private _tankPool = [];
private _okBuy = false;
GDGM_spawnVehMapPos = [];
GDGM_exitFunction = false;

closeDialog 0;

if(_useMap) then {
	openMap true;
	systemChat "Click on the map to choose the spawn position";

	GDGM_spawnVehMapClickEH = addMissionEventHandler ["Map", {
		params ["_mapIsOpened", "_mapIsForced"];

		if(!_mapIsOpened) then {
			onMapSingleClick "";
			removeMissionEventHandler ["Map", _thisEventHandler];
			systemChat "Spawn canceled";
			GDGM_exitFunction = true;
		};
	}];

	private _code = "GDGM_spawnVehMapPos = _pos;";
	onMapSingleClick (_code + "; onMapSingleClick ''; removeMissionEventHandler ['Map', GDGM_spawnVehMapClickEH]; openMap false; true");
	waitUntil{count GDGM_spawnVehMapPos != 0 || GDGM_exitFunction};
};

if(GDGM_exitFunction) exitWith {};

systemChat "Spawning vehicle!";

//check reserves 
GDGM_clientReserveTrucks = -1;
GDGM_clientReserveAPC = -1;
GDGM_clientReserveTanks = -1;

[clientOwner, str (side player)] remoteExecCall ["GDGM_fnc_sendReservesAll",2]; 

_trucksPool = GDGM_PLAYERS_transports + GDGM_PLAYERS_lightArmedVeh; 
_APCPool = GDGM_PLAYERS_heavyArmedVeh; 
_tankPool = GDGM_PLAYERS_tanks;

waitUntil { 
	GDGM_clientReserveTrucks != -1
	&& GDGM_clientReserveAPC != -1
	&& GDGM_clientReserveTanks != -1
};

if(_veh in _trucksPool) then {
	//truck
	_okBuy = GDGM_clientReserveTrucks > 0;
	if(_okBuy) then {
		[str (side player), [-1,0,0,0,0]] remoteExec["GDGM_fnc_addVehReservesString",2];
	};
} else {
	if(_veh in _APCPool) then {
		//apc
		_okBuy = GDGM_clientReserveAPC > 0;
		if(_okBuy) then {
			[str (side player), [0,-1,0,0,0]] remoteExec["GDGM_fnc_addVehReservesString",2];
		};
	} else {
		//tank
		_okBuy = GDGM_clientReserveTanks > 0;
		if(_okBuy) then {
			[str (side player), [0,0,-1,0,0]] remoteExec["GDGM_fnc_addVehReservesString",2];
		};
	};
};

private _vehName = getText (configFile >> "CfgVehicles" >> _veh >> "displayName");
if(!_okBuy) exitWith {
	hint ("Not enough " + _vehName + " in reserve");
};

["GDGM_vehSpawned", [_vehName]] call BIS_fnc_showNotification;

// _client publicVariableClient "GDGM_clientReservesEast";
// _client publicVariableClient "GDGM_clientReservesWest";
// _client publicVariableClient "GDGM_clientReservesInd";
// _client publicVariableClient "GDGM_clientReserveTrucks";
// _client publicVariableClient "GDGM_clientReserveAPC";
// _client publicVariableClient "GDGM_clientReserveTanks";
// _client publicVariableClient "GDGM_clientReserveTHeli";
// _client publicVariableClient "GDGM_clientReserveCHeli";

private _spawnPos = getMarkerPos "GDGM_vehMarkerPos";
if(_useMap) then {
	_spawnPos = GDGM_spawnVehMapPos;
};

_vehicle = _veh createVehicle _spawnPos; 

[
	_vehicle,											// Object the action is attached to
	"Put to garage",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 5",						// Condition for the action to be shown
	"_caller distance _target < 5",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ [clientOwner, side player, _target] remoteExec["GDGM_fnc_vehToGarage",2] },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration in seconds
	0,													// Priority
	false,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _vehicle];	// MP compatible implementation

if(GDGM_addAddPilot) then {
	_vehicle setVariable ["GDGM_hasDriver",false,true];

	[_vehicle,[
		"<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Spawn AI pilot",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script

			[_target, str (side player)] spawn GDGM_fnc_addPilot;
		},
		nil,		// arguments
		1.5,		// priority
		true,		// showWindow
		false,		// hideOnUse
		"",			// shortcut
		"!(_target getVariable 'GDGM_hasDriver') && player in (crew _target)", 	// condition
		3,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	]] remoteExec ["addAction",0,true];

	[_vehicle,[
		"<t color='#FFFFFF' size='1.1'><img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa'></img><t color='#ffd700' size='1.1' font='PuristaBold'> Delete AI pilot",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script

			deleteVehicle (_target getVariable "GDGM_driver");
			_target setVariable ["GDGM_hasDriver",false,true];
			hint "Pilot deleted";
		},
		nil,		// arguments
		1.5,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"_target getVariable 'GDGM_hasDriver' && player in (crew _target)", 	// condition
		3,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	]] remoteExec ["addAction",0,true];
};
