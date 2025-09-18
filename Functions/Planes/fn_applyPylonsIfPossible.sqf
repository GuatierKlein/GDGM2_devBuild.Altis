params ["_plane"];

private _class = typeOf _plane;

if(!(_class in keys GDGM_planePylonsConfigs) || {isNull _plane}) exitWith {};

private _configs = GDGM_planePylonsConfigs get _class;
private _chosenConfig = selectRandom _configs;

{
	[_plane, [_x select 0, _x select 1, true]] remoteExec ["setPylonLoadOut", 0];
} forEach _chosenConfig;
