////////////////////////////////////////////////
//             EDITABLE VARIABLES             //
////////////////////////////////////////////////

_faction = "custom"; // All factions are in the factions folder, use custom to edit your own.
_nightvision = true; // Set to true if you want players to spawn with nightvision
_fullArsenal = false;  // Set to false if you've manually set up a limited arsenal in the editor

////////////////////////////////////////////////
//        DO NOT EDIT BELOW THIS LINE         //
////////////////////////////////////////////////

missionNameSpace setVariable ["initDone", false, true];

_handle = execVM format["factions\%1.sqf", _faction];
missionNameSpace setVariable ["gearGiveNightvision", _nightvision, true];
missionNameSpace setVariable ["fullArsenal", _fullArsenal, true];

missionNameSpace setVariable ["initDone", true, true];
