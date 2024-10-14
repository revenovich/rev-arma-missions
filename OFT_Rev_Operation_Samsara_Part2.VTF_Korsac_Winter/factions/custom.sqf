// //// //////////////////////////////////////////
//             EDITABLE VARIABLES            // 
// //// //////////////////////////////////////////

// // IS leader MASTER ALL SPECIALIST
_leaderMasterAllSpecialist = false;
// // 

// // BLACKLISTED LOADOUTS THAT WILL not SHOWN in THE GEAR BOX (ARSENAL) for PLAYERS
_blackListedLoadouts = ["LOADOUT COMMANDER", "LOADOUT SECOND COMMANDER", "LOADOUT TEAMLEADER", "LOADOUT AT RIFLEMAN", "LOADOUT AUTORIFLEMAN", "LOADOUT GRENADIER", "LOADOUT MARKSMAN"];
// All current loadouts: LOADOUT AT RIFLEMAN, LOADOUT AUTORIFLEMAN, LOADOUT MACHINEGUNNER, 
// LOADOUT ammo BEARER, LOADOUT ENGINEER, LOADOUT GRENAIDER, LOADOUT MARKSMAN, LOADOUT MEDIC, 
// LOADOUT RIFLEMAN, LOADOUT TEAMLEADER, LOADOUT SNIPER, LOADOUT SPOTTER, LOADOUT commander, 
// LOADOUT SECOND commander, LOADOUT HELICOPTER PILOT, LOADOUT HELICOPTER CO-PILOT, LOADOUT FIXED WING PILOT, 
// LOADOUT FIXED WING CO-PILOT, LOADOUT CREWMAN, LOADOUT driver, LOADOUT gunner, LOADOUT LOADER, LOADOUT vehicle commander, 
// LOADOUT RADIO OPERATOR, LOADOUT MORTAR OPERATOR, LOADOUT MORTAR ASSISTANT, LOADOUT MORTAR commander, 
// LOADOUT MORTAR SPOTTER, LOADOUT MORTAR ammo BEARER
// // 

// //// //////////////////////////////////////////
//        do not EDIT BELOW THIS LINE        // 
//      UNLESS YOU KNOW WHAT YOU'RE DOING    // 
// //// //////////////////////////////////////////

missionNamespace setVariable ["BlackListedLoadouts", _blackListedLoadouts, true];

_allAvailableLoadoutNames = [];

_nullUnits = [];
_notNullUnits = [];

// AT Rifleman
if (isNil "oft_atrifleman") then {
	_nullUnits pushBack "AT Rifleman";
} else {
	[5, oft_atrifleman, "LOADOUT AT RIFLEMAN"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT AT RIFLEMAN";
	_notNullUnits pushBack oft_atrifleman;
};

// Autorifleman
if (isNil "oft_autorifleman") then {
	_nullUnits pushBack "Autorifleman";
} else {
	[5, oft_autorifleman, "LOADOUT AUTORIFLEMAN"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT AUTORIFLEMAN";
	_notNullUnits pushBack oft_autorifleman;
};

// Machinegunner
if (isNil "oft_machinegunner") then {
	_nullUnits pushBack "Machinegunner";
} else {
	[5, oft_machinegunner, "LOADOUT MACHINEGUNNER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MACHINEGUNNER";
	_notNullUnits pushBack oft_machinegunner;
};

// ammo Bearer
if (isNil "oft_ammobearer") then {
	_nullUnits pushBack "Ammo Bearer";
} else {
	[5, oft_ammobearer, "LOADOUT AMMO BEARER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT AMMO BEARER";
	_notNullUnits pushBack oft_ammobearer;
};

// Engineer
if (isNil "oft_engineer") then {
	_nullUnits pushBack "Engineer";
} else {
	[5, oft_engineer, "LOADOUT ENGINEER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT ENGINEER";
	_notNullUnits pushBack oft_engineer;
};

// Grenadier
if (isNil "oft_grenadier") then {
	_nullUnits pushBack "Grenadier";
} else {
	[5, oft_grenadier, "LOADOUT GRENADIER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT GRENADIER";
	_notNullUnits pushBack oft_grenadier;
};

// Marksman
if (isNil "oft_marksman") then {
	_nullUnits pushBack "Marksman";
} else {
	[5, oft_marksman, "LOADOUT MARKSMAN"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MARKSMAN";
	_notNullUnits pushBack oft_marksman;
};

// Medic
if (isNil "oft_medic") then {
	_nullUnits pushBack "Medic";
} else {
	[5, oft_medic, "LOADOUT MEDIC"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MEDIC";
	_notNullUnits pushBack oft_medic;
};

// Rifleman
if (isNil "oft_rifleman") then {
	_nullUnits pushBack "Rifleman";
} else {
	[5, oft_rifleman, "LOADOUT RIFLEMAN"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT RIFLEMAN";
	_notNullUnits pushBack oft_rifleman;
};

// Teamleader
if (isNil "oft_teamleader") then {
	_nullUnits pushBack "Teamleader";
} else {
	[5, oft_teamleader, "LOADOUT TEAMLEADER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT TEAMLEADER";
	_notNullUnits pushBack oft_teamleader;
};

// Sniper
if (isNil "oft_sniper") then {
	_nullUnits pushBack "Sniper";
} else {
	[5, oft_sniper, "LOADOUT SNIPER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT SNIPER";
	_notNullUnits pushBack oft_sniper;
};

// Spotter
if (isNil "oft_spotter") then {
	_nullUnits pushBack "Spotter";
} else {
	[5, oft_spotter, "LOADOUT SPOTTER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT SPOTTER";
	_notNullUnits pushBack oft_spotter;
};

// commander
if (isNil "oft_commander") then {
	_nullUnits pushBack "Commander";
} else {
	[5, oft_commander, "LOADOUT COMMANDER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT COMMANDER";
	_notNullUnits pushBack oft_commander;
};

// Second commander
if (isNil "oft_seccommander") then {
	_nullUnits pushBack "Second Commander";
} else {
	[5, oft_seccommander, "LOADOUT SECOND COMMANDER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT SECOND COMMANDER";
	_notNullUnits pushBack oft_seccommander;
};

// Helicopter Pilot
if (isNil "oft_helipilot") then {
	_nullUnits pushBack "Helicopter Pilot";
} else {
	[5, oft_helipilot, "LOADOUT HELICOPTER PILOT"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT HELICOPTER PILOT";
	_notNullUnits pushBack oft_helipilot;
};

// Helicopter Co-Pilot
if (isNil "oft_helicopilot") then {
	_nullUnits pushBack "Helicopter Co-Pilot";
} else {
	[5, oft_helicopilot, "LOADOUT HELICOPTER CO-PILOT"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT HELICOPTER CO-PILOT";
	_notNullUnits pushBack oft_helicopilot;
};

// Fixed Wing Pilot
if (isNil "oft_fwpilot") then {
	_nullUnits pushBack "Fixed Wing Pilot";
} else {
	[5, oft_fwpilot, "LOADOUT FIXED WING PILOT"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT FIXED WING PILOT";
	_notNullUnits pushBack oft_fwpilot;
};

// Fixed Wing Co-Pilot
if (isNil "oft_fwcopilot") then {
	_nullUnits pushBack "Fixed Wing Co-Pilot";
} else {
	[5, oft_fwcopilot, "LOADOUT FIXED WING CO-PILOT"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT FIXED WING CO-PILOT";
	_notNullUnits pushBack oft_fwcopilot;
};

// Crewman
if (isNil "oft_crewman") then {
	_nullUnits pushBack "Crewman";
} else {
	[5, oft_crewman, "LOADOUT CREWMAN"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT CREWMAN";
	_notNullUnits pushBack oft_crewman;
};

// driver
if (isNil "oft_vdriver") then {
	_nullUnits pushBack "Driver";
} else {
	[5, oft_vdriver, "LOADOUT DRIVER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT DRIVER";
	_notNullUnits pushBack oft_vdriver;
};

// gunner
if (isNil "oft_vgunner") then {
	_nullUnits pushBack "Gunner";
} else {
	[5, oft_vgunner, "LOADOUT GUNNER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT GUNNER";
	_notNullUnits pushBack oft_vgunner;
};

// Loader
if (isNil "oft_vloader") then {
	_nullUnits pushBack "Loader";
} else {
	[5, oft_vloader, "LOADOUT LOADER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT LOADER";
	_notNullUnits pushBack oft_vloader;
};

// commander
if (isNil "oft_vcommander") then {
	_nullUnits pushBack "Commander";
} else {
	[5, oft_vcommander, "LOADOUT VEHICLE COMMANDER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT VEHICLE COMMANDER";
	_notNullUnits pushBack oft_vcommander;
};

// Radio Operator
if (isNil "oft_radiooperator") then {
	_nullUnits pushBack "Radio Operator";
} else {
	[5, oft_radiooperator, "LOADOUT RADIO OPERATOR"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT RADIO OPERATOR";
	_notNullUnits pushBack oft_radiooperator;
};

// Mortar Operator
if (isNil "oft_mortaroperator") then {
	_nullUnits pushBack "Mortar Operator";
} else {
	[5, oft_mortaroperator, "LOADOUT MORTAR OPERATOR"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MORTAR OPERATOR";
	_notNullUnits pushBack oft_mortaroperator;
};

// Mortar Assistant
if (isNil "oft_mortarassistant") then {
	_nullUnits pushBack "Mortar Assistant";
} else {
	[5, oft_mortarassistant, "LOADOUT MORTAR ASSISTANT"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MORTAR ASSISTANT";
	_notNullUnits pushBack oft_mortarassistant;
};

// Mortar commander
if (isNil "oft_mortarcommander") then {
	_nullUnits pushBack "Mortar Commander";
} else {
	[5, oft_mortarcommander, "LOADOUT MORTAR COMMANDER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MORTAR COMMANDER";
	_notNullUnits pushBack oft_mortarcommander;
};

// Mortar Spotter
if (isNil "oft_mortarspotter") then {
	_nullUnits pushBack "Mortar Spotter";
} else {
	[5, oft_mortarspotter, "LOADOUT MORTAR SPOTTER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MORTAR SPOTTER";
	_notNullUnits pushBack oft_mortarspotter;
};

// Mortar ammo Bearer
if (isNil "oft_mortarammobearer") then {
	_nullUnits pushBack "Mortar Ammo Bearer";
} else {
	[5, oft_mortarammobearer, "LOADOUT MORTAR AMMO BEARER"] call OFT_fnc_gearHandle;
	_allAvailableLoadoutNames pushBack "LOADOUT MORTAR AMMO BEARER";
	_notNullUnits pushBack oft_mortarammobearer;
};

if (count _nullUnits > 0) then {
	_nullUnitsString = _nullUnits joinString ", ";
	_nullUnitsString = format ["%1 not found in mission, loadout not applied", _nullUnitsString];
	systemChat _nullUnitsString;
	diag_log _nullUnitsString;
};

_uniforms = [];
_uniformItems = [];
_vests = [];
_vestItems = [];
_backpacks = [];
_backpackItems = [];
_headgear = [];
_goggles = [];
_assignedItems = [];
_magazines = [];
_weapons = [];
_primaryWeaponItems = [];
_primaryWeaponMagazine = [];
_handgunItems = [];
_handgunMagazine = [];
_secondaryWeaponItems = [];
_secondaryWeaponMagazine = [];

AllPlayableUnitsItens = [];
{
	AllPlayableUnitsItens = AllPlayableUnitsItens + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackItems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x)
} forEach (_notNullUnits);
AllPlayableUnitsItens = AllPlayableUnitsItens select {
	count _x > 0
};
AllPlayableUnitsItens = AllPlayableUnitsItens arrayIntersect AllPlayableUnitsItens;

{
	_uniforms pushBack (uniform _x);
	_vests pushBack (vest _x);
	_backpacks pushBack (backpack _x);
	_headgear pushBack (headgear _x);
	_goggles pushBack (goggles _x);
	_assignedItems pushBack (assignedItems _x);
	_magazines pushBack (magazines _x);
	_weapons pushBack (weapons _x);
	_primaryWeaponItems pushBack (primaryWeaponItems _x);
	_primaryWeaponMagazine pushBack (primaryWeaponMagazine _x);
	_handgunItems pushBack (handgunItems _x);
	_handgunMagazine pushBack (handgunMagazine _x);
	_secondaryWeaponItems pushBack (secondaryWeaponItems _x);
	_secondaryWeaponMagazine pushBack (secondaryWeaponMagazine _x);
} forEach _notNullUnits;

// if (!(_uniforms isEqualTo [])) then {
	// ["fillBox", uniform_box_1, [], 0, _uniforms, 5, [], 0, [], 0] call OFT_fnc_customFillBox;
	// ["fillBox", uniform_box_2, [], 0, _uniforms, 5, [], 0, [], 0] call OFT_fnc_customFillBox;
//};

// if (!(_assignedItems isEqualTo [])) then {
	// ["fillBox", equipment_box_1, [], 0, _assignedItems, 5, [], 0, [], 0] call OFT_fnc_customFillBox;
	// ["fillBox", equipment_box_2, [], 0, _assignedItems, 5, [], 0, [], 0] call OFT_fnc_customFillBox;
//};

if (!(isNil "oft_addArsenalItems")) then {
	additionalItems = oft_addArsenalItems call ace_arsenal_fnc_getVirtualItems;
	// Convert because format return is: [["item1", any], ["item2", any], ["item3", any], ...]. Hashmap
	additionalItems = (toArray additionalItems)#0;

	// get unique items
	AllPlayableUnitsItens = AllPlayableUnitsItens + additionalItems;

	// Delete the box
	deleteVehicle oft_addArsenalItems;
};

if (!(isNil "oft_removeArsenalItems")) then {
	itemsRemove = oft_removeArsenalItems call ace_arsenal_fnc_getVirtualItems;
	// Convert because format return is: [["item1", any], ["item2", any], ["item3", any], ...]. Hashmap
	itemsRemove = (toArray itemsRemove)#0;

	// Remove items
	AllPlayableUnitsItens = AllPlayableUnitsItens - itemsRemove;

	// Delete the box
	deleteVehicle oft_removeArsenalItems;
};

// Save all items to missionNamespace
missionNamespace setVariable ["AllPlayableUnitsItens", AllPlayableUnitsItens, true];

// Save all loadout names to missionNamespace
missionNamespace setVariable ["AllAvailableLoadoutNames", _allAvailableLoadoutNames, true];

// Delete template units
{
	deleteVehicle _x;
} forEach _notNullUnits;

// // IS leader MASTER ALL SPECIALIST
missionNameSpace setVariable ["LeaderMasterAllSpecialist", _leaderMasterAllSpecialist, true];
// //