createDialog "dialogTime";

sliderSetRange [240811,0,23.99];
sliderSetPosition [240811,daytime];

while {dialog} do {
	private _daytime = sliderPosition 240811; 
	private _hours = floor _daytime;	
	private _minutes = floor ((_daytime - _hours) * 60);											
	ctrlSetText [240813, (str _hours + ":" + str _minutes)];
};

