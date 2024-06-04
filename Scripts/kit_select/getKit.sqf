systemChat "Changing kit...";

_index = lbCurSel 240411;
if (_index != -1 ) then {
	_kit_unit = available_kits select _index;
	private _success = [_kit_unit] call BAR_fnc_setKit;		
	if(!_success) exitWith {
		closeDialog 0;
		hint "Pas assez de points logistiques";
	};
	call BAR_fnc_applyKit;
	closeDialog 0;
};