params ["_groups","_pos","_distMax"];

private _dist = 0;
private _maxTime = 500;
private _cycleTime = 10;
private _cycles = 0;
_distMax = _distMax * _distMax;

while {_cycles < _maxTime} do {
	{
		_dist = (leader _x) distanceSqr _pos;

		if(_dist < _distMax) then {
			_x leaveVehicle (assignedVehicle (leader _x));
			//(assignedVehicle (leader _x)) setVehicleLock "LOCKED";
		};		
	} forEach _groups;
	sleep (_cycleTime);
	_cycles = _cycles + _cycleTime;
};

{
	_x leaveVehicle (assignedVehicle (leader _x));	
	//(assignedVehicle (leader _x)) setVehicleLock "LOCKED";
} forEach _groups;