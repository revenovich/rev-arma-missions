missionNamespace setVariable["isLab2DoorsOpen", true, true];

labDome_5 setVariable["bis_disabled_Door_1", 0, true];
labDome_5 setVariable["bis_disabled_Door_2", 0, true];

[independent, "dooropen5", ["Unlock the doors using code from scientist", "Door Unlock", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;