params ["_pos", "_name"];

private _unit = player;
_pos = [_pos select 0, _pos select 1, 0];

//tp vehicle
if(vehicle _unit != _unit) then {
	_unit = vehicle _unit;
};

systemChat ("Teleporting to " + _name);

//cam up 
private _camera = "camera" camCreate [0, 0, 0];
_camera camPrepareTarget _unit;
_camera camCommitPrepared 0; // needed for relative position
_camera camPrepareRelPos [0, 0, 2];
_camera cameraEffect ["internal", "back"];
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera };

_camera camPrepareRelPos [0, 0, 500];
_camera camCommitPrepared 3;
waitUntil { camCommitted _camera };
titleCut ["", "BLACK", 2];
sleep 2;

//cam down 
titleText ["Transporting to " + _name + " ...","PLAIN",5];
titleFadeOut 2;
sleep 2;
[_unit, _pos] remoteExec ['setPos',2];
sleep 10;
//tp 
_camera camPreparePos (_pos vectorAdd [0,0,500]);
_camera camPrepareTarget _unit;
_camera camCommitPrepared 0;
sleep 4;

_camera camPrepareRelPos [0, 0, 4];
_camera camCommitPrepared 3;
titleCut ["", "BLACK IN", 1];

waitUntil { camCommitted _camera };
titleCut ["", "BLACK", 1];


sleep 2;
[_name, mapGridPosition _unit, str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;
"dynamicBlur" ppEffectEnable true;   
"dynamicBlur" ppEffectAdjust [6];   
"dynamicBlur" ppEffectCommit 0;     
"dynamicBlur" ppEffectAdjust [0.0];  
"dynamicBlur" ppEffectCommit 5;  

titleCut ["", "BLACK IN", 5];

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;	