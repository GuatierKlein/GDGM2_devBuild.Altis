_timeToSkipTo = sliderPosition 240811;
_new_time = (_timeToSkipTo - dayTime + 24) % 24;
if (isMultiplayer) then {
	_new_time remoteExec ["skipTime",2];
} else {
	skipTime _new_time;
};

//chat log
private _hours = floor _timeToSkipTo;	
private _minutes = floor ((_timeToSkipTo - _hours) * 60);											
_msg = "Changing time to " + str _hours + ":" + str _minutes;
_msg remoteExec ["systemChat",0];
"May take up to 5 seconds to sync time between players..." remoteExec ["systemChat",0];