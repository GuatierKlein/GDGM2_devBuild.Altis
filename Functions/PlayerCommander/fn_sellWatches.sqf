/*
    fnc_sellWatches.sqf
    Vend toutes les montres dans l'inventaire du joueur (uniforme/ gilet/ sac),
    en excluant la montre portée. Supprime les montres vendues et crédite les points.

    Usage :
      [player] call fnc_sellWatches;  // vanilla (ItemWatch)
      [player, ["ItemWatch","ACE_Altimeter","ACE_AltimeterWatch"]] call fnc_sellWatches; // avec mods

    Retour :
      Nombre entier de montres vendues
*/

fnc_sellWatches = {
    params [
        ["_unit", objNull, [objNull]],
        ["_watchClasses", ["ItemWatch"], [[]]]
    ];
    if (isNull _unit) exitWith {0};

    private _sold = 0;

    // Contenants à inspecter (pas les assignedItems -> la montre portée n'est pas comptée)
    private _containers = [
        ["uniform",  uniformContainer _unit],
        ["vest",     vestContainer _unit],
        ["backpack", backpackContainer _unit]
    ];

    {
        private _place = _x select 0;
        private _cont  = _x select 1;

        if (!isNull _cont) then {
            private _cargo = getItemCargo _cont;   // [[classnames...],[quantités...]]
            private _names = _cargo select 0;
            private _qtys  = _cargo select 1;

            {
                private _cls = _x;
                private _qty = _qtys select _forEachIndex;

                if (_cls in _watchClasses && _qty > 0) then {
                    _sold = _sold + _qty;

                    // Retirer proprement du bon contenant
                    switch (_place) do {
                        case "uniform":  { for "_i" from 1 to _qty do { _unit removeItemFromUniform  _cls; }; };
                        case "vest":     { for "_i" from 1 to _qty do { _unit removeItemFromVest     _cls; }; };
                        case "backpack": { for "_i" from 1 to _qty do { _unit removeItemFromBackpack _cls; }; };
                    };
                };
            } forEach _names;
        };
    } forEach _containers;

    // Créditer les points une seule fois au total
    if (_sold > 0) then {
        [side _unit, _sold] call GDGM_add_points;

        // Si GDGM_add_points doit tourner serveur-side :
        // [side _unit, _sold] remoteExecCall ["GDGM_add_points", 2];
    };

    _sold
};
