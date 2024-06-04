params["_pos"];

private _list = nearestObjects [player, ["Man"], 10];

{
	[_x] call ace_medical_treatment_fnc_fullHealLocal;
} forEach _list;