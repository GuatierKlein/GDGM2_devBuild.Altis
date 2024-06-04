//client 
private _attachLogic = "Logic" createVehicle (getMarkerPos "GDGM_camKit");

// private _anims = [
// 	"Acts_Ambient_Relax_4",
// 	"Acts_Ambient_Relax_3",
// 	"Acts_Ambient_Relax_2"
// ];

private _anims = [
	"Acts_A_M04_briefing"
	// "Acts_Rifle_Operations_Barrel",
	// "Acts_Rifle_Operations_Checking_Chamber",
	// "Acts_Rifle_Operations_Front",
	// "Acts_Rifle_Operations_Zeroing",
];

private _anims2 = [
	"Acts_CrouchingFiringLeftRifle04",
	"Acts_CrouchGetLowGesture",
	"Acts_CrouchingFiringLeftRifle01",
	"Acts_Rifle_Operations_Checking_Chamber",
	"Acts_Rifle_Operations_Front",
	"Acts_Rifle_Operations_Zeroing",
	"Acts_Ambient_Relax_4",
	"Acts_Ambient_Relax_3",
	"Acts_Ambient_Relax_2"
];

private _loadoutPoolLeft = [];
private _loadoutPoolRight = [];
private _vehPoolLeft = [];
private _vehPoolRight = [];
private _slPoolLeft = [];
private _slPoolRight = [];
private _tankPoolLeft = [];
private _tankPoolRight = [];

switch (GDGM_introCamLeftSide) do {
	case east: {_slPoolLeft = GDGM_OPFOR_OfficerDummies; _loadoutPoolLeft = GDGM_OPFOR_rifleDummies; _vehPoolLeft = GDGM_OPFOR_heavyArmedVeh + GDGM_OPFOR_lightArmedVeh; _tankPoolLeft = GDGM_OPFOR_tanks};
	case west: {_slPoolLeft = GDGM_BLUFOR_OfficerDummies; _loadoutPoolLeft = GDGM_BLUFOR_rifleDummies; _vehPoolLeft = GDGM_BLUFOR_heavyArmedVeh + GDGM_BLUFOR_lightArmedVeh; _tankPoolLeft = GDGM_BLUFOR_tanks};
	case independent: {_slPoolLeft = GDGM_IND_OfficerDummies; _loadoutPoolLeft = GDGM_IND_rifleDummies;  _vehPoolLeft = GDGM_IND_heavyArmedVeh + GDGM_IND_lightArmedVeh; _tankPoolLeft = GDGM_IND_tanks};
};

switch (GDGM_introCamRightSide) do {
	case east: {_slPoolRight = GDGM_OPFOR_OfficerDummies; _loadoutPoolRight = GDGM_OPFOR_rifleDummies; _vehPoolRight = GDGM_OPFOR_heavyArmedVeh + GDGM_OPFOR_lightArmedVeh; _tankPoolRight = GDGM_OPFOR_tanks};
	case west: {_slPoolRight = GDGM_BLUFOR_OfficerDummies; _loadoutPoolRight = GDGM_BLUFOR_rifleDummies; _vehPoolRight = GDGM_BLUFOR_heavyArmedVeh + GDGM_BLUFOR_lightArmedVeh; _tankPoolRight = GDGM_BLUFOR_tanks};
	case independent: {_slPoolRight = GDGM_IND_OfficerDummies; _loadoutPoolRight = GDGM_IND_rifleDummies;  _vehPoolRight = GDGM_IND_heavyArmedVeh + GDGM_IND_lightArmedVeh; _tankPoolRight = GDGM_IND_tanks};
};


private _camPos = getMarkerPos "GDGM_camIntro";
private _spawnPosLeft1 = _camPos vectorAdd [-1.5, 3, 0];
private _unitLeft1 = "C_MAN_1" createVehicleLocal _spawnPosLeft1;
_unitLeft1 setDir 90;
_unitLeft1 attachTo [_attachLogic];
_unitLeft1 setUnitLoadout getUnitLoadout (selectRandom _slPoolLeft);
_unitLeft1 switchMove selectRandom _anims;

private _spawnPosRight1 = _camPos vectorAdd [1.5, 3, 0];
private _unitRight1 = "C_MAN_1" createVehicleLocal _spawnPosRight1;
_unitRight1 setDir 270;
_unitRight1 attachTo [_attachLogic];
_unitRight1 setUnitLoadout getUnitLoadout (selectRandom _slPoolRight);
_unitRight1 switchMove selectRandom _anims;

private _spawnPosLeft2 = _camPos vectorAdd [-3, 6, 0];
private _unitLeft2 = "C_MAN_1" createVehicleLocal _spawnPosLeft2;
_unitLeft2 setDir 180;
_unitLeft2 attachTo [_attachLogic];
_unitLeft2 setUnitLoadout getUnitLoadout (selectRandom _loadoutPoolLeft);
_unitLeft2 switchMove selectRandom _anims2;

private _spawnPosRight2 = _camPos vectorAdd [3, 6, 0];
private _unitRight2 = "C_MAN_1" createVehicleLocal _spawnPosRight2;
_unitRight2 setDir 180;
_unitRight2 attachTo [_attachLogic];
_unitRight2 setUnitLoadout getUnitLoadout (selectRandom _loadoutPoolRight);
_unitRight2 switchMove selectRandom _anims2;

private _spawnPosLeft3 = _camPos vectorAdd [-7, 10, 0];
private _vehLeft = (selectRandom _vehPoolLeft) createVehicleLocal _spawnPosLeft3;
_vehLeft setDir 90;

private _spawnPosRight3 = _camPos vectorAdd [7, 10, 0];
private _vehRight = (selectRandom _vehPoolRight) createVehicleLocal _spawnPosRight3;
_vehRight setDir 270;

private _spawnPosLeft4 = _camPos vectorAdd [-3.5, 17, 0];
private _tankLeft = (selectRandom _tankPoolLeft) createVehicleLocal _spawnPosLeft4;
_tankLeft setDir 135;

private _spawnPosRight4 = _camPos vectorAdd [3.5, 17, 0];
private _tankRight = (selectRandom _tankPoolRight) createVehicleLocal _spawnPosRight4;
_tankRight setDir 225;

private _lightSource = "#lightpoint" createVehicleLocal (_camPos vectorAdd [0, -1, 2]);
_lightSource setLightBrightness 8;
_lightSource setLightIntensity 3000;
_lightSource setLightColor [0.25, 1, 1];
_lightSource setLightAmbient [1, 1, 1];

waitUntil { !isNull player};

private _camera = "camera" camCreate _camPos;
_camera setPosATL ((getPosATL _camera) vectorAdd [0,0,1.5]);
_camera cameraEffect ["internal", "back"];
_camera camCommitPrepared 0;

playMusic "CUP_A1_S_Sahrani_2";

'layer2' cutText ["<t color='#FFD700' size='5'>GDGM II</t>", "PLAIN", 4, true, true];
'layer2' cutFadeOut 4;

sleep 10;

"dynamicBlur" ppEffectEnable true;   
"dynamicBlur" ppEffectAdjust [6];   
"dynamicBlur" ppEffectCommit 0;     
"dynamicBlur" ppEffectAdjust [0.0];  
"dynamicBlur" ppEffectCommit 5;  

titleCut ["", "BLACK IN", 5];
_camera cameraEffect ["terminate", "back"];
["GDGM2", worldName, str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;

camDestroy _camera;
deleteVehicle _attachLogic;
deleteVehicle _unitLeft1;
deleteVehicle _unitLeft2;
deleteVehicle _unitRight1;
deleteVehicle _unitRight2;
deleteVehicle _vehLeft;
deleteVehicle _vehRight;
deleteVehicle _tankLeft;
deleteVehicle _tankRight;
deleteVehicle _lightSource;



