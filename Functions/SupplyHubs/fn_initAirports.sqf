if(!GDGM_airport_enable) exitWith {
	systemChat "Airports are disabled.";
};

{
	[_x] spawn GDGM_fnc_simulateAirport; 
} forEach GDGM_airportNodes;