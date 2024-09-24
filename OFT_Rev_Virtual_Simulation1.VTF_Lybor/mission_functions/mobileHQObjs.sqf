waitUntil { missionNameSpace getVariable ["initDone", false] };

// Arsenal 1
main_arsenal_1 attachTo [hq_spawn_truck, [-1.1, 0, 0.8]];
[main_arsenal_1, [90,0,0]] call BIS_fnc_setObjectRotation;

// Arsenal 2
main_arsenal_2 attachTo [hq_spawn_truck, [1, 0, 0.8]];
[main_arsenal_2, [90,0,0]] call BIS_fnc_setObjectRotation;

// Buy Box 1
buy_box_1 attachTo [hq_spawn_truck, [1, -1.7, 0.5]];
[buy_box_1, [0,0,0]] call BIS_fnc_setObjectRotation;

// Buy Box 2
buy_box_2 attachTo [hq_spawn_truck, [-1.1, -1.7, 0.5]];
[buy_box_2, [0,0,0]] call BIS_fnc_setObjectRotation;

// Tow Turret 1
turret_tow_1 attachTo [hq_spawn_truck, [0, -0.3, 2.6]];
[turret_tow_1, [0,0,0]] call BIS_fnc_setObjectRotation;

turret_tow_1 addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_unit setVehicleAmmo 1;
}];

// Mk19 Turret 1
turret_mk19_1 attachTo [hq_spawn_truck, [0, -1.4, 2.6]];
[turret_mk19_1, [180,0,0]] call BIS_fnc_setObjectRotation;

turret_mk19_1 addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_unit setVehicleAmmo 1;
}];

// Sand Bag Front
sandbag_front_1 attachTo [hq_spawn_truck, [0, 1, 1.7]];
[sandbag_front_1, [180,0,0]] call BIS_fnc_setObjectRotation;

// Sand Bag Side Right
sandbag_side_right_1 attachTo [hq_spawn_truck, [1.2, -1, 1.6]];
[sandbag_side_right_1, [90,0,0]] call BIS_fnc_setObjectRotation;

// Sand Bag Side Left
sandbag_side_left_1 attachTo [hq_spawn_truck, [-1.3, -1, 1.6]];
[sandbag_side_left_1, [90,0,0]] call BIS_fnc_setObjectRotation;
