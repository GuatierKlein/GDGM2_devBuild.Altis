params["_upperLeftPos", "_downRightPos"];

private _centerPos = [((_upperLeftPos select 0) + (_downRightPos select 0)) / 2, ((_upperLeftPos select 1) + (_downRightPos select 1))  / 2];
private _height = (abs ((_downRightPos select 1) - (_upperLeftPos select 1))) / 2;
private _width = (abs ((_downRightPos select 0) - (_upperLeftPos select 0))) / 2;

deleteMarker "GDGM_AllowedSpawnMarker";
createMarker ["GDGM_AllowedSpawnMarker", _centerPos];
"GDGM_AllowedSpawnMarker" setMarkerShapeLocal "RECTANGLE";
"GDGM_AllowedSpawnMarker" setMarkerSizeLocal [_width, _height];
"GDGM_AllowedSpawnMarker" setMarkerBrushLocal "Border";
"GDGM_AllowedSpawnMarker" setMarkerColor "ColorPink";
