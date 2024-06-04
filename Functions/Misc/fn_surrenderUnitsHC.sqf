params["_grp"];

private _units = units _grp;

{
	if(!alive _x || captive _x) then {continue};
	//get out of veh 
	if(vehicle _x != _x) then {
		doGetOut _x;
		sleep 2;
	};

	playSound3D [getMissionPath (selectRandom GDGM_surrenderVoices), _units select 0 , false, getPosASL _x,5,1,100];

	_x setVariable ["GDGM_owner", side _x];
	_x setCaptive true;

	[_x, "Don't shoot I surrender!", 100] call {
		params ["_unit", "_text", "_distance"];
		[_unit, _text] remoteExec ["globalChat", call BIS_fnc_listPlayers select { _x distance _unit < _distance }];
	};

	_x disableAI "ALL";
	_x enableAI "ANIM";
	_x setBehaviour "careless";
	_x setVariable ["GDGM_reserve", false];

	//drops weapons 
	// _weapon = currentWeapon _x;   
	// _x removeWeapon (_weapon);
	// sleep 0.1;
	// _weaponHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
	// _weaponHolder addWeaponCargoGlobal [_weapon,1];
	// _weaponHolder setPos (_x modelToWorld [0,.2,1.2]);
	// _weaponHolder disableCollisionWith _x;
	// _dir = random(360);
	// _speed = 1.5;
	// _weaponHolder setVelocity [_speed * sin(_dir), _speed * cos(_dir),1];  

	// animations
	// sleep 0.5;

	private _logic = "Logic" createVehicle (getPosASL _x);
	_x attachTo [_logic];
	_x setVariable["GDGM_logic", _logic];
	_x playMoveNow (selectRandom ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02", "ApanPknlMstpSnonWnonDnon_G03"]);

	_x addEventHandler ["Deleted", {
		params ["_entity"];

		deleteVehicle (_entity getVariable "GDGM_logic");
	}];

	[
		_x,													// Object the action is attached to
		"Catpure",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3 && side _this != (_target getVariable 'GDGM_owner')",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];

			_target switchMove (selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02"]);
		},				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration in seconds
		0,													// Priority
		true,												// Remove on completion
		false												// Show in unconscious state
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation

	[
		_x,													// Object the action is attached to
		"Put blindfold",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3 && side _this != (_target getVariable 'GDGM_owner')",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];

			removeGoggles _target;
			_target addGoggles "G_blindfold_01_white_F";

		},				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration in seconds
		0,													// Priority
		true,												// Remove on completion
		false												// Show in unconscious state
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation

	[
		_x,													// Object the action is attached to
		"Disarm",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3 && side _this != (_target getVariable 'GDGM_owner')",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];

			private _weapons = weapons _target;
			private _items = items _target;
			private _magazines = magazines _target;
			private _head = [headgear _target];

			removeAllWeapons _target;
			removeHeadgear _target;
			// removeVest _target;
			removeBackpack _target;

			private _weaponHolder = createVehicle ["groundweaponholder", getPos _target, [], 0, "CAN_COLLIDE"];		

			{
				_weaponHolder addWeaponCargoGlobal [_x, 1];				
			} forEach _weapons;

			{
				_weaponHolder addItemCargoGlobal [_x, 1];		
			} forEach (_items + _head);

			{
				_weaponHolder addMagazineCargoGlobal [_x, 1];	
			} forEach _magazines;


		},				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration in seconds
		0,													// Priority
		true,												// Remove on completion
		false												// Show in unconscious state
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation

	[
		_x,													// Object the action is attached to
		"Go back to fight!",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 3 && side _this == (_target getVariable 'GDGM_owner')",						// Condition for the action to be shown
		"_caller distance _target < 3",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];

			_target setCaptive false;
			_target setBehaviour "aware";
			_target enableAI "ALL";
			_target switchMove "";

		},				// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration in seconds
		0,													// Priority
		true,												// Remove on completion
		false												// Show in unconscious state
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation
	
} forEach _units;

//prone anims 
// ApanPpneMstpSnonWnonDnon_G01
// ApanPpneMstpSnonWnonDnon_G02
// ApanPpneMstpSnonWnonDnon_G03

//captured anims 
// Acts_AidlPsitMstpSsurWnonDnon01
// Acts_AidlPsitMstpSsurWnonDnon02

// being interrogated 
// Acts_ExecutionVictim_Loop

//classic surrender anim 
// AmovPercMstpSsurWnonDnon