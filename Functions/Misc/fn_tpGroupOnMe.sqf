// if(isMultiplayer) exitWith {
// 	hint "You cannot do that in multiplayer";
// };

{
	// Current result is saved in variable _x
	if(isPlayer _x) then {
		_x setPos (getPos player);
	};
} forEach units group player;