
params["_object_name","_unit","_id","_cost","_disableSim",["_type", ""]];
private _canBuy = true;
private _points = 0;
private _costCopy = _cost;

//buy
if (count GDGM_logiCrateArray != 0) then {
{
	if (_unit distance _x < 50) then {
		_points = _points + (_x getVariable "gdgm_logi_points"); 
	};
} foreach GDGM_logiCrateArray;
} else {
	//no crates
	"There is no logistic crate on the map" remoteExec ["systemChat",_id];
	_canBuy = false;
};

//not enough points 
if(_cost > _points && _canBuy) then {
	"Not enough points" remoteExec ["systemChat",_id];
	_canBuy = false;
};

if (!_canBuy) exitwith{};

//spend points
{
	if (_unit distance _x < 50) then {
		private _pointsCrate = _x getVariable "gdgm_logi_points";
		if(_pointsCrate - _cost > 0) then {
			_x setVariable ["gdgm_logi_points",_pointsCrate - _cost];
			"Object bought!" remoteExec ["systemChat",_id];
			break;
		};
		_x setVariable ["gdgm_logi_points",0];
		_cost = _cost - _pointsCrate;
	};
} foreach GDGM_logiCrateArray;	

//obj creation 
private _spawn_pos =_unit getRelPos [7,0];
private _height = (getPosATL _unit) select 2;
_spawn_pos = _spawn_pos vectorAdd [0,0,_height];
private _object = createVehicle [_object_name, _spawn_pos, [], 0, "CAN_COLLIDE"];

if(_disableSim) then {
	_object enableSimulation false;
};

_object attachTo [_unit];
_height = (getPosATL _unit) select 2;


_object setVariable ["gdgm_object_cost",_costCopy,true]; 
_object setVariable ["gdgm_object_confirmation",false,true]; 

//action place obj 
[_unit,
	["<t color='#DF0303'>Place object</t>",	
		{	
			params ["_target", "_caller", "_actionId", "_arguments"];	
			_id = clientOwner;
			_objects = attachedObjects _target;			
			{
				detach _x; 
				//move up 0.1
				_action_id = [_x,
					["<t color='#990000'>Move up - 0.1</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];	
							_target setPosASL ((getPosASL _target) vectorAdd [0,0,0.1]);	
							//_pos = (getPosASL _target) vectorAdd [0,0,0.1];
							//[_target,_pos] remoteExec ["setPosASL",0];
						},
						nil,		// arguments
						9,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//move up 1
				_action_id = [_x,
					["<t color='#ff0303'>Move up - 1</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_target setPosASL ((getPosASL _target) vectorAdd [0,0,1]);
							//_pos = (getPosASL _target) vectorAdd [0,0,1];
							//[_target,_pos] remoteExec ["setPosASL",0];
						},
						nil,		// arguments
						9,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//move down 0.1 
				_action_id = [_x,
					["<t color='#007a00'>Move down - 0.1</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_target setPosASL ((getPosASL _target) vectorAdd [0,0,-0.1]);
							//_pos = (getPosASL _target) vectorAdd [0,0,-0.1];
							//[_target,_pos] remoteExec ["setPosASL",0];
						},
						nil,		// arguments
						8,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//move down 1
				_action_id = [_x,
					["<t color='#00d100'>Move down - 1</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_target setPosASL ((getPosASL _target) vectorAdd [0,0,-1]);
							//_pos = (getPosASL _target) vectorAdd [0,0,-1];
							//[_target,_pos] remoteExec ["setPosASL",0];
						},
						nil,		// arguments
						8,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//rotate left 10
				_action_id = [_x,
					["<t color='#ebeb00'>Rotate left - 10</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_dir = getDir _target;
							_target setDir _dir - 10;
							_target setPosASL getPosASL _target;
						},
						nil,		// arguments
						7,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//rotate right 10
				_action_id = [_x,
					["<t color='#ebeb00'>Rotate right - 10</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_dir = getDir _target;
							_target setDir _dir + 10;
							_target setPosASL getPosASL _target;
						},
						nil,		// arguments
						7,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//rotate left 1
				_action_id = [_x,
					["<t color='#969602'>Rotate left - 1</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_dir = getDir _target;
							_target setDir _dir - 1;
							_target setPosASL getPosASL _target;								
						},
						nil,		// arguments
						7,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//rotate right 1
				_action_id = [_x,
					["<t color='#ebeb00'>Rotate right - 1</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_dir = getDir _target;
							_target setDir _dir + 1;
							_target setPosASL getPosASL _target;
						},
						nil,		// arguments
						7,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//rotate 180
				_action_id = [_x,
					["<t color='#969602'>Rotate - 180</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_dir = getDir _target;
							_target setDir _dir + 180;
							_target setPosASL getPosASL _target;
						},
						nil,		// arguments
						7,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//comfirm  
				_action_id = [_x,
					["<t color='#0015cf'>Comfirm position</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];			
							_target setVariable ["gdgm_object_confirmation",true,true]; 
							_target remoteExec ["removeAllActions",0];
						},
						nil,		// arguments
						6,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
				//delete  
				_action_id = [_x,
					["<t color='#0015cf'>Delete</t>",	
						{	
							params ["_target", "_caller", "_actionId", "_arguments"];
							_cost = _target getVariable ["gdgm_object_cost",50];
							[getPos _target,_cost] remoteExecCall ["GDGM_fnc_reimburseBuildObject",2];			
							deleteVehicle _target;
							systemChat "Object deleted and reimbursed"
						},
						nil,		// arguments
						6,		// priority
						true,		// showWindow
						true,		// hideOnUse
						"",			// shortcut
						"", 	// condition
						10,			// radius
						false,		// unconscious
						"",			// selection
						""			// memoryPoint
				]] remoteExec ["addAction",_id];
			} foreach _objects;
			
			_target removeAction _actionId; 
			},
			nil,		// arguments
			10,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"", 	// condition
			10,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint
	]] remoteExec ["addAction",_id];	

//timer to deletion 
"Object will auto delete in 2 min if not comfirmed" remoteExec ["systemChat",_id];
_comfirmed = false;
_i = 0;

while {!isNull _object && !_comfirmed && _i < 120} do { 
	_comfirmed = _object getVariable "gdgm_object_confirmation";
	_i = _i + 1;
	sleep 1;
};

if (_i == 120 && !isNull _object) then {
	"1 object got deleted due to non confirmation and you got your points back" remoteExec ["systemChat",_id];
	deleteVehicle _object;
	[getPos _object,_cost] remoteExecCall ["GDGM_fnc_reimburseBuildObject",2];		
} else {
	if (!isNull _object) then {
		"Object placement comfirmed!" remoteExec ["systemChat",_id];
		[_object,
			["<t color='#0015cf'>Save</t>",	
				{	
					params ["_target", "_caller", "_actionId", "_arguments"];
					_id = clientOwner;
					[_target,_id] remoteExec ["GDGM_fnc_saveBuiltObject",2];	
					removeAllActions _target;
				},
				nil,		// arguments
				6,		// priority
				true,		// showWindow
				true,		// hideOnUse
				"",			// shortcut
				"", 	// condition
				5,			// radius
				false,		// unconscious
				"",			// selection
				""			// memoryPoint
		]] remoteExec ["addAction",_id];

		if(_type != "") then {
			switch (_type) do {
				case "camp": { [_object] spawn GDGM_fnc_makeCamp };
				case "hq": { [_object] spawn GDGM_fnc_makeHQ };
				case "ammo": { [_object] spawn GDGM_fnc_makeAmmo };
				case "aid": { [_object] spawn GDGM_fnc_makeAidPost };
				case "radio": { [_object] spawn GDGM_fnc_makeRadio };
				case "veh": { [_object] spawn GDGM_fnc_makeVehDepot };
				default { };
			};
		};
	};
};

