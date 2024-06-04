createDialog "dialogCommanderSelect";

private _side = side player;
GDGM_clientCommanderStyle = "";

[_side, clientOwner] remoteExecCall ["GDGM_fnc_sendCommanderStyle",2];

waitUntil { GDGM_clientCommanderStyle != ""  || !dialog};

if(!dialog) exitWith {};

//fill dialog
ctrlSetText [190224, str _side];
ctrlSetText [190221, GDGM_clientCommanderStyle];

private _styles = ["aggressive","cautious","defensive"];
{
	lbAdd [190222,_x];
} foreach _styles;


buttonSetAction [190223, "
	if(lbCurSel 190222 != -1) then {[side player, ['aggressive','cautious','defensive'] select (lbCurSel 190222)] remoteExecCall ['GDGM_fnc_changeCommanderStyle',2]; hint 'style changed!'};
"];



