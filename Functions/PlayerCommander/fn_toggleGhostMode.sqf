private _ghostMode = player getVariable "GDGM_ghostMode";
player setVariable ["GDGM_ghostMode", !_ghostMode, true];

hint ("Ghost mode: " + str !_ghostMode);