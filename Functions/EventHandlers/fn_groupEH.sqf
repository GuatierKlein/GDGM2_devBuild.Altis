//for groups only !!!
params["_group","_flee",["_support", true], ["_morale", true], ["_skill", 0]];

//skill 
if(_skill == 0) then {
	_skill = [side _group] call GDGM_fnc_getSideSkill;
};

{
	_x setSkill _skill;
} forEach units _group;

//rank
private _leader = leader _group;
if(rank _leader == "PRIVATE") then {
	_leader setRank "SERGEANT";
};


//custom system
if(_morale && GDGM_enableMoraleSystem) then {
	[_group] spawn GDGM_fnc_initGroupMorale;
};

//old system
if(_morale && !GDGM_enableMoraleSystem) then { //!! pas compatible headless
	_group allowFleeing ([side _group] call GDGM_fnc_getCowardice);

	_group addEventHandler ["Fleeing", {
		params ["_group", "_fleeingNow"];

		if(!isServer) exitWith {};

		private _leader = leader _group;
		private _nearestEnnemy = _leader findNearestEnemy _leader;

		if(!isNull _nearestEnnemy) then {
			if(_leader distance _nearestEnnemy < GDGM_surrenderDistance && random 1 < GDGM_surrenderProbability) then {
				[_group] spawn GDGM_fnc_surrenderUnits;
			};
		};
	}];
};

if(_support) then {
	[_group, ["EnemyDetected", { 
		params ["_group", "_newTarget"];

		// ("detect on server : " + (str isServer)) remoteExec["systemChat",0];
		// ("detect on interface : " + (str hasInterface)) remoteExec["systemChat",0];

		if(_newTarget isKindOf "Plane" || _newTarget isKindOf "Helicopter") exitWith {};
		//test if friendly too close 
		if({side _x == side _group} count nearestObjects [getPosASL (leader _group),["Man","Car","Tank"],50] > 0) exitWith {};

		//random chance 
		if(random 1 < 0.75) exitWith {};

		// [getPos _newTarget, side _group, leader _group] spawn GDGM_fnc_supportChooser;
		[getPos _newTarget, side _group, leader _group] remoteExec ["GDGM_fnc_supportChooser", 2];
	}]] remoteExec ["addEventHandler", 0];
};

