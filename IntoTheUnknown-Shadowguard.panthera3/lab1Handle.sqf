missionNamespace setVariable["isLab1DoorsOpen", true, true];

labDome_1 setVariable["bis_disabled_Door_1", 0, true];
labDome_1 setVariable["bis_disabled_Door_2", 0, true];
labDome_1 setVariable["bis_disabled_Door_3", 0, true];

[independent, "dooropen1", ["Unlock the doors using code from scientist", "Door Unlock", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;