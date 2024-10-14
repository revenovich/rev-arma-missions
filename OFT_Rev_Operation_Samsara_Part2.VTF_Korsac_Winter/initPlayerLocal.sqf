params ["_player", "_didJIP"];
missionNameSpace setVariable ["playerGear", [], false];

waitUntil { missionNameSpace getVariable ["initDone", false] };

systemChat "Gear Handler Loaded";
diag_log "Gear Handler Loaded";

[6] call OFT_fnc_gearHandle;
[0] call OFT_fnc_gearHandle;
[-1] call OFT_fnc_fortificationBox;
["init"] call OFT_fnc_respawnHandle;