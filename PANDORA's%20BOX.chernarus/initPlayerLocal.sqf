[ship_1, getPosASL jump_in_target_1, 1, 0.5, 0.01, "ship1JumpIn", false] execVM "mission_functions\shipJumpIn.sqf";
[ship_2, getPosASL jump_in_target_2, 1, 0.5, 0.01, "ship2JumpIn", false] execVM "mission_functions\shipJumpIn.sqf";

vehicle_wreck_1_pos = getPosATL vehicle_wreck_1;
vehicle_wreck_2_pos = getPosATL vehicle_wreck_2;
vehicle_wreck_3_pos = getPosATL vehicle_wreck_3;
vehicle_wreck_4_pos = getPosATL vehicle_wreck_4;

[vehicle_wreck_1, ((vehicle_wreck_1_pos#2) + 10), ((vehicle_wreck_1_pos#2) + 5), 4, 2] execVM "mission_functions\objectFloating.sqf";
[vehicle_wreck_2, ((vehicle_wreck_2_pos#2) + 15), ((vehicle_wreck_2_pos#2) + 7), 5, 3] execVM "mission_functions\objectFloating.sqf";
[vehicle_wreck_3, ((vehicle_wreck_3_pos#2) + 18), ((vehicle_wreck_3_pos#2) + 10), 8, 4] execVM "mission_functions\objectFloating.sqf";
[vehicle_wreck_4, ((vehicle_wreck_4_pos#2) + 10), ((vehicle_wreck_4_pos#2) + 5), 6, 4] execVM "mission_functions\objectFloating.sqf";