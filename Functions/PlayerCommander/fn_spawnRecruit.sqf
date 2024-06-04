_display = findDisplay 21041;
_caller = _display getVariable "GDGM_caller";

systemChat "Unit recruited!";
_index = lbCurSel 210411;
_unit = lbData [210411,_index];

_unitCreated = (group _caller) createUnit [_unit,  getPos _caller, [], 0, "FORM"]; 

//custom loadouts
// if(typeOf _unitCreated == "B_Soldier_F") then {
// 	_unitCreated setUnitLoadout ((getUnitLoadout kit_rifle));
// };
// if(typeOf _unitCreated == "B_HeavyGunner_F") then {
// 	_unitCreated setUnitLoadout (getUnitLoadout kit_mg);
// };
// if(typeOf _unitCreated == "B_soldier_LAT_F") then {
// 	_unitCreated setUnitLoadout (getUnitLoadout kit_lat);
// };




