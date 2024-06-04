while {true} do {
	private _daytime = sunOrMoon;
	//day
	if(_daytime == 1) then {
		setTimeMultiplier 6;
		continue;
	};

	//night
	if(_daytime == 0) then {
		setTimeMultiplier 20;
		continue;
	};

	setTimeMultiplier 2;
	sleep 60;
};