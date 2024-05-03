/*
    @file_name: fn_earplugs.sqf
    @file_author: Apples & Dyzalonius
*/

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_addEarplugsAction = {
    _condition = { ((player getVariable ["ZO_EarplugsEnabled", false]) || ("ACE_EarPlugs" in (items player))) };
    _action = ["zeusops_earplugs", "Toggle Earplugs", "\zeusops_addon\icons\icon_earplugs.paa", fn_toggleEarplugs, _condition] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
};

fn_addEarplugsKeybind = {
    ["ZEUSOPS","toggle_earplugs", "Toggle Earplugs", {[] spawn fn_toggleEarplugs;}, "", [0, [false, false, false]]] call CBA_fnc_addKeybind;
};

fn_addOnDeathReset = {
    player addEventHandler ["Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        [] spawn fn_takeOutEarplugs;
    }];
};

fn_putInEarplugs = {
    player setVariable ["ZO_EarplugsEnabled", true, false];
    player removeItem "ACE_Earplugs";
    0.5 fadeSound 0.25;
};

fn_takeOutEarplugs = {
    player setVariable ["ZO_EarplugsEnabled", false, false];
    player addItem "ACE_Earplugs";
    0.5 fadeSound 1;
};

fn_toggleEarplugs = {
    _earplugsEnabled = player getVariable ["ZO_EarplugsEnabled", false];

    if (!_earplugsEnabled) then {
        systemChat "Earplugs ON";
        [] spawn fn_putInEarplugs;
    }
    else
    {
        systemChat "Earplugs OFF";
        [] spawn fn_takeOutEarplugs;
    };
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

player setVariable ["ZO_EarplugsEnabled", false, false];

[] spawn fn_addEarplugsAction;
[] spawn fn_addOnDeathReset;
[] spawn fn_addEarplugsKeybind;
