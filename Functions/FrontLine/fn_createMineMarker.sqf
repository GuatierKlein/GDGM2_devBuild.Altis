params["_pos"];

private _marker = createMarkerLocal [("mineMarker_" + str _pos) ,_pos];
_marker setMarkerColor "colorblue";
_marker setMarkerText "Friendly minefield";
_marker setMarkerType "loc_mine";