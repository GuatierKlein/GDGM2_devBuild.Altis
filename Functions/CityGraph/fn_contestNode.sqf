params["_node"];

//percentage of owner troops in all troops
//capture when reaches 10%

private _owner = _node getVariable "GDGM_owner";
private _pos = _node getVariable "GDGM_position";

//trigger 
private _trg = createTrigger ["EmptyDetector", _pos];	
_trg setTriggerArea [GDGM_nodeContestArea, GDGM_nodeContestArea, 0, false];	
_trg setTriggerActivation ["ANY", "PRESENT", true]; 
_trg setTriggerStatements ["this", "", ""];

sleep 5;

private _arrayList = list _trg;
private _tmpArray = [];
private _count = 0;
private _ownerCount = 0;
private _name = _node getVariable "GDGM_name";
private _msg = _name + " is contested!";
private _ratio = 0;
private _supportCalled = false;
private _reinfCalled = false;
private _destructionCalled = false;
private _patrolsCalled = false;

while {_node getVariable "GDGM_isSpawned"} do {
	
	_tmpArray = +(_arrayList);
	_ownerCount = 0;
	_count = 0;
	{
		if(_x isKindOf "Man" && side _x != civilian) then {
			_count = _count + 1;
			if(side _x == _owner) then {
				_ownerCount = _ownerCount + 1;
			};
		};

		if(_x isKindOf "Car" && side _x != civilian) then {
			private _y = _x;
			{
				if(alive _x) then {
					_count = _count + 1;	
					if(side _x == _owner) then {
						_ownerCount = _ownerCount + 1;
					};
				};							
			} forEach crew _x;
		};

		if(_x isKindOf "Tank" && count crew _x > 0) then {
			_count = _count + 5;
			if(side _x == _owner) then {
				_ownerCount = _ownerCount + 5;
			};
		};		
	} forEach _tmpArray;	

	if(_count == 0) then {
		sleep 30;
		continue;
	};

	_ratio = floor((_ownerCount / _count) * 100);

	//call back patrols
	if(_ratio < 50 && !_patrolsCalled) then {
		_patrolsCalled = true; 
		[_node] spawn GDGM_fnc_callBackPatrols;
		[_node] spawn GDGM_fnc_callBackInsta;
	};

	//call for support
	if(_ratio < 70 && !_supportCalled && _owner != GDGM_reducedSide) then {
		_supportCalled = true; 
		[_node, _owner] spawn GDGM_fnc_callForSupportOnNode;
	};

	//call for reinf 
	if(_ratio < 60 && !_reinfCalled && _owner != GDGM_reducedSide) then {
		_reinfCalled = true; 
		[_node] spawn GDGM_fnc_reinfOnNode;
	};

	//destruction 
	if(!_destructionCalled && _ratio < 50) then {
		[_node, 0.2] call GDGM_fnc_addDestruction;
		_destructionCalled = true;
	};

	//end loop
	if(_ratio < GDGM_captureThreshold) then {
		//find highest presence
		//change ownership		
		private _winner = [_trg] call GDGM_fnc_findTriggerDominantSide;
		if([_trg, _winner] call GDGM_fnc_isMinorPlayer) then {
			[_node, _owner] spawn GDGM_fnc_surrenderNode;
			[_node, _winner] spawn GDGM_fnc_changeOwner;
			_node setVariable ["GDGM_underAttack", false];
			[_node, _winner] spawn GDGM_fnc_spawnGarri;
			break;
		};
	};

	if(_ratio != 100) then {
		_node setVariable ["GDGM_isContested",true];
		_msg = _name + '(' + ([_owner] call GDGM_fnc_getFactionName) + ") : defences are at " +  str _ratio + " %!";
		_msg remoteExec ["systemChat",0];
	} else {
		_node setVariable ["GDGM_isContested",false];
	};
	sleep 60;
};

deleteVehicle _trg;




//http://madbull.arma.free.fr/A3_stable_1.24_CfgVehicles_tree.html
/*
Car
Tank
Man
*/