//for groups only !!!
params["_group","_flee",["_support", true], ["_morale", true]];

//skill 
private _skill = [side _group] call GDGM_fnc_getSideSkill;
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
if(_morale && !GDGM_enableMoraleSystem) then {
	_group allowFleeing ([side _group] call GDGM_fnc_getCowardice);

	_group addEventHandler ["Fleeing", {
		params ["_group", "_fleeingNow"];

		private _leader = leader _group;
		private _nearestEnnemy = _leader findNearestEnemy _leader;

		if(!isNull _nearestEnnemy) then {
			if(_leader distance _nearestEnnemy < GDGM_surrenderDistance && random 1 < GDGM_surrenderProbability) then {
				[units _group] spawn GDGM_fnc_surrenderUnits;
			};
		};
	}];
};

if(_support) then {
	_group addEventHandler ["EnemyDetected", { //bug with headless???
		params ["_group", "_newTarget"];
		if(!isServer) exitWith {};
		if(_newTarget isKindOf "Plane" || _newTarget isKindOf "Helicopter") exitWith {};
		[getPos _newTarget, side _group, leader _group] spawn GDGM_fnc_supportChooser;
	}];
};

