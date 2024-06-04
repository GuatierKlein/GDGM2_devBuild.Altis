params ["_crate", "_points", "_unit"];

clearmagazineCargoGlobal _crate;
clearweaponcargoGlobal _crate;
clearItemCargoGlobal _crate;
_crate setVariable ["GDGM_isBeingMoved", false, true];
_crate setVariable ["gdgm_logi_points", _points, true];

GDGM_logiCrateArray pushBack _crate;

//destroy action 
[
	_crate,											// Object the action is attached to
	"<t color='#ff0303'>Destroy</t>",	// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",						// Condition for the action to be shown
	"_caller distance _target < 3",						// Condition for the action to progress
	{},  // Code executed when action starts
	{},													// Code executed on every progress tick
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"]; 
		
		_target remoteExec ["GDGM_fnc_deleteLogiCrate",2];				
	},				
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	3,													// Action duration [s]
	0,													// Priority
	false,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];	// MP compatible implementation

[_crate,[
	"Display points left",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_points = _target getVariable "gdgm_logi_points";
		_msg = str _points + " points left";
		systemChat _msg;
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	false,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	3,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
]] remoteExec ["addAction",0,true];

[_crate,[
	"Move crate",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_target setVariable ["GDGM_isBeingMoved",true,true];
		_target setPosASL (getPosASL _target vectorAdd [0,0,1]);
		_target attachTo [_caller];
		_caller forceWalk true;
		_caller setVariable ["GDGM_carriedCrate",_target];
		_caller addAction [
			"Release crate",	// title
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				_crate = _target getVariable "GDGM_carriedCrate";
				detach _crate;
				_crate setVariable ["GDGM_isBeingMoved",false,true];
				_target removeAction _actionId;
				_crate setVelocity [0,0,-0.5];
				_target forceWalk false;
			},
			nil,		// arguments
			1.5,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"true", 	// condition
			10,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
		]
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	false,		// hideOnUse
	"",			// shortcut
	"!(_target getVariable 'GDGM_isBeingMoved')", 	// condition
	3,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
]] remoteExec ["addAction",0,true];

//attach
// if(!isNil "_unit") then {
// 	_crate setVariable ["GDGM_isBeingMoved",true,true];
// 	_crate setPosASL (getPosASL _crate vectorAdd [0,0,1]);
// 	_crate attachTo [_unit, [0,0,1]];
// 	_unit forceWalk true;
// 	_unit setVariable ["GDGM_carriedCrate",_crate];
// 	_unit addAction [
// 		"Release crate",	// title
// 		{
// 			params ["_target", "_caller", "_actionId", "_arguments"]; // script
// 			_crate = _target getVariable "GDGM_carriedCrate";
// 			detach _crate;
// 			_crate setVariable ["GDGM_isBeingMoved",false,true];
// 			_target removeAction _actionId;
// 			_crate setVelocity [0,0,-0.5];
// 			_target forceWalk false;
// 		},
// 		nil,		// arguments
// 		1.5,		// priority
// 		true,		// showWindow
// 		true,		// hideOnUse
// 		"",			// shortcut
// 		"true", 	// condition
// 		10,			// radius
// 		false,		// unconscious
// 		"",			// selection
// 		""			// memoryPoint
// 	];
// };



