missionNameSpace setVariable ["playerGear", [], false];

waitUntil { missionNameSpace getVariable ["initDone", false] };

[0] spawn OFT_fnc_gearHandle;