params ["_hourOffset"];

private _now = systemTime;

private _h  = _now select 3;
private _m  = _now select 4;

private _heureStr = format ["%1h%2", _h + 1, _m];

_heureStr;