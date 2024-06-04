params["_grp","_amount"];

private _oldMorale = _grp getVariable "GDGM_morale";
if(isNil "_oldMorale") exitWith {};

private _newMorale = _oldMorale + _amount;

if(_newMorale > 100) then {
	_newMorale = 100;
} else {
	if(_newMorale < 0) then {
		_newMorale = 0;
	};
};

_grp setVariable ["GDGM_morale", _newMorale ];