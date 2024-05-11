////////////////////////////////////////////////
//             EDITABLE VARIABLES             //
////////////////////////////////////////////////

_faction = "custom"; // All factions are in the factions folder, use custom to edit your own.
_nightvision = true; // Set to true if you want players to spawn with nightvision
_fullArsenal = false;  // Set to false if you've manually set up a limited arsenal in the editor
_playerSideVar = "west"; // Side of the player, west, east, guer, or civilian

////////////////////////////////////////////////
//        DO NOT EDIT BELOW THIS LINE         //
////////////////////////////////////////////////

missionNameSpace setVariable ["initDone", false, true];

systemChat "Loading mission...";
diag_log "Loading mission...";

["init"] call OFT_fnc_customFillBox;

_handle = execVM format["factions\%1.sqf", _faction];

waitUntil {isNull _handle};

["init"] call OFT_fnc_respawnHandle;

missionNamespace setVariable ["playerSideVar", _playerSideVar, true];
missionNameSpace setVariable ["gearGiveNightvision", _nightvision, true];
missionNameSpace setVariable ["fullArsenal", _fullArsenal, true];

systemChat "Mission loaded!";
diag_log "Mission loaded!";

missionNameSpace setVariable ["initDone", true, true];
