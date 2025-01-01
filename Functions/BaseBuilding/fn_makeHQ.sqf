params["_obj"];

_obj setVariable ["GDGM_speType", "hq", true];

private _pos = getPosASL _obj;
private _markerName = "hq_" + str _pos;

createMarker [_markerName, _pos];
_markerName setMarkerTextLocal "FOB";
_markerName setMarkerColorLocal "Colorblue";
_markerName setMarkerType "mil_flag";

GDGM_playerFOBs pushBack _obj;



// attention pb si le FOB est pas saved

//!!!!!! ça passe à chaque built, ça va créer des nodes à l'infini!
// bouger le code dans le save built object 

