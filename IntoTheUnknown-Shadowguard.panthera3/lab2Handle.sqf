missionNamespace setVariable["isLab2DoorsOpen", true, true];

labDome_2 setVariable["bis_disabled_Door_1", 0, true];
labDome_2 setVariable["bis_disabled_Door_2", 0, true];

[independent, "dooropen2", ["Unlock the doors using code from scientist", "Door Unlock", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;