fn_disableDamage = {
	params ["_targetObject"];
	_targetObject allowDamage false;
};

fn_handleGroup = {
	params ["_group"];
	{
		private _unit = _x;
		[_unit] call fn_disableDamage;
	} forEach units _group;
};

fn_handleVehicle = {
	params ["_vehicle"];
	_vehicle allowDamage false;
	if (count (crew _vehicle) > 0) then {
		{
			private _crewUnit = _x;
			[_crewUnit] call fn_disableDamage;
		} forEach crew _vehicle;
	};
};

fn_randomLighting = {
	_strikePosArray = [strike_pos_1, strike_pos_2, strike_pos_3, strike_pos_4, strike_pos_5, strike_pos_6, strike_pos_7, strike_pos_8, strike_pos_9, strike_pos_10, strike_pos_11, strike_pos_12, strike_pos_13, strike_pos_14, strike_pos_15, strike_pos_16, strike_pos_17, strike_pos_18, strike_pos_19, strike_pos_20, strike_pos_21, strike_pos_22, strike_pos_23, strike_pos_24, strike_pos_25, strike_pos_26, strike_pos_27, strike_pos_28, strike_pos_29, strike_pos_30];
	_randomStrikePos = selectRandom _strikePosArray;
	_tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _randomStrikePos];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
};

[] spawn {
	sleep 5;
	for "_i" from 1 to 30 do {
		[] spawn fn_randomLighting;
		sleep 0.5;
	};

	sleep 2;

	playSound "calling";

	sleep 60;

	for "_i" from 1 to 10 do {
		[] spawn fn_randomLighting;
		sleep random [1, 3, 5];
	};

	["teleportGroup", group_1, teleport_group_target_1] call OFT_fnc_teleportThings;
	[group_1] call fn_handleGroup;
	sleep 2;
	["teleportGroup", group_2, teleport_group_target_2] call OFT_fnc_teleportThings;
	[group_2] call fn_handleGroup;
	sleep 2;
	["teleportGroup", group_3, teleport_group_target_3] call OFT_fnc_teleportThings;
	[group_3] call fn_handleGroup;
	sleep 2;
	["teleportGroup", group_4, teleport_group_target_4] call OFT_fnc_teleportThings;
	[group_4] call fn_handleGroup;
	sleep 2;
	["teleport", jamCar_1, teleport_thing_target_1] call OFT_fnc_teleportThings;
	[jamCar_1] call fn_handleVehicle;
	sleep 1;
	["teleport", veh_inf_truck_1, teleport_thing_target_2] call OFT_fnc_teleportThings;
	[veh_inf_truck_1] call fn_handleVehicle;
	sleep 1;
	["teleport", veh_ammo_truck_1, teleport_thing_target_3] call OFT_fnc_teleportThings;
	[veh_ammo_truck_1] call fn_handleVehicle;
	sleep 1;
	["teleport", veh_repair_truck_1, teleport_thing_target_4] call OFT_fnc_teleportThings;
	[veh_repair_truck_1] call fn_handleVehicle;
	sleep 1;
	["teleport", veh_hq_1, teleport_thing_target_5] call OFT_fnc_teleportThings;
	[veh_hq_1] call fn_handleVehicle;
	sleep 1;
	["teleport", tank_1, teleport_thing_target_6] call OFT_fnc_teleportThings;
	[tank_1] call fn_handleVehicle;
	sleep 1;
	["teleport", tank_2, teleport_thing_target_7] call OFT_fnc_teleportThings;
	[tank_2] call fn_handleVehicle;
	sleep 1;
	["teleport", tank_3, teleport_thing_target_8] call OFT_fnc_teleportThings;
	[tank_3] call fn_handleVehicle;
	sleep 1;
	["teleport", tank_4, teleport_thing_target_9] call OFT_fnc_teleportThings;
	[tank_4] call fn_handleVehicle;
	sleep 1;
	["teleport", bradley_1, teleport_thing_target_10] call OFT_fnc_teleportThings;
	[bradley_1] call fn_handleVehicle;
	sleep 1;
	["teleport", bmd_4m_1, teleport_thing_target_11] call OFT_fnc_teleportThings;
	[bmd_4m_1] call fn_handleVehicle;
};
