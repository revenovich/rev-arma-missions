[
    "TFAR - Animations",
    "radioAnims_cba_listenKey",
    "Hold Up Radio",
    {
        if (call TFAR_fnc_haveSWRadio) exitWith {radioAnims_TFAR_currentRadio = call TFAR_fnc_activeSwRadio; call fn_radioAnims_hand};
        if (call TFAR_fnc_haveLRRadio) exitWith {radioAnims_TFAR_currentRadio = call TFAR_fnc_activelRRadio; call fn_radioAnims_hand};
    },
    {
        if (call TFAR_fnc_haveSWRadio || call TFAR_fnc_haveLRRadio) exitWith {
            if (!isNil "radioAnims_radioModel") then {
                deletevehicle radioAnims_radioModel;
                radioAnims_radioModel = nil;
            };
            player playActionNow "radioAnims_Stop";
            radioAnims_playerAnimated = nil;
        };
    },
    [0, [false, false, false]],  // _defaultKeybind: unset
    false,  // _holdKey
    0,      // _holdDelay
    false   // _overwrite
] call cba_fnc_addKeybind;
