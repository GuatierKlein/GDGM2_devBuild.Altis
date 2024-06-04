params["_houses","_amount"];

private _number = (count _houses) * _amount;

for [{private _i = 0}, {_i < _number}, {_i = _i + 1}] do {
	[(_houses select _i), [1, false]] remoteExec ["setDamage",0, true];
};