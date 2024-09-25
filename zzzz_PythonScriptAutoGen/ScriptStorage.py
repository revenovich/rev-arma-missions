# Init server file
init_server_sqf = ["initServer.sqf", r"""_faction = "custom"; // All factions are in the factions folder, use custom to edit your own.
_nightvision = true; // Set to true if you want players to spawn with nightvision
_fullArsenal = false;  // Set to false if you've manually set up a limited arsenal in the editor
_playerSideVar = ||||playerside||||; // Side of the player, west, east, guer, or civilian

missionNameSpace setVariable ["initDone", false, true];

systemChat "Loading mission...";
diag_log "Loading mission...";

[] execVM "mission_functions\mobileHQObjs.sqf";

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

[] call OFT_fnc_showFPS;"""]
# --------------------------------------------------------------------------------------------

# Init player local file
init_player_local_sqf = ["initPlayerLocal.sqf", r"""params ["_player", "_didJIP"];
missionNameSpace setVariable ["playerGear", [], false];

waitUntil { missionNameSpace getVariable ["initDone", false] };

systemChat "Gear Handler Loaded";
diag_log "Gear Handler Loaded";

[6] call OFT_fnc_gearHandle;
[0] call OFT_fnc_gearHandle;
[-1] call OFT_fnc_fortificationBox;
["init"] call OFT_fnc_respawnHandle;"""]
# --------------------------------------------------------------------------------------------

# Description.ext file
description_ext = ["description.ext", r"""
////////////////////////////////////////////////
//             EDITABLE VARIABLES             //
////////////////////////////////////////////////

onLoadMission = "||||onLoadMission||||";
loadScreen = "files\loadingImg.jpg";
onLoadName = "||||onLoadName||||";
author = "||||author||||";

////////////////////////////////////////////////
//       EDITABLE VARIABLES END HERE          //
// BELOW STILL EDITABLE BUT MUST KNOW HOW TO  //
////////////////////////////////////////////////

class CfgSounds
{
	sounds[] = {};
	class sound1
	{
		name = "sound1";
		sound[] = {"@A3\ui_f\data\sound\RscListbox\soundSelect", 0.2, 1};
		titles[] = {0,""};
	};
};

class cfgFunctions {
	class onefiftythlanguard
	{
		tag = "OFT";
		class functions
		{
			file = "functions";
			class coverMap;
			class customFillBox;
			class fortificationBox;
			class gearBox;
			class gearHandle;
			class holdActionAdd;
			class holdActionAddFortification;
			class respawnHandle;
			class showFPS;
		};
	};
};

class header {
	gameType = Zeus;
	minPlayers = 1;
	maxPlayers = 69;
};

class CfgORBAT
{
	class RADIO
	{
	side = "West";
	type = "Unknown";
	text = "150th Radio Settings";
	textShort = "RADIO";
	assets[] = {};
	color[] = {0,0,0,1};
	texture = __EVAL((__FILE__ select [0, count __FILE__ - 15]) + "files\logo1");
	description = "";

		class RADIOS
		{
			side = "West";
			type = "Unknown";
			text = "Radio Frequencies";
			textShort = "RADIOS";
			assets[] = {};
			color[] = {0,0,0,1};
			texture = __EVAL((__FILE__ select [0, count __FILE__ - 15]) + "files\logo1");
			description = "";

			class CO
			{
				side = "West";
				color[] = {0.7,0.6,0,1};
				size = "Company";
				type = "Unknown";
				text = "Company";
				textShort = "Company";
				assets[] = {};
				description = "Mixed Company.";

				class CO
				{
					side = "West";
					color[] = {0.7,0.6,0,1};
					size = "Fireteam";
					type = "HQ";
					text = "CO Team";
					textShort = "CO";
					assets[] = {};
					description = "CO element.<br/><br/>Freq: 69.1";
				};

				class Platoon
				{
					side = "West";
					color[] = {0.7,0.6,0,1};
					size = "Platoon";
					type = "Infantry";
					text = "150th Infantry Platoon";
					textShort = "Platoon";
					assets[] = {};
					description = "Infantry platoon of 18-40 members.<br/><br/>Freq: 69";

					class Alpha
					{
						side = "West";
						color[] = {0.7,0.6,0,1};
						size = "Squad";
						type = "Infantry";
						text = "Alpha Squad";
						textShort = "Alpha";
						assets[] = {};
						description = "Infantry squad of 8-12 members.<br/><br/>Freq: 41.1";
					};
					class Bravo
					{
						side = "West";
						color[] = {0.7,0.6,0,1};
						size = "Squad";
						type = "Infantry";
						text = "Bravo Squad";
						textShort = "Bravo";
						assets[] = {};
						description = "Infantry squad of 8-12 members.<br/><br/>Freq: 51.1";
					};
					class Charlie
					{
						side = "West";
						color[] = {0.7,0.6,0,1};
						size = "Squad";
						type = "Infantry";
						text = "Charlie Squad";
						textShort = "Charlie";
						assets[] = {};
						description = "Infantry squad of 8-12 members.<br/><br/>Freq: 61.1";
					};
					class Delta
					{
						side = "West";
						color[] = {0.7,0.6,0,1};
						size = "Squad";
						type = "Infantry";
						text = "Delta Squad";
						textShort = "Delta";
						assets[] = {};
						description = "Infantry squad of 8-12 members.<br/><br/>Freq: 71.1";
					};
				};
			};
		};
	};
};
"""]
# --------------------------------------------------------------------------------------------

# OnPlayerRespawn.sqf file
on_player_respawn_sqf = ["onPlayerRespawn.sqf", r"""params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if ((missionNameSpace getVariable "playerGear") isEqualTo []) then {
	[0] spawn OFT_fnc_gearHandle;
} else {
	[3] call OFT_fnc_gearHandle;
};

[_oldUnit] spawn {
	if (isNil "_oldUnit" || !hasInterface) exitWith {};

	params ["_oldUnit"];

	_healActionId = _oldUnit getVariable ["healActionId", -1];
	if (_healActionId > -1) then {
		_oldUnit removeAction _healActionId;
	};

	_unconsciousId = _oldUnit getVariable ["unconsciousId", -1];
	if (_unconsciousId > -1) then {
		_oldUnit removeEventHandler ["ace_unconscious", _unconsciousId];
	};
};

[_newUnit] spawn {
	if !(hasInterface || isDedicated) exitWith {};

	["init"] call OFT_fnc_respawnHandle;
	_newUnit = _this select 0;
	sleep 0.1;

	_unitSide = toUpper (missionNamespace getVariable "playerSideVar");
	_varName = format ["allRespawnMarkers%1", _unitSide];

	_nearestMarker = [missionNamespace getVariable _varName, _newUnit] call BIS_fnc_nearestPosition;
	_nearestMarkerVar = format ["%1_followVehicle", _nearestMarker];
	_vehicle = missionNamespace getVariable [_nearestMarkerVar, objNull];

	if (!isNull _vehicle) then {
		["movePlayerInSpawnVics", _newUnit, _vehicle, _nearestMarker] call OFT_fnc_respawnHandle;
	};

	missionNamespace setVariable ["maxNumberOfHeals", ||||heals||||, true];
	[_newUnit] execVM "mission_functions\manualHeal.sqf";
};"""]
# --------------------------------------------------------------------------------------------

# custom.sqf file
custom_sqf = ["faction\\custom.sqf", r"""// //// //////////////////////////////////////////
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

if (!(isNil "addArsenalItems")) then {
	additionalItems = addArsenalItems call ace_arsenal_fnc_getVirtualItems;
	// Convert because format return is: [["item1", any], ["item2", any], ["item3", any], ...]. Hashmap
	additionalItems = (toArray additionalItems)#0;

	// get unique items
	AllPlayableUnitsItens = AllPlayableUnitsItens + additionalItems;

	// Delete the box
	deleteVehicle addArsenalItems;
};

if (!(isNil "removeArsenalItems")) then {
	itemsRemove = removeArsenalItems call ace_arsenal_fnc_getVirtualItems;
	// Convert because format return is: [["item1", any], ["item2", any], ["item3", any], ...]. Hashmap
	itemsRemove = (toArray itemsRemove)#0;

	// Remove items
	AllPlayableUnitsItens = AllPlayableUnitsItens - itemsRemove;

	// Delete the box
	deleteVehicle removeArsenalItems;
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
// //"""]
# --------------------------------------------------------------------------------------------

# fn_coverMap.sqf file
fn_coverMap_sqf = ["functions\\fn_coverMap.sqf", r"""////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_spawn = {
    _center = (getMarkerPos "coverMapAreaCenter");
    _size = (getMarkerSize "coverMapAreaCenter");
    _bignumber = 50000;

    // edit area marker
    "coverMapAreaCenter" setMarkerShape "RECTANGLE";
    "coverMapAreaCenter" setMarkerBrush "Border";

    // create leftright area markers
    _mk = createMarker ["coverMapAreaLeft", [(-_bignumber + (_center select 0) - (_size select 0)), (_center select 1)]];
    _mk setMarkerShape "RECTANGLE";
    _mk setMarkerBrush "SOLID";
    _mk setMarkerSize [_bignumber, _bignumber];
    _mk = createMarker ["coverMapAreaRight", [(_bignumber + (_center select 0) + (_size select 0)), (_center select 1)]];
    _mk setMarkerShape "RECTANGLE";
    _mk setMarkerBrush "SOLID";
    _mk setMarkerSize [_bignumber, _bignumber];

    // create topbot area markers
    _mk = createMarker ["coverMapAreaTop", [(_center select 0), (_bignumber + (_center select 1) + (_size select 1))]];
    _mk setMarkerShape "RECTANGLE";
    _mk setMarkerBrush "SOLID";
    _mk setMarkerSize [(_size select 0), _bignumber];
    _mk = createMarker ["coverMapAreaBot", [(_center select 0), (-_bignumber + (_center select 1) - (_size select 1))]];
    _mk setMarkerShape "RECTANGLE";
    _mk setMarkerBrush "SOLID";
    _mk setMarkerSize [(_size select 0), _bignumber];

    // create corner markers
    _mk = createMarker ["coverMapSquareTopLeft", [((_center select 0) - (_size select 0)), ((_center select 1) + (_size select 1))]];
    _mk setMarkerType "mil_box_noShadow";
    _mk = createMarker ["coverMapSquareTopRight", [((_center select 0) + (_size select 0)), ((_center select 1) + (_size select 1))]];
    _mk setMarkerType "mil_box_noShadow";
    _mk = createMarker ["coverMapSquareBotLeft", [((_center select 0) - (_size select 0)), ((_center select 1) - (_size select 1))]];
    _mk setMarkerType "mil_box_noShadow";
    _mk = createMarker ["coverMapSquareBotRight", [((_center select 0) + (_size select 0)), ((_center select 1) - (_size select 1))]];
    _mk setMarkerType "mil_box_noShadow";
};

fn_transform = {
    _center = (_this select 0);
    _size = (_this select 1);
    _bignumber = 50000;

    // transform leftright area markers
    "coverMapAreaLeft" setMarkerPos [(-_bignumber + (_center select 0) - (_size select 0)), (_center select 1)];
    "coverMapAreaRight" setMarkerPos [(_bignumber + (_center select 0) + (_size select 0)), (_center select 1)];

    // transform topbot area markers
    "coverMapAreaTop" setMarkerPos [(_center select 0), (_bignumber + (_center select 1) + (_size select 1))];
    "coverMapAreaTop" setMarkerSize [(_size select 0), _bignumber];
    "coverMapAreaBot" setMarkerPos [(_center select 0), (-_bignumber + (_center select 1) - (_size select 1))];
    "coverMapAreaBot" setMarkerSize [(_size select 0), _bignumber];

    // transform area marker
    "coverMapAreaCenter" setMarkerPos _center;
    "coverMapAreaCenter" setMarkerSize _size;

    // transform corner markers
    "coverMapSquareTopLeft" setMarkerPos [((_center select 0) - (_size select 0)), ((_center select 1) + (_size select 1))];
    "coverMapSquareTopRight" setMarkerPos [((_center select 0) + (_size select 0)), ((_center select 1) + (_size select 1))];
    "coverMapSquareBotLeft" setMarkerPos [((_center select 0) - (_size select 0)), ((_center select 1) - (_size select 1))];
    "coverMapSquareBotRight" setMarkerPos [((_center select 0) + (_size select 0)), ((_center select 1) - (_size select 1))];
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if ((getMarkerColor "coverMapAreaLeft") == "") then {
	// init
	[] call fn_spawn;
} else {
	// change location
	_this call fn_transform;
};"""]
# --------------------------------------------------------------------------------------------

# fn_customFillBox.sqf file
fn_customFillBox_sqf = ["functions\\fn_customFillBox.sqf", r"""fn_clearBox = {
	params ["_box"];
	if (isNil "_box") exitWith {};
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};

fn_fillBox = {
	params ["_box", "_weapons", "_weaponsNum", "_items", "_itemsNum", "_mags", "_magsNum", "_backpacks", "_backpacksNum"];
	if (!(isNil "_weapons") && !(isNil "_weaponsNum")) then {
		if (!(_weapons isEqualTo [])) then {
			if (_weaponNum isEqualTo 0) then {
				{ _box addWeaponCargoGlobal [_x, 1] } forEach _weapons;
			} else {
				{ _box addWeaponCargoGlobal [_x, _weaponNum] } forEach _weapons;
			};
		};
	};

	if (!(isNil "_items") && !(isNil "_itemsNum")) then {
		if (!(_items isEqualTo [])) then {
			if (_itemsNum isEqualTo 0) then {
				{
					if (typeName _x isEqualTo "ARRAY") then {
						{ _box addItemCargoGlobal [_x, 1] } forEach _x;
					} else {
						_box addItemCargoGlobal [_x, 1];
					};
				} forEach _items;
			} else {
				{ 
					if (typeName _x isEqualTo "ARRAY") then {
						{ _box addItemCargoGlobal [_x, _itemsNum] } forEach _x;
					} else {
						_box addItemCargoGlobal [_x, _itemsNum];
					};
				} forEach _items;
			};
		};
	};

	if (!(isNil "_mags") && !(isNil "_magsNum")) then {
		if (!(_mags isEqualTo [])) then {
			if (_magsNum isEqualTo 0) then {
				{ _box addMagazineCargoGlobal [_x, 1] } forEach _mags;
			} else {
				{ _box addMagazineCargoGlobal [_x, _magsNum] } forEach _mags;
			};
		};
	};

	if (!(isNil "_backpacks") && !(isNil "_backpacksNum")) then {
		if (!(_backpacks isEqualTo [])) then {
			if (_backpacksNum isEqualTo 0) then {
				{ _box addBackpackCargoGlobal [_x, 1] } forEach _backpacks;
			} else {
				{ _box addBackpackCargoGlobal [_x, _backpacksNum] } forEach _backpacks;
			};
		};
	};
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if (!isServer) exitWith {};

_request = _this select 0;

switch (_request) do {
	case "init": {
		systemChat "custom fill box init";
	};

	case "fillBox": {
		_box = _this select 1;
		_weapons = _this select 2;
		_weaponsNum = _this select 3;
		_items = _this select 4;
		_itemsNum = _this select 5;
		_mags = _this select 6;
		_magsNum = _this select 7;
		_backpacks = _this select 8;
		_backpacksNum = _this select 9;

		[_box] call fn_clearBox;
		[_box, _weapons, _weaponsNum, _items, _itemsNum, _mags, _magsNum, _backpacks, _backpacksNum] call fn_fillBox;
	};

	case "clearBox": {
		_box = _this select 1;

		[_box] call fn_clearBox;
	};
};"""]
# --------------------------------------------------------------------------------------------

# fn_fortificationBox.sqf file
fn_fortificationBox_sqf = ["functions\\fn_fortificationBox.sqf", r"""////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_addConfirmAction = {
    _object = _this;

    // Add the hold-action to the object
	_actionId = [
		/* 0 object */                      player,
		/* 1 action title */
		{
			"Place object"
		},
		/* 2 idle icon */                   "files\holdAction_hammer.paa",
		/* 3 progress icon */               "files\holdAction_hammer.paa",
		/* 4 condition to show */           "true",
		/* 5 condition for action */        "true",
		/* 6 code executed on start */      {},
		/* 7 code executed per tick */      {},
		/* 8 code executed on completion */
		{
			playSound "sound1";

            _object = _caller getVariable "movingObject";
            _caller setVariable ["movingObject", objNull, true];
            _caller setVariable ["movingObjectOrigin", objNull, true];
            _caller setVariable ["movingObjectMaterialCost", 0, true];
            _object setVariable ["moving", false, true];
            [_caller, "forceWalk", "MovingObject", false] call ace_common_fnc_statusEffect_set;
            _caller action ["SwitchWeapon", _caller, _caller, 0];
            ["ace_common_enableSimulationGlobal", [_object, true]] call CBA_fnc_serverEvent;
			[] call fn_removeAllMovingObjectActions;
		},
		/* 9 code executed on interruption */   {},
		/* 10 arguments */                      [],
		/* 11 action duration */                1,
		/* 12 priority */                       10,
		/* 13 remove on completion */           false,
		/* 14 show unconscious */               false
	] call OFT_fnc_holdActionAdd;

	// Add action id to players movingObjectActionIDs
	_actionID call fn_addMovingObjectActionID;
};

fn_addMovingObjectActionID = {
	_actionID = _this;
	_actionIDs = player getVariable ["movingObjectActionIDs", []];
	_actionIDs pushback _actionID;
	player setVariable ["movingObjectActionIDs", _actionIDs, false];
};

fn_removeAllMovingObjectActions = {
	_actionIDs = player getVariable ["movingObjectActionIDs", []];
	{
		player removeAction _x;
	} foreach _actionIDs;
};

fn_addReturnAction = {
    _object = _this;

    // Add the hold-action to the object
	_actionId = [
		/* 0 object */                      player,
		/* 1 action title */
		{
			"<t color='#ff8888'>Return object</t>"
		},
		/* 2 idle icon */                   "files\holdAction_return.paa",
		/* 3 progress icon */               "files\holdAction_return.paa",
		/* 4 condition to show */           "true",
		/* 5 condition for action */        "true",
		/* 6 code executed on start */      {},
		/* 7 code executed per tick */      {},
		/* 8 code executed on completion */
		{
			playSound "sound1";

            _caller call fn_returnObject;
		},
		/* 9 code executed on interruption */   {},
		/* 10 arguments */                      [],
		/* 11 action duration */                1,
		/* 12 priority */                       7,
		/* 13 remove on completion */           false,
		/* 14 show unconscious */               false
	] call OFT_fnc_holdActionAdd;

	// Add action id to players movingObjectActionIDs
	_actionID call fn_addMovingObjectActionID;
};

fn_addRotateAction = {
    _object = _this;

    _actionId = player addAction [
        "<t color='#FFFFFF' align='left'>Rotate object</t>        <t color='#83ffffff' align='right'>R     </t>",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
			playSound "sound1";

            _object  = _caller getVariable "movingObject";
            _rotation = _object getVariable "rotation";
            _rotation = (_rotation + 30) % 360;
            _object setVariable ["rotation",  _rotation, true];
		},
        [], // arguments
        9, // priority
        false, // showWindow
        false, // hideOnUse
        "reloadMagazine", // shortcut
        "true" // condition
    ];

	// Add action id to players movingObjectActionIDs
	_actionID call fn_addMovingObjectActionID;
};

fn_addSnapAction = {
    _object = _this;

    _actionId = player addAction [
        "<t color='#FFFFFF' align='left'>Toggle snap</t>        <t color='#83ffffff' align='right'>E     </t>",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
			playSound "sound1";

            _object  = _caller getVariable "movingObject";
            _snapToTerrain = _object getVariable "snapToTerrain";
            _object setVariable ["snapToTerrain",  !_snapToTerrain, true];
		},
        [], // arguments
        8, // priority
        false, // showWindow
        false, // hideOnUse
        "LeanRight", // shortcut
        "true" // condition
    ];

	// Add action id to players movingObjectActionIDs
	_actionID call fn_addMovingObjectActionID;
};

fn_addFortificationAction = {
	_object = _this select 0;
	_objectClassname = _this select 1;
	_objectName = _this select 2;
	_objectCost = _this select 3;
	_objectDistance = _this select 4;
	_objectDefaultRotation = _this select 5;

	//TODO: try setting the arguments as variables, or passing arguments, or embedding arguments

	// Add the hold-action to the object
	[
		/* 0 object */                      _object,
		/* 1 action title */
		{
			_target = _this select 0;
			_arguments = _this select 1;
			_name = _arguments select 1;
			_cost = _arguments select 2;
			if (typeName _cost == "STRING") then {
				_cost = parseNumber _cost;
			};
			if ((_target getVariable 'materialCount') - _cost < 0) then {
				(format ["</t><t color='#FFFF00' align='left'>%1</t><t color='#FFFFFF' align='left'>, cost %2 </t><t color='#FF0000' align='left'>(%3 left)", _name, _cost, (_target getVariable 'materialCount') / _cost]);
            } else {
                (format ["</t><t color='#FFFF00' align='left'>%1</t><t color='#FFFFFF' align='left'>, cost %2 (%3 left)", _name, _cost, (_target getVariable 'materialCount') / _cost]);
            };
		},
		/* 2 idle icon */                   "files\holdAction_hammer.paa",
		/* 3 progress icon */               "files\holdAction_hammer.paa",
		/* 4 condition to show */           "(_this distance _target < (_target getVariable ""interactionDistance"")) && ((_this getVariable [""movingObject"", objNull]) isEqualTo objNull)",
		/* 5 condition for action */        "(_this distance _target < (_target getVariable ""interactionDistance"")) && (_target getVariable ""materialCount"") >= (_arguments select 2) && {_isEngineer = _this getVariable [""Ace_IsEngineer"", 0]; if (_isEngineer isEqualType false) then { _isEngineer = [0, 1] select _isEngineer; }; _isEngineer == 1}",
		/* 6 code executed on start */      {},
		/* 7 code executed per tick */      {},
		/* 8 code executed on completion */
		{
			playSound "sound1";

            _objectClassname = _arguments select 0;
            _objectCost = _arguments select 2;
            _objectDistance = _arguments select 3;
			_objectDefaultRotation = _arguments select 4;
            _materialCount = (_target getVariable "materialCount");

            if (_materialCount >= _objectCost) then {
                _target setVariable ["materialCount", _materialCount - _objectCost, true];
                [_objectClassname, _objectCost, _objectDistance, _objectDefaultRotation, _target] call fn_giveObject;
                _target setVariable ["updateAllHoldActions", true, true];
            };
		},
		/* 9 code executed on interruption */
		{
			_isEngineer = _caller getVariable ["Ace_IsEngineer", 0];
			if (_isEngineer isEqualType false) then {
				_isEngineer = [0, 1] select _isEngineer;
			};
			if (_isEngineer != 1) then {
				cutText ["You are not an engineer", "PLAIN", 0.2];
			};
		},
		/* 10 arguments */                      [_objectClassname, _objectName, _objectCost, _objectDistance, _objectDefaultRotation],
		/* 11 action duration */                1,
		/* 12 priority */                       10,
		/* 13 remove on completion */           false,
		/* 14 show unconscious */               false
	] remoteExec ["OFT_fnc_holdActionAddFortification",[0,-2] select isDedicated,true];
};

fn_createBox = {
	_position = _this select 0;
    _classname = _this select 1;

	// Spawn ammobox
	_object = createVehicle [_classname, _position, [], 0, "CAN_COLLIDE"];

	// Empty ammobox
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;

	// Allow zeuses to move the ammobox
	{
		_x addCuratorEditableObjects [[_object],true];
	} foreach allCurators;

	_object;
};

fn_giveObject = {
    _classname = _this select 0;
    _materialCost = _this select 1;
    _distanceToPlayer = _this select 2;
	_defaultRotation = _this select 3;
    _box = _this select 4;
    _unit = player;
    _object = createVehicle [_classname, [0, 0, 0]];
    _object setVariable ["moving", true, true];
	_object setVariable ["rotation", _defaultRotation, true];
    _object setVariable ["snapToTerrain", false, true];
    _unit setVariable ["movingObject", _object, true];
    _unit setVariable ["movingObjectMaterialCost", _materialCost, true];
    _unit setVariable ["movingObjectOrigin", _box, true];

    // prevent the placing unit from running
    [_unit, "forceWalk", "MovingObject", true] call ace_common_fnc_statusEffect_set;

    // Prevent collisions with object
    ["ace_common_enableSimulationGlobal", [_object, false]] call CBA_fnc_serverEvent;

    [_object, _distanceToPlayer] spawn fn_updateObject;
    _object spawn fn_addConfirmAction;
    _object spawn fn_addReturnAction;
    _object spawn fn_addRotateAction;
    _object spawn fn_addSnapAction;
};

fn_returnObject = {
	_caller = _this;
	_box = _caller getVariable "movingObjectOrigin";
	_materialCost = _caller getVariable "movingObjectMaterialCost";
	_object = _caller getVariable "movingObject";

	_caller setVariable ["movingObject", objNull, true];
	_caller setVariable ["movingObjectOrigin", objNull, true];
	_caller setVariable ["movingObjectMaterialCost", 0, true];
	[_caller, "forceWalk", "MovingObject", false] call ace_common_fnc_statusEffect_set;
	[] call fn_removeAllMovingObjectActions;

	if (!(_object isEqualTo objNull)) then {
		deleteVehicle _object;
	};

	if (!(_box isEqualTo objNull)) then {
		_box setVariable ["materialCount", (_box getVariable "materialCount") + _materialCost, true];
		_box setVariable ["updateAllHoldActions", true, true];
	};
};

fn_updateObject = {
    _object = _this select 0;
    _distanceToPlayer = _this select 1;
    _unit = player;
    _objectPos = [];
    _objectDir = 0;

    while {alive _object && _object getVariable "moving"} do {
        // Force player to holster weapon
        _unit action ["SwitchWeapon", _unit, _unit, -1];

        _objectPos = _unit ModelToWorld [0,_distanceToPlayer,0];
        _objectDir = getDir _unit + (_object getVariable "rotation");

		// Exit if player dead, unconscious or in a vehicle, or if object is gone
		if (!alive _unit || !alive _object || (!(isNull (objectParent _unit))) || (_unit getVariable ["ACE_isUnconscious", false])) exitWith {
			_unit call fn_returnObject;
		};

        // _v1 forward from the player, _v2 to the right, _v3 points away from the ground
        private _v3 = surfaceNormal _objectPos;
        private _v2 = [sin _objectDir, +cos _objectDir, 0] vectorCrossProduct _v3;
        private _v1 = _v3 vectorCrossProduct _v2;

        // Stick the object to the ground
        _objectPos set [2, getTerrainHeightASL _objectPos];

        // Set object position
        _object setPosASL _objectPos;
        if (_object getVariable "snapToTerrain") then {
            _object setVectorDirAndUp [_v1, _v3];
        } else {
            _v1 set [2, 0];
            _object setVectorDirAndUp [_v1, [0,0,1]];
        };
    };
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if (isDedicated && !isServer) exitWith {};

_request = _this select 0;

switch (_request) do {
	// INITIALISATION
	case -1: {

	};

	// SMALL FORTIFICATIONS
	case 0: {
        _position = _this select 1;
        _materialCount = 10;
        _interactionDistance = 3;
        _object = [_position, "CargoNet_01_box_f"] call fn_createBox;
		[_object, 4] call ace_cargo_fnc_setSize;
		_object setDir (round random 360);
        _object setVariable ["materialCount", _materialCount, true];
        _object setVariable ["interactionDistance", _interactionDistance, true];

		// params = [_box, _className, _displayName, _cost, _distanceFromPlayer]
		[_object, "Land_BagBunker_Small_F", "BAGBUNKER", 5, 4, 180] call fn_addFortificationAction;
		[_object, "Land_BagFence_Long_F", "BAGWALL", 1, 3, 0] call fn_addFortificationAction;
		[_object, "Land_BagFence_Round_F", "BAGWALLROUND", 1, 3, 180] call fn_addFortificationAction;
		[_object, "Land_HBarrier_1_F", "HBARRIER", 2, 3, 90] call fn_addFortificationAction;
		[_object, "Land_CzechHedgeHog_01_new_F", "HEDGEHOG", 1, 3, 0] call fn_addFortificationAction;
	};

	// BIG FORTIFICATIONS
	case 1: {
        _position = _this select 1;
        _materialCount = 100;
        _interactionDistance = 5;
        _object = [_position, "B_Slingload_01_Cargo_F"] call fn_createBox;
		_object setDir (round random 360);
        _object setVariable ["materialCount", _materialCount, true];
        _object setVariable ["interactionDistance", _interactionDistance, true];

		// params = [_box, _className, _displayName, _cost, _distanceFromPlayer _defaultRotation]
		[_object, "Land_BagBunker_Large_F", "BAGBUNKERLARGE", 20, 9, 180] call fn_addFortificationAction;
		[_object, "Land_BagBunker_Small_F", "BAGBUNKERSMALL", 5, 4, 180] call fn_addFortificationAction;
		[_object, "Land_BagFence_Long_F", "BAGWALL", 1, 3, 0] call fn_addFortificationAction;
		[_object, "Land_BagFence_Round_F", "BAGWALLROUND", 1, 3, 180] call fn_addFortificationAction;
		[_object, "Land_HBarrier_1_F", "HBARRIER1", 2, 3, 90] call fn_addFortificationAction;
		[_object, "Land_HBarrier_3_F", "HBARRIER3", 6, 3, 0] call fn_addFortificationAction;
		[_object, "Land_HBarrier_5_F", "HBARRIER5", 10, 5, 0] call fn_addFortificationAction;
		[_object, "Land_HBarrier_Big_F", "HBARRIERLARGE", 10, 6, 0] call fn_addFortificationAction;
		[_object, "Land_CzechHedgeHog_01_new_F", "HEDGEHOG", 1, 3, 0] call fn_addFortificationAction;
		[_object, "Land_CncShelter_F", "CONCRETESHELTER", 4, 3, 0] call fn_addFortificationAction;
		[_object, "Land_CncBarrierMedium_F", "CONCRETEBARRIER", 1, 3, 0] call fn_addFortificationAction;
		[_object, "Land_Razorwire_F", "RAZORWIRE", 1, 6, 0] call fn_addFortificationAction;
	};

	// SMALL FORTIFICATIONS ON EXISTING OBJECT
	case 2: {
        _object = _this select 1;
        _materialCount = 10;
        _interactionDistance = 3;
		[_object, 4] call ace_cargo_fnc_setSize;
        _object setVariable ["materialCount", _materialCount, true];
        _object setVariable ["interactionDistance", _interactionDistance, true];

		// params = [_box, _className, _displayName, _cost, _distanceFromPlayer]
		[_object, "Land_BagBunker_Small_F", "BAGBUNKER", 5, 4, 180] call fn_addFortificationAction;
		[_object, "Land_BagFence_Long_F", "BAGWALL", 1, 3, 0] call fn_addFortificationAction;
		[_object, "Land_BagFence_Round_F", "BAGWALLROUND", 1, 3, 180] call fn_addFortificationAction;
		[_object, "Land_HBarrier_1_F", "HBARRIER", 2, 3, 90] call fn_addFortificationAction;
		[_object, "Land_CzechHedgeHog_01_new_F", "HEDGEHOG", 1, 3, 0] call fn_addFortificationAction;
	};

	// BIG FORTIFICATIONS ON EXISTING OBJECT
	case 3: {
        _object = _this select 1;
        _materialCount = _this select 2;

		if (isNil "_materialCount") then {
        	_materialCount = 800000;
		};
        _interactionDistance = 10;
        _object setVariable ["materialCount", _materialCount, true];
        _object setVariable ["interactionDistance", _interactionDistance, true];

		// params = [_box, _className, _displayName, _cost, _distanceFromPlayer]
		[_object, "Land_BagBunker_Small_F", "BAGBUNKERSMALL", 5, 4, 180] call fn_addFortificationAction;
		[_object, "Land_BagFence_Long_F", "BAGWALL", 1, 3, 0] call fn_addFortificationAction;
		[_object, "Land_BagFence_Round_F", "BAGWALLROUND", 1, 3, 180] call fn_addFortificationAction;
		[_object, "Land_HBarrier_1_F", "HBARRIER1", 2, 3, 90] call fn_addFortificationAction;
		[_object, "Land_HBarrier_3_F", "HBARRIER3", 6, 3, 0] call fn_addFortificationAction;
		[_object, "Land_HBarrier_5_F", "HBARRIER5", 10, 5, 0] call fn_addFortificationAction;
		[_object, "Land_HBarrier_Big_F", "HBARRIERLARGE", 10, 6, 0] call fn_addFortificationAction;
		[_object, "B_APC_Wheeled_01_cannon_F", "Badger IFV", 50000, 10, 0] call fn_addFortificationAction;
		[_object, "rhs_btr80a_msv", "BTR-80A", 20000, 10, 0] call fn_addFortificationAction;
		[_object, "O_T_MBT_02_railgun_ghex_F", "T-100X Futura", 100000, 10, 0] call fn_addFortificationAction;
		[_object, "O_T_MBT_04_command_F", "T-14K Armata", 100000, 10, 0] call fn_addFortificationAction;
		[_object, "rhsusf_m1a2sep1tuskiiwd_usarmy", "M1A2SepV1 (TUSK II)", 100000, 10, 0] call fn_addFortificationAction;
		[_object, "rhs_t90sm_tv", "T-90SM", 100000, 10, 0] call fn_addFortificationAction;
	};
};"""]
# --------------------------------------------------------------------------------------------

# fn_gearBox.sqf file
fn_gearBox_sqf = ["functions\\fn_gearBox.sqf", r"""////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_addAllActions = {
	params ["_object", "_distance"];

	[_object, _distance] call fn_addRearmAction;
	_object call fn_addSaveAction;

	_blackListedLoadouts = missionNamespace getVariable "BlackListedLoadouts";

	_allAvailableLoadoutNames = missionNamespace getVariable "AllAvailableLoadoutNames";
	if (isNil "_allAvailableLoadoutNames") exitWith {};
	{
		if (!(_x in _blackListedLoadouts)) then {
			[_object, _x, _distance] call fn_addLoadoutAction;
		};
	} foreach _allAvailableLoadoutNames;
};

fn_addLoadoutAction = {
	params ["_object", "_type", "_distance"];

	// Because the loadout name have "LOADOUT" prefix we need to remove it
	// Split the string by space
	_typeSplitted = _type splitString " ";

	// Remove the first element
	_remove = _typeSplitted deleteAt 0;

	// Join the string back
	_type = _typeSplitted joinString " ";

	// Add the hold-action to the object
	[
		/* 0 object */                      	_object,
		/* 1 action title */                	format ["Load %1", _type],
		/* 2 idle icon */                   	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
		/* 3 progress icon */               	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloadDevice_ca.paa",
		/* 4 condition to show */           	format ["(_this distance _target < %1)", _distance],
		/* 5 condition for action */        	format ["(_this distance _target < %1)", _distance],
		/* 6 code executed on start */      	{},
		/* 7 code executed per tick */      	{},
		/* 8 code executed on completion */
		{
			_type = param [3] # 0;
			playSound "sound1";
			[1, _type] call OFT_fnc_gearHandle;
		},
		/* 9 code executed on interruption */   {},
		/* 10 arguments */                      [_type],
		/* 11 action duration */                1,
		/* 12 priority */                       8,
		/* 13 remove on completion */           false,
		/* 14 show unconscious */               false
	] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];
};

fn_addRearmAction = {
	params ["_object", "_distance"];

	// Add the hold-action to the object
	[
		/* 0 object */                      	_object,
		/* 1 action title */
		{
			switch (_this getVariable 'rearmUses') do {
				case -1: {
					"REARM";
				};

				case 0: {
					(format ["REARM</t><t color='#FF0000' align='left'> (%1 uses)", (_this getVariable 'rearmUses')]);
				};

				case 1: {
					(format ["REARM (%1 use)", (_this getVariable 'rearmUses')]);
				};

				default {
					(format ["REARM (%1 uses)", (_this getVariable 'rearmUses')]);
				};
			};
		},
		/* 2 idle icon */                   	"files\holdAction_rearm.paa",
		/* 3 progress icon */               	"files\holdAction_rearm.paa",
		/* 4 condition to show */           	format ["(_this distance _target < %1)", _distance],
		/* 5 condition for action */        	format ["(_this distance _target < %1) && (_target getVariable ""rearmUses"") != 0", _distance],
		/* 6 code executed on start */      	{},
		/* 7 code executed per tick */      	{},
		/* 8 code executed on completion */
		{
			playSound "sound1";

			if (!((missionNameSpace getVariable "playerGear") isEqualTo [])) then {
				_rearmUses = (_target getVariable "rearmUses");
				if (_rearmUses != 0) then {
					if (_rearmUses > 0) then {
						_target setVariable ["rearmUses", _rearmUses - 1, false];
					};
					cutText ["Rearmed", "PLAIN", 0.2];
					[3] call OFT_fnc_gearHandle;
					["ace_medical_treatment_fullHealLocal", [_caller], _caller] call CBA_fnc_targetEvent;
				};
			} else {
				cutText ["You don't have any loadout saved!", "PLAIN", 0.2];
			};
		},
		/* 9 code executed on interruption */
		{
			if ((_target getVariable "rearmUses") == 0) then {
				cutText ["Rearm has no uses left!", "PLAIN", 0.2];
			};
		},
		/* 10 arguments */                      [],
		/* 11 action duration */                1,
		/* 12 priority */                       10,
		/* 13 remove on completion */           false,
		/* 14 show unconscious */               false
	] remoteExec ["OFT_fnc_holdActionAdd",[0,-2] select isDedicated,true];
};

fn_addSaveAction = {
	_object = _this;

	// Add the hold-action to the object
	[
		/* 0 object */                          _object,
		/* 1 action title */                    "SAVE loadout for rearm",
		/* 2 idle icon */                       "files\holdAction_save.paa",
		/* 2 idle icon */                       "files\holdAction_save.paa",
		/* 4 condition to show */               "(_this distance _target < 3)",
		/* 5 condition for action */            "(_this distance _target < 3)",
		/* 6 code executed on start */          {},
		/* 7 code executed per tick */          {},
		/* 8 code executed on completion */
		{
			playSound "sound1";

			[2] call OFT_fnc_gearHandle;
		},
		/* 9 code executed on interruption */   {},
		/* 10 arguments */                      [],
		/* 11 action duration */                1,
		/* 12 priority */                       9,
		/* 13 remove on completion */           false,
		/* 14 show unconscious */               false
	] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];
};

fn_createBox = {
	_position = _this;

	// Spawn ammobox
	_object = createVehicle ["B_supplyCrate_F", _position, [], 0, "CAN_COLLIDE"];
	_object setDir (round random 360);
	[_object, 4] call ace_cargo_fnc_setSize;

	// Allow zeuses to move the ammobox
	{
		_x addCuratorEditableObjects [[_object],true];
	} foreach allCurators;

	_object;
};

fn_clearCargo = {
	_object = _this;

	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearBackpackCargoGlobal _object;
};

fn_addArsenal = {
	_object = _this;

	if (missionNameSpace getVariable ["fullArsenal", false]) then {
		[_object, true] call ace_arsenal_fnc_initBox;
		["AmmoboxInit", [_object, true]] call BIS_fnc_arsenal;
	} else {
		_allPlayableUnitsItens = missionNamespace getVariable "allPlayableUnitsItens";
		[_object, _allPlayableUnitsItens, true] call ace_arsenal_fnc_initBox;
		[_object, _allPlayableUnitsItens, true] call ace_arsenal_fnc_addVirtualItems;
	}
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if (isDedicated && !isServer) exitWith {};

_request = _this select 0;

switch (_request) do {
	// START BOX
	case 0: {
		_position = _this select 1;
		_distance = _this select 2;

		if (isNil "_distance") then {
			_distance = 3;
		};
		
		_object = _position call fn_createBox;
		_object setVariable ["rearmUses", -1, true];

		_object call fn_clearCargo;
		[_object, _distance] call fn_addAllActions;
		_object call fn_addArsenal;
	};

	// REARM BOX
	case 1: {
		_position = _this select 1;
		_distance = _this select 2;
		_numberOfUses = _this select 3;
		_object = _position call fn_createBox;

		if (isNil "_numberOfUses") then {
			_numberOfUses = 1;
		};

		if (isNil "_distance") then {
			_distance = 3;
		};

		_object setVariable ["rearmUses", 1, true];

		_object call fn_clearCargo;
		[_object, _distance] call fn_addRearmAction;
	};

	// START BOX ON OBJECT
	case 2: {
		_object = _this select 1;
		_distance = _this select 2;

		if (isNil "_distance") then {
			_distance = 3;
		};

		[_object, 4] call ace_cargo_fnc_setSize;
		_object setVariable ["rearmUses", -1, true];

		_object call fn_clearCargo;
		[_object, _distance] call fn_addAllActions;
		_object call fn_addArsenal;
	};

	// REARM BOX ON OBJECT
	case 3: {
		_object = _this select 1;
		_distance = _this select 2;
		_numberOfUses = _this select 3;

		if (isNil "_numberOfUses") then {
			_numberOfUses = 1;
		};

		if (isNil "_distance") then {
			_distance = 3;
		};

		[_object, 4] call ace_cargo_fnc_setSize;

		_alreadyRearmObject = !isNil {_object getVariable "rearmUses"};

		_object setVariable ["rearmUses", _numberOfUses, true];
		// TODO: - Figure out if cleaning the inventory is actually desired
		//         when applied to an existing object
		//       - Update zeusopsmod and make the module use case 1 instead of
		//         this one
		_object call fn_clearCargo;


		if (!_alreadyRearmObject) then {
			[_object, _distance] call fn_addRearmAction;
		};
	};
};
"""]
# --------------------------------------------------------------------------------------------

# fn_gearHandle.sqf file
fn_gearHandle_sqf = ["functions\\fn_gearHandle.sqf", r"""/*
	@file_name: fn_gearHandle.sqf
	@file_author: Dyzalonius
*/

//// ////////////////////////////////////////////
//               SUB-FUNCTIONS               // 
//// ////////////////////////////////////////////

fn_gearSnitch = {
	_gearMessage = "";

	{
		if ("MineDetector" in (vestItems player + uniformItems player + backpackItems player)) then {
			_gearMessage = _gearMessage + format["\n%1 - MINEDETECTOR", name _x];
		};
		if ((secondaryWeapon _x) in ["launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_F"]) then {
			_gearMessage = _gearMessage + format["\n%1 - MAAWS MOD1", name _x];
		};
		if (!((primaryWeapon _x) in [_weaponMain select 0, _weaponAR select 0]) && (primaryWeapon _x) != "") then {
			_gearMessage = _gearMessage + format["\n%1 - PRIMARY:\n%2", name _x, primaryWeapon _x];
		};
	} forEach allPlayers;

	if (_gearMessage == "") then {
		hint "No suspicious gear";
	} else {
		hint _gearMessage;
	};
};

fn_gearLoad = {
	_loadout = missionNameSpace getVariable "playerGear";

	if (_loadout isEqualTo []) exitWith {};

	// remove current container contents
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeBackpack player;
	removeGoggles player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeAllWeapons player;

	// Give all items if they dont have it already
	if ((_loadout select 0 select 0) == "") then {
		removeUniform player;
	} else {
		player forceAddUniform (_loadout select 0 select 0);
	};
	if ((_loadout select 0 select 1) == "") then {
		removeVest player;
	} else {
		player addVest (_loadout select 0 select 1);
	};
	if ((_loadout select 0 select 2) != (backpack player)) then {
		if ((_loadout select 0 select 2) == "") then {
			removeBackpack player;
		} else {
			player addBackpack (_loadout select 0 select 2);
		};
	};
	if ((_loadout select 0 select 3) == "") then {
		removeHeadgear player;
	} else {
		player addHeadgear (_loadout select 0 select 3);
	};
	if ((_loadout select 0 select 4) == "") then {
		removeGoggles player;
	} else {
		player addGoggles (_loadout select 0 select 4);
	};
	if ((_loadout select 0 select 5) == "") then {
		player unlinkItem (hmd player);
	} else {
		player linkItem (_loadout select 0 select 5);
	};
	if ((_loadout select 0 select 6) == "") then {
		player removeWeapon (binocular player);
	} else {
		player addWeapon (_loadout select 0 select 6);
	};
	{
		player linkItem _x;
	} forEach (_loadout select 1);

	// copy primary info over
	_primary = [];
	{
		_primary pushBack _x;
	} forEach (_loadout select 5);

	// load primary plus attachments
	if (_primary select 0 != "") then {
		{
			player addItem _x;
		} forEach (_primary deleteAt 1);
		player addWeapon (_primary deleteAt 0);
		{
			player addPrimaryWeaponItem _x;
		} forEach _primary;
	} else {
		player removeWeapon (primaryWeapon player);
	};

	// copy secondary info over
	_secondary = [];
	{
		_secondary pushBack _x;
	} forEach (_loadout select 6);

	// load secondary plus attachments
	if (_secondary select 0 != "") then {
		{
			player addItem _x;
		} forEach (_secondary deleteAt 1);
		player addWeapon (_secondary deleteAt 0);
		{
			player addSecondaryWeaponItem _x;
		} forEach _secondary;
	} else {
		player removeWeapon (secondaryWeapon player);
	};

	// copy handgun info over
	_handgun = [];
	{
		_handgun pushBack _x;
	} forEach (_loadout select 7);

	// load handgun plus attachments
	if (_handgun select 0 != "") then {
		{
			player addItem _x;
		} forEach (_handgun deleteAt 1);
		player addWeapon (_handgun deleteAt 0);
		{
			player addHandgunItem _x;
		} forEach _handgun;
	} else {
		player removeWeapon (handgunWeapon player);
	};

	// load uniform contents
	{
		player addItemToUniform _x;
	} forEach (_loadout select 2);

	// load vest contents
	{
		player addItemToVest _x;
	} forEach (_loadout select 3);

	// load backpack contents
	{
		player addItemToBackpack _x;
	} forEach (_loadout select 4);
};

fn_gearLoadout = {
	_loadout = _this;

	switch (_loadout) do {
		case "ENGINEER": {
			["LOADOUT ENGINEER"] call fn_loadoutLoad;

			player setVariable ["Ace_medical_medicClass", 0, true];
			player setVariable ["ACE_IsEngineer", 1, true];
			player setVariable ["ACE_isEOD", 1, true];
		};
		case "MEDIC": {
			["LOADOUT MEDIC"] call fn_loadoutLoad;

			player setVariable ["Ace_medical_medicClass", 1, true];
			player setVariable ["Ace_IsEngineer", 0, true];
			player setVariable ["ACE_isEOD", 0, true];
		};
		case "TEAMLEADER": {
			["LOADOUT TEAMLEADER"] call fn_loadoutLoad;

			_isLeaderMasterAllSpecialist = missionNamespace getVariable ["LeaderMasterAllSpecialist", false];
			if (_isLeaderMasterAllSpecialist) then {
				player setVariable ["Ace_medical_medicClass", 1, true];
				player setVariable ["Ace_IsEngineer", 1, true];
				player setVariable ["ACE_isEOD", 1, true];
			} else {
				player setVariable ["Ace_medical_medicClass", 0, true];
				player setVariable ["Ace_IsEngineer", 0, true];
				player setVariable ["ACE_isEOD", 0, true];
			};
		};
		default {
			["LOADOUT " + _loadout] call fn_loadoutLoad;

			player setVariable ["Ace_medical_medicClass", 0, true];
			player setVariable ["Ace_IsEngineer", 0, true];
			player setVariable ["ACE_isEOD", 0, true];
		};
	};

	// Save default loadout to playerGear if it's empty
	_loadout = missionNameSpace getVariable "playerGear";
	if (_loadout isEqualTo []) exitWith {
		[] call fn_gearSave;
	};
};

fn_gearSave = {
	_items = [];
	_linkedItems = [];

	_uniform = [];
	_vest = [];
	_backpack = [];

	_primary = [];
	_secondary = [];
	_handgun = [];

	// save loose items
	_items pushBack (uniform player);
	_items pushBack (vest player);
	_items pushBack (backpack player);
	_items pushBack (headgear player);
	_items pushBack (goggles player);
	_items pushBack (hmd player);
	_items pushBack (binocular player);

	// save linked items
	_linkedItems = (assignedItems player);

	// save uniform contents
	{
		_uniform pushBack _x;
	} forEach (uniformItems player);

	// save vest contents
	{
		_vest pushBack _x;
	} forEach (vestItems player);

	// save backpack contents
	{
		_backpack pushBack _x;
	} forEach (backpackItems player);

	// save primary plus attachments
	_primary pushBack (primaryWeapon player);
	_primary pushBack (primaryWeaponMagazine player);
	{
		_primary pushBack _x;
	} forEach (primaryWeaponItems player);

	// save secondary plus attachments
	_secondary pushBack (secondaryWeapon player);
	_secondary pushBack (secondaryWeaponMagazine player);
	{
		_secondary pushBack _x;
	} forEach (secondaryWeaponItems player);

	// save pistol plus attachments
	_handgun pushBack (handgunWeapon player);
	_handgun pushBack (handgunMagazine player);
	{
		_handgun pushBack _x;
	} forEach (handgunItems player);

	// save loadout
	_loadout = [_items, _linkedItems, _uniform, _vest, _backpack, _primary, _secondary, _handgun];
	missionNameSpace setVariable ["playerGear", _loadout, false];
};

fn_loadoutSave = {
	_unit = _this select 0;
	_loadoutName = _this select 1;

	_items = [];
	_linkedItems = [];

	_uniform = [];
	_vest = [];
	_backpack = [];

	_primary = [];
	_secondary = [];
	_handgun = [];

	// save loose items
	_items pushBack (uniform _unit);
	_items pushBack (vest _unit);
	_items pushBack (backpack _unit);
	_items pushBack (headgear _unit);
	_items pushBack (goggles _unit);
	_items pushBack (hmd _unit);
	_items pushBack (binocular _unit);

	// save linked items
	_linkedItems = (assignedItems _unit);

	// save uniform contents
	{
		_uniform pushBack _x;
	} forEach (uniformItems _unit);

	// save vest contents
	{
		_vest pushBack _x;
	} forEach (vestItems _unit);

	// save backpack contents
	{
		_backpack pushBack _x;
	} forEach (backpackItems _unit);

	// save primary plus attachments
	_primary pushBack (primaryWeapon _unit);
	_primary pushBack (primaryWeaponMagazine _unit);
	{
		_primary pushBack _x;
	} forEach (primaryWeaponItems _unit);

	// save secondary plus attachments
	_secondary pushBack (secondaryWeapon _unit);
	_secondary pushBack (secondaryWeaponMagazine _unit);
	{
		_secondary pushBack _x;
	} forEach (secondaryWeaponItems _unit);

	// save pistol plus attachments
	_handgun pushBack (handgunWeapon _unit);
	_handgun pushBack (handgunMagazine _unit);
	{
		_handgun pushBack _x;
	} forEach (handgunItems _unit);

	// save loadout
	_loadout = [_items, _linkedItems, _uniform, _vest, _backpack, _primary, _secondary, _handgun];
	missionNamespace setVariable [_loadoutName, _loadout, true];

	if ((missionNameSpace getVariable ["LoadoutNameList", []] isEqualTo [])) then {
		_loadoutNameList = [_loadoutName];
		missionNameSpace setVariable ["LoadoutNameList", _loadoutNameList, true];
	} else {
		_loadoutNameList = missionNameSpace getVariable "LoadoutNameList";
		_loadoutNameList pushBack _loadoutName;
		missionNameSpace setVariable ["LoadoutNameList", _loadoutNameList, true];
	};
};

fn_setLoadoutByRole = {
	// get player role and save default loadout
	// Role example: Team leader@CO so we need to split it
	_role = (roleDescription player) splitString "@";
	_role = _role select 0;

	// Upercase role
	_role = toUpper _role;

	// Check if role name is more than 1 word, concat all words
	_role = _role splitString " ";
	if (count _role > 1) then {
		_tempRole = "";
		{
			// Current result is saved in variable _x
			_tempRole = _tempRole + _x;
		} forEach _role;
		_role = _tempRole;
	} else {
		_role = _role select 0;
	};

	// get loadout name list
	_loadoutNameList = missionNameSpace getVariable "LoadoutNameList";

	{
		// Current result is saved in variable _x
		_loadoutName = _x;
		_trueLoadoutName = _loadoutName;

		// Split loadout name
		// Loadout name example: LOADOUT AT RIFLEMAN so we need to split it
		_loadoutName = _loadoutName splitString " ";

		// Check if loadout name is more than 2 words, concat from 2nd word
		if (count _loadoutName > 2) then {
			_tempName = "";
			{
				// Current result is saved in variable _x
				if (_x != "LOADOUT") then {
					_tempName = _tempName + _x;
				};
			} forEach _loadoutName;
			_loadoutName = _tempName;
		} else {
			_loadoutName = _loadoutName select 1;
		};

		if (_role == _loadoutName) then {
			_loadout = missionNamespace getVariable _trueLoadoutName;
			missionNameSpace setVariable ["playerGear", _loadout, false];
		};
	} forEach _loadoutNameList;
};

fn_loadoutLoad = {
	_loadoutName = _this select 0;

	_loadout = missionNamespace getVariable _loadoutName;

	if (isNil "_loadout") exitWith {
		systemChat "Loadout not found";
	};
	if (_loadout isEqualTo []) exitWith {};

	// remove current container contents
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;
	removeBackpack player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeAllWeapons player;

	// Give all items if they dont have it already
	if (_loadout select 0 select 0 == "") then {
		removeUniform player;
	} else {
		player forceAddUniform (_loadout select 0 select 0);
	};
	if (_loadout select 0 select 1 == "") then {
		removeVest player;
	} else {
		player addVest (_loadout select 0 select 1);
	};
	if (_loadout select 0 select 2 != (backpack player)) then {
		if (_loadout select 0 select 2 == "") then {
			removeBackpack player;
		} else {
			player addBackpack (_loadout select 0 select 2);
		};
	};
	if (_loadout select 0 select 3 == "") then {
		removeHeadgear player;
	} else {
		player addHeadgear (_loadout select 0 select 3);
	};
	if (_loadout select 0 select 4 == "") then {
		removeGoggles player;
	} else {
		player addGoggles (_loadout select 0 select 4);
	};
	if (_loadout select 0 select 5 == "") then {
		player unlinkItem (hmd player);
	} else {
		player linkItem (_loadout select 0 select 5);
	};
	if (_loadout select 0 select 6 == "") then {
		player removeWeapon (binocular player);
	} else {
		player addWeapon (_loadout select 0 select 6);
	};
	{
		player linkItem _x;
	} forEach (_loadout select 1);

	// copy primary info over
	_primary = [];
	{
		_primary pushBack _x;
	} forEach (_loadout select 5);

	// load primary plus attachments
	if (_primary select 0 != "") then {
		{
			player addItem _x;
		} forEach (_primary deleteAt 1);
		player addWeapon (_primary deleteAt 0);
		{
			player addPrimaryWeaponItem _x;
		} forEach _primary;
	} else {
		player removeWeapon (primaryWeapon player);
	};

	// copy secondary info over
	_secondary = [];
	{
		_secondary pushBack _x;
	} forEach (_loadout select 6);

	// load secondary plus attachments
	if (_secondary select 0 != "") then {
		{
			player addItem _x;
		} forEach (_secondary deleteAt 1);
		player addWeapon (_secondary deleteAt 0);
		{
			player addSecondaryWeaponItem _x;
		} forEach _secondary;
	} else {
		player removeWeapon (secondaryWeapon player);
	};

	// copy handgun info over
	_handgun = [];
	{
		_handgun pushBack _x;
	} forEach (_loadout select 7);

	// load handgun plus attachments
	if (_handgun select 0 != "") then {
		{
			player addItem _x;
		} forEach (_handgun deleteAt 1);
		player addWeapon (_handgun deleteAt 0);
		{
			player addHandgunItem _x;
		} forEach _handgun;
	} else {
		player removeWeapon (handgunWeapon player);
	};

	// load uniform contents
	{
		player addItemToUniform _x;
	} forEach (_loadout select 2);

	// load vest contents
	{
		player addItemToVest _x;
	} forEach (_loadout select 3);

	// load backpack contents
	{
		player addItemToBackpack _x;
	} forEach (_loadout select 4);
};

fn_gearStart = {
	if ((missionNamespace getVariable "playerGear") isEqualTo []) then {
		removeAllWeapons player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeAllAssignedItems player;
		removeGoggles player;

		// give basic gear
		["gearUniformBasic"] call fn_uniform_set;
		["gearVestBasic"] call fn_vest_set;
		["gearHeadgearBasic"] call fn_headgear_set;
		["gearBackpackBasic"] call fn_backpack_set;

		player linkItem "ItemMap";
		player linkItem "itemGPS";
		player linkItem (missionNameSpace getVariable "gearRadio");
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player addWeapon "Binocular";
		if (missionNameSpace getVariable "gearGiveNightvision") then {
			player linkItem (missionNameSpace getVariable "gearNightvision");
		};
	} else {
		_loadout = missionNamespace getVariable "playerGear";
		_loadout call fn_gearLoad;
	};
};

fn_headgear_set = {
	_headgearVar = _this select 0;

	// remove headgear
	removeHeadgear player;

	// set headgear
	player addHeadgear (missionNamespace getVariable _headgearVar);
};

fn_uniform_set = {
	_uniformVar = _this select 0;

	// remove uniform
	removeUniform player;

	// set uniform
	player forceAddUniform (missionNamespace getVariable _uniformVar);
	player addItemToUniform "ACE_bodyBag";
	player addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 5 do {
		player addItemToUniform "ACE_morphine";
		player addItemToUniform "ACE_epinephrine";
		player addItemToUniform "ACE_splint";
	};
	for "_i" from 1 to 2 do {
		player addItemToUniform "ACE_tourniquet";
	};
	for "_i" from 1 to 30 do {
		player addItemToUniform "ACE_fieldDressing"
	};
};

fn_vest_set = {
	_vestVar = _this select 0;

	// remove vest
	removeVest player;

	// set vest
	player addVest (missionNamespace getVariable _vestVar);
};

fn_backpack_set = {
	_backpackVar = _this select 0;

	// remove backpack
	removeBackpack player;

	// set backpack
	player addBackpack (missionNamespace getVariable _backpackVar);
};

//// ////////////////////////////////////////////
//               FUNCTION LOOP               // 
//// ////////////////////////////////////////////

if (side player == sideLogic) exitWith {
	true
};

_request = (_this select 0);

switch (_request) do {
	// gear start
	case 0: {
		[] call fn_gearStart;
	};

	// gear loadout
	case 1: {
		_loadout = (_this select 1);
		_loadout call fn_gearLoadout;
	};

	// save gear
	case 2: {
		[] call fn_gearSave;
	};

	// rearm from save
	case 3: {
		[] call fn_gearLoad;
	};

	// check unallowed gear
	case 4: {
		[] call fn_gearSnitch;
	};

	// save loadout
	case 5: {
		_unit = (_this select 1);
		_loadoutName = (_this select 2);
		[_unit, _loadoutName] call fn_loadoutSave;
	};

	case 6: {
		[] call fn_setLoadoutByRole;
	};
};"""]
# --------------------------------------------------------------------------------------------

# fn_holdActionAdd.sqf file
fn_holdActionAdd_sqf = ["functions\\fn_holdActionAdd.sqf", r"""/*
	@file_name: fn_holdActionAdd.sqf
	@file_author: Jiri Wainar, modified by Dyzalonius

	Description:
	Add a hold action. If the hold actions are not initialized yet, initialize the system first.

	Parameters:
	0: OBJECT - object action is attached to
	1: CODE - code that produces action title text shown in action menu
	2: STRING or CODE - idle icon shown on screen; if CODE is used the code needs to return the path to icon
	3: STRING or CODE - progress icon shown on screen; if CODE is used the code needs to return the path to icon
	4: STRING - condition for the action to be shown; special variables passed to the script code are _target (unit to which action is attached to) and _this (caller/executing unit)
	5: STRING - condition for action to progress; if false is returned action progress is halted; arguments passed into it are: _target, _caller, _id, _arguments
	6: CODE - code executed on start; arguments passed into it are [target, caller, ID, arguments]
		0: OBJECT - target (_this select 0) - the object which the action is assigned to
		1: OBJECT - caller (_this select 1) - the unit that activated the action
		2: NUMBER - ID (_this select 2) - ID of the activated action (same as ID returned by addAction)
		3: ARRAY - arguments (_this select 3) - arguments given to the script if you are using the extended syntax
	7: CODE - code executed on every progress tick; arguments [target, caller, ID, arguments, currentProgress]; max progress is always 24
	8: CODE - code executed on completion; arguments [target, caller, ID, arguments]
	9: CODE - code executed on interrupted; arguments [target, caller, ID, arguments]
	10: ARRAY - arguments passed to the scripts
	11: NUMBER - action duration; how much time it takes to complete the action
	12: NUMBER - priority; actions are arranged in descending order according to this value
	13: BOOL - remove on completion (default: true)
	14: BOOL - show in unconscious state (default: false)
	15: BOOL - show on screen; if false action needs to be selected from action menu to appear on screen (default: true)

	Example:
	[_target,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority,_removeCompleted,_showUnconscious] call bis_fnc_holdActionAdd;

	Returns:
	Action ID, can be used for removal or referencing from other functions.
*/
#define FRAME_MAX_PROGRESS				24
#define FRAME_MAX_IDLE					11
#define FRAME_MAX_IN					3

#define ACTION_HIDE_ON_USE				false
#define ACTION_SHORTCUT					""
#define ACTION_DISTANCE					15

#define TEXTURE_TEMPLATE_ICON_IDLE(icon)		(format["<img size='3' color='#ffffff' image='%1'/>",icon])
#define TEXTURE_TEMPLATE_ICON_PROGRESS(icon)		(format["<img size='3' color='#ffffff' image='%1'/>",icon])

#define TEXTURE_TEMPLATE_PROGRESS(frame)		(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\progress\progress_%1_ca.paa'/>",frame])	//frame 0-24
#define TEXTURE_TEMPLATE_IN(frame)			(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_%1_ca.paa'/>",frame])	//frame 0-3
#define TEXTURE_TEMPLATE_IDLE_PULSE(frame,color)	(format["<img size='3' shadow='0' color='%2' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_0_ca.paa'/>",frame,color])	//frame 0-3
#define TEXTURE_TEMPLATE_IDLE_ROTATION(frame)		(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\idle\idle_%1_ca.paa'/>",frame])	//frame 0-11

#define TEXTURES_PROGRESS				bis_fnc_holdAction_texturesProgress
#define TEXTURES_IDLE					bis_fnc_holdAction_texturesIdle
#define TEXTURES_IN					bis_fnc_holdAction_texturesIn

params
[
	["_target",objNull,[objNull]],
	["_titleCode",{},[{}]],
	["_iconIdle","\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa",["",{}]],
	["_iconProgress","\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa",["",{}]],
	["_condShow","true",[""]],
	["_condProgress","true",[""]],
	["_codeStart",{},[{}]],
	["_codeProgress",{},[{}]],
	["_codeCompleted",{},[{}]],
	["_codeInterrupted",{},[{}]],
	["_arguments",[],[[]]],
	["_duration",10,[123]],
	["_priority",1000,[123]],
	["_removeCompleted",true,[true]],
	["_showUnconscious",false,[true]],
	["_showWindow",true,[true]]
];

/*
["[ ] _target: %1",_target] call bis_fnc_logFormat;
["[ ] _titleCode: %1",_titleCode] call bis_fnc_logFormat;
["[ ] _iconIdle: %1",_iconIdle] call bis_fnc_logFormat;
["[ ] _iconProgress: %1",_iconProgress] call bis_fnc_logFormat;
["[ ] _condShow: %1",_condShow] call bis_fnc_logFormat;
["[ ] _condProgress: %1",_condProgress] call bis_fnc_logFormat;
["[ ] _codeStart: %1",_codeStart] call bis_fnc_logFormat;
["[ ] _codeProgress: %1",_codeProgress] call bis_fnc_logFormat;
["[ ] _codeCompleted: %1",_codeCompleted] call bis_fnc_logFormat;
["[ ] _codeInterrupted: %1",_codeInterrupted] call bis_fnc_logFormat;
["[ ] _arguments: %1",_arguments] call bis_fnc_logFormat;
["[ ] _duration: %1",_duration] call bis_fnc_logFormat;
["[ ] _priority: %1",_priority] call bis_fnc_logFormat;
["[ ] _removeCompleted: %1",_removeCompleted] call bis_fnc_logFormat;
["[ ] _showUnconscious: %1",_showUnconscious] call bis_fnc_logFormat;
*/

//convert to structured text
if (_iconIdle isEqualType "") then
{
	_iconIdle = TEXTURE_TEMPLATE_ICON_IDLE(_iconIdle);
};
if (_iconProgress isEqualType "") then
{
	_iconProgress = TEXTURE_TEMPLATE_ICON_PROGRESS(_iconProgress);
};

//prepare progress textures
if (isNil {TEXTURES_PROGRESS}) then
{
	TEXTURES_PROGRESS = [];
	for "_i" from 0 to FRAME_MAX_PROGRESS do
	{
		TEXTURES_PROGRESS pushBack TEXTURE_TEMPLATE_PROGRESS(_i);
	};
};

//prepare idle textures
if (isNil {TEXTURES_IDLE}) then
{
	TEXTURES_IDLE = [];

	private _alpha = 0;
	private _color = "";

	for "_i" from 0 to FRAME_MAX_IDLE do
	{
		_alpha = (sin((_i/FRAME_MAX_IDLE) * 360) * 0.25) + 0.75;
		_color = [1,1,1,_alpha] call bis_fnc_colorRGBAtoHTML;

		TEXTURES_IDLE pushBack TEXTURE_TEMPLATE_IDLE_PULSE(_i,_color);
	};
};

//prepare in textures
if (isNil {TEXTURES_IN}) then
{
	TEXTURES_IN = [];
	for "_i" from 0 to FRAME_MAX_IN do
	{
		TEXTURES_IN pushBack TEXTURE_TEMPLATE_IN(_i);
	};
};

//preprocess data
private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];
//STR_A3_HoldKeyTo: Hold %1 to %2
private _keyNameColored = format["<t color='#ffae00'>%1</t>",_keyName];
private _title = _target call _titleCode;
private _hint = format[localize "STR_A3_HoldKeyTo",_keyNameColored,_title];
_hint = format["<t font='RobotoCondensedBold'>%1</t>",_hint];
_title = format["<t color='#FFFFFF' align='left'>%1</t>        <t color='#83ffffff' align='right'>%2     </t>",_title,_keyName];

if (isNil "bis_fnc_holdAction_running") then {bis_fnc_holdAction_running = false;};
if (isNil "bis_fnc_holdAction_animationIdleFrame") then {bis_fnc_holdAction_animationIdleFrame = 0;};

//resize arguments array to max 10 items
_arguments resize 10;
_arguments = _arguments + [_target,_titleCode,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_duration,_removeCompleted];

//[_target,_actionID,_titleCode,_icon,_textures,_frame,_showHint,_keyName] call bis_fnc_holdAction_showIcon;
OFT_fnc_holdAction_showIcon =
{
	params
	[
		["_target",objNull,[objNull]],
		["_actionID",0,[123]],
		["_titleCode",{},[{}]],
		["_icon","",["",{}]],
		["_texSet",TEXTURES_PROGRESS,[[]]],
		["_frame",0,[123]],
		["_showHint",false,[false]],
		["_keyName", "",[""]]
	];

	if (_icon isEqualType {}) then {
		_icon = _target call _icon;
	};

	_title = format["<t color='#FFFFFF' align='left'>%1</t>        <t color='#83ffffff' align='right'>%2     </t>",_target call _titleCode,_keyName];
	_hint = "";
	if (_showHint) then {
		private _hint = format[localize "STR_A3_HoldKeyTo",format["<t color='#ffae00'>%1</t>",_keyName],_target call _titleCode];
	};
	_target setUserActionText [_actionID,_title,_texSet select _frame,_icon + "<br/><br/>" + _hint];
};

OFT_fnc_holdAction_animationTimerCode =
{
	if (time > (missionNamespace getVariable ["bis_fnc_holdAction_animationIdleTime",-1]) && {_eval}) then
	{
		bis_fnc_holdAction_animationIdleTime = time + 0.065;
		bis_fnc_holdAction_animationIdleFrame = (bis_fnc_holdAction_animationIdleFrame + 1) % 12;

		//play idle animation only when action is not in progress
		if (!bis_fnc_holdAction_running) then
		{
			params["_titleCode","_iconIdle","_hint"];
			private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
			private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];

			//idle animations always have 12 frames
			[_originalTarget,_actionID,_titleCode,_iconIdle,TEXTURES_IDLE,bis_fnc_holdAction_animationIdleFrame,true,_keyName] call OFT_fnc_holdAction_showIcon;
		};
	};
};

private _codeInit =
{
	bis_fnc_holdAction_running = true;

	//check if another hold action is running, if so terminate the new hold action execution
	if (!isNil "OFT_fnc_holdAction_scriptHandle" && {!scriptDone OFT_fnc_holdAction_scriptHandle}) exitWith {};

	bis_fnc_holdAction_params = _this;
	OFT_fnc_holdAction_scriptHandle = _this spawn
	{
		//unwrap arguments supplied by addAction command
		params
		[
			["_target",objNull,[objNull]],
			["_caller",objNull,[objNull]],
			["_actionID",10,[123]],
			["_arguments",[],[[]]]
		];

		private _this = _caller;	//needed for conditions, there _caller is refferenced as _this for some legacy reason ;(
		private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
		private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];

		//disable player's action menu
		{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction"];

		//unwrap 'arguments' argument :)
		_arguments params["_a0","_a1","_a2","_a3","_a4","_a5","_a6","_a7","_a8","_a9","_target","_titleCode","_iconIdle","_iconProgress","_condShow","_condProgress","_codeStart","_codeProgress","_codeCompleted","_codeInterrupted","_duration","_removeCompleted"];

		//retype conditions from string to code
		private _condProgressCode = compile _condProgress;

		//play transition-in animation
		for "_i" from 0 to FRAME_MAX_IN do
		{
			sleep 0.05;

			//update icon
			[_target,_actionID,_titleCode,_iconIdle,TEXTURES_IN,_i,false,_keyName] call OFT_fnc_holdAction_showIcon;
		};

		//execute supplied 'on start' action code
		[_target,_caller,_actionID,_arguments] call _codeStart;

		//progress init
		private _frame = 0;
		private _timeStart = time;
		private _timeNextStep = time;
		private _stepDuration = _duration / FRAME_MAX_PROGRESS;

		//handle progress
		while {call _condProgressCode && {_frame < FRAME_MAX_PROGRESS}} do
		{
			_timeNextStep = _timeStart + (_frame * _stepDuration);

			waitUntil
			{
				time >= _timeNextStep || {(inputAction "Action" < 0.5 && {inputAction "ActionContext" < 0.5}) || {visibleMap || {!(call _condProgressCode)}}}
			};

			//exit if progression failed - key was released or condition was not fulfiled
			if (time < _timeNextStep) exitWith
			{
				/*
				["[x] inputAction 'Action' : %1",inputAction "Action"] call bis_fnc_logFormat;
				["[x] inputAction 'ActionContext' : %1",inputAction "ActionContext"] call bis_fnc_logFormat;
				["[x] !(call _condProgressCode) : %1",!(call _condProgressCode)] call bis_fnc_logFormat;
				["[x] visibleMap : %1",visibleMap] call bis_fnc_logFormat;
				*/
			};

			//increment progress
			_frame = _frame + 1;

			//update icon
			[_target,_actionID,_titleCode,_iconProgress,TEXTURES_PROGRESS,_frame,false,_keyName] call OFT_fnc_holdAction_showIcon;

			//execute supplied 'on progress' action code
			[_target,_caller,_actionID,_arguments,_frame,FRAME_MAX_PROGRESS] call _codeProgress;
		};

		//execute supplied 'completed' action code
		if (_frame == FRAME_MAX_PROGRESS) then
		{
			sleep _stepDuration;

			if (_removeCompleted) then
			{
				_target removeAction _actionID;
			};

			[_target,_caller,_actionID,_arguments] call _codeCompleted;
		}
		else
		{
			[_target,_caller,_actionID,_arguments] call _codeInterrupted;
		};

		//reset the progress texture
		[_target,_actionID,_titleCode,_iconIdle,TEXTURES_PROGRESS,0,false,_keyName] call OFT_fnc_holdAction_showIcon;

		//enable player's action menu
		{inGameUISetEventHandler [_x, ""]} forEach ["PrevAction", "NextAction"];

		//reset 'running' flag
		bis_fnc_holdAction_running = false;
	};
};

//inject custom code to _condStart to allow for the idle animation
if (_iconIdle isEqualType "") then
{
	_condShow = format["_target = _originalTarget; _eval = %1; [%2,""%3"",""%4""] call OFT_fnc_holdAction_animationTimerCode; _eval",_condShow,_titleCode,_iconIdle,_hint];
}
else
{
	_condShow = format["_target = _originalTarget; _eval = %1; [%2,%3,""%4""] call OFT_fnc_holdAction_animationTimerCode; _eval",_condShow,_titleCode,_iconIdle,_hint];
};

//add the action
private _actionID = _target addAction [_title, _codeInit, _arguments, _priority, _showWindow, ACTION_HIDE_ON_USE, ACTION_SHORTCUT, _condShow, ACTION_DISTANCE, _showUnconscious, ""];

[_target, _actionID, _arguments] spawn {
	params
	[
		["_target",objNull,[objNull]],
		["_actionID",10,[123]],
		["_arguments",[],[[]]]
	];
	_arguments params["_a0","_a1","_a2","_a3","_a4","_a5","_a6","_a7","_a8","_a9","_target","_titleCode","_iconIdle","_iconProgress","_condShow","_condProgress","_codeStart","_codeProgress","_codeCompleted","_codeInterrupted","_duration","_removeCompleted"];
	private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
	private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];

	while {alive _target} do {
		waitUntil { _var = _target getVariable "updateAllHoldActions"; (!isNil "_var") && {_target getVariable "updateAllHoldActions"} };
		[_target,_actionID,_titleCode,_iconIdle,TEXTURES_PROGRESS,0,false,_keyName] call OFT_fnc_holdAction_showIcon;
		sleep 0.1;
		_target setVariable ["updateAllHoldActions", false, true];
	};
};

//set the initial state to frame 0
[_target,_actionID,_titleCode,_iconIdle,TEXTURES_IDLE,0,false,_keyName] call OFT_fnc_holdAction_showIcon;

_actionID
"""]
# --------------------------------------------------------------------------------------------

# fn_holdActionAddFortification.sqf file
fn_holdActionAddFortification_sqf = ["functions\\fn_holdActionAddFortification.sqf", r"""/*
	@file_name: fn_holdActionAddFortification.sqf
	@file_author: Dyzalonius, based on fn_holdActionAdd from Jiri Wainar

	Description:
	Add a hold action. If the hold actions are not initialized yet, initialize the system first.

	Parameters:
	0: OBJECT - object action is attached to
	1: CODE - code that produces action title text shown in action menu
	2: STRING or CODE - idle icon shown on screen; if CODE is used the code needs to return the path to icon
	3: STRING or CODE - progress icon shown on screen; if CODE is used the code needs to return the path to icon
	4: STRING - condition for the action to be shown; special variables passed to the script code are _target (unit to which action is attached to) and _this (caller/executing unit)
	5: STRING - condition for action to progress; if false is returned action progress is halted; arguments passed into it are: _target, _caller, _id, _arguments
	6: CODE - code executed on start; arguments passed into it are [target, caller, ID, arguments]
		0: OBJECT - target (_this select 0) - the object which the action is assigned to
		1: OBJECT - caller (_this select 1) - the unit that activated the action
		2: NUMBER - ID (_this select 2) - ID of the activated action (same as ID returned by addAction)
		3: ARRAY - arguments (_this select 3) - arguments given to the script if you are using the extended syntax
	7: CODE - code executed on every progress tick; arguments [target, caller, ID, arguments, currentProgress]; max progress is always 24
	8: CODE - code executed on completion; arguments [target, caller, ID, arguments]
	9: CODE - code executed on interrupted; arguments [target, caller, ID, arguments]
	10: ARRAY - arguments passed to the scripts
	11: NUMBER - action duration; how much time it takes to complete the action
	12: NUMBER - priority; actions are arranged in descending order according to this value
	13: BOOL - remove on completion (default: true)
	14: BOOL - show in unconscious state (default: false)
	15: BOOL - show on screen; if false action needs to be selected from action menu to appear on screen (default: true)

	Example:
	[_target,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority,_removeCompleted,_showUnconscious] call bis_fnc_holdActionAdd;

	Returns:
	Action ID, can be used for removal or referencing from other functions.
*/
#define FRAME_MAX_PROGRESS				24
#define FRAME_MAX_IDLE					11
#define FRAME_MAX_IN					3

#define ACTION_HIDE_ON_USE				false
#define ACTION_SHORTCUT					""
#define ACTION_DISTANCE					15

#define TEXTURE_TEMPLATE_ICON_IDLE(icon)		(format["<img size='3' color='#ffffff' image='%1'/>",icon])
#define TEXTURE_TEMPLATE_ICON_PROGRESS(icon)		(format["<img size='3' color='#ffffff' image='%1'/>",icon])

#define TEXTURE_TEMPLATE_PROGRESS(frame)		(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\progress\progress_%1_ca.paa'/>",frame])	//frame 0-24
#define TEXTURE_TEMPLATE_IN(frame)			(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_%1_ca.paa'/>",frame])	//frame 0-3
#define TEXTURE_TEMPLATE_IDLE_PULSE(frame,color)	(format["<img size='3' shadow='0' color='%2' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\in\in_0_ca.paa'/>",frame,color])	//frame 0-3
#define TEXTURE_TEMPLATE_IDLE_ROTATION(frame)		(format["<img size='3' shadow='0' color='#ffffffff' image='\A3\Ui_f\data\IGUI\Cfg\HoldActions\idle\idle_%1_ca.paa'/>",frame])	//frame 0-11

#define TEXTURES_PROGRESS				bis_fnc_holdAction_texturesProgress
#define TEXTURES_IDLE					bis_fnc_holdAction_texturesIdle
#define TEXTURES_IN					bis_fnc_holdAction_texturesIn

params
[
	["_target",objNull,[objNull]],
	["_titleCode",{},[{}]],
	["_iconIdle","\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa",["",{}]],
	["_iconProgress","\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa",["",{}]],
	["_condShow","true",[""]],
	["_condProgress","true",[""]],
	["_codeStart",{},[{}]],
	["_codeProgress",{},[{}]],
	["_codeCompleted",{},[{}]],
	["_codeInterrupted",{},[{}]],
	["_arguments",[],[[]]],
	["_duration",10,[123]],
	["_priority",1000,[123]],
	["_removeCompleted",true,[true]],
	["_showUnconscious",false,[true]],
	["_showWindow",true,[true]]
];

/*
["[ ] _target: %1",_target] call bis_fnc_logFormat;
["[ ] _titleCode: %1",_titleCode] call bis_fnc_logFormat;
["[ ] _iconIdle: %1",_iconIdle] call bis_fnc_logFormat;
["[ ] _iconProgress: %1",_iconProgress] call bis_fnc_logFormat;
["[ ] _condShow: %1",_condShow] call bis_fnc_logFormat;
["[ ] _condProgress: %1",_condProgress] call bis_fnc_logFormat;
["[ ] _codeStart: %1",_codeStart] call bis_fnc_logFormat;
["[ ] _codeProgress: %1",_codeProgress] call bis_fnc_logFormat;
["[ ] _codeCompleted: %1",_codeCompleted] call bis_fnc_logFormat;
["[ ] _codeInterrupted: %1",_codeInterrupted] call bis_fnc_logFormat;
["[ ] _arguments: %1",_arguments] call bis_fnc_logFormat;
["[ ] _duration: %1",_duration] call bis_fnc_logFormat;
["[ ] _priority: %1",_priority] call bis_fnc_logFormat;
["[ ] _removeCompleted: %1",_removeCompleted] call bis_fnc_logFormat;
["[ ] _showUnconscious: %1",_showUnconscious] call bis_fnc_logFormat;
*/

//convert to structured text
if (_iconIdle isEqualType "") then
{
	_iconIdle = TEXTURE_TEMPLATE_ICON_IDLE(_iconIdle);
};
if (_iconProgress isEqualType "") then
{
	_iconProgress = TEXTURE_TEMPLATE_ICON_PROGRESS(_iconProgress);
};

//prepare progress textures
if (isNil {TEXTURES_PROGRESS}) then
{
	TEXTURES_PROGRESS = [];
	for "_i" from 0 to FRAME_MAX_PROGRESS do
	{
		TEXTURES_PROGRESS pushBack TEXTURE_TEMPLATE_PROGRESS(_i);
	};
};

//prepare idle textures
if (isNil {TEXTURES_IDLE}) then
{
	TEXTURES_IDLE = [];

	private _alpha = 0;
	private _color = "";

	for "_i" from 0 to FRAME_MAX_IDLE do
	{
		_alpha = (sin((_i/FRAME_MAX_IDLE) * 360) * 0.25) + 0.75;
		_color = [1,1,1,_alpha] call bis_fnc_colorRGBAtoHTML;

		TEXTURES_IDLE pushBack TEXTURE_TEMPLATE_IDLE_PULSE(_i,_color);
	};
};

//prepare in textures
if (isNil {TEXTURES_IN}) then
{
	TEXTURES_IN = [];
	for "_i" from 0 to FRAME_MAX_IN do
	{
		TEXTURES_IN pushBack TEXTURE_TEMPLATE_IN(_i);
	};
};

//preprocess data
private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];
//STR_A3_HoldKeyTo: Hold %1 to %2
private _keyNameColored = format["<t color='#ffae00'>%1</t>",_keyName];
_fortificationArguments = [_arguments select 0, _arguments select 1, _arguments select 2, _arguments select 3, _arguments select 4];
private _title = [_target, _fortificationArguments] call _titleCode;
private _hint = format[localize "STR_A3_HoldKeyTo",_keyNameColored,_title];
_hint = format["<t font='RobotoCondensedBold'>%1</t>",_hint];
_title = format["<t color='#FFFFFF' align='left'>%1</t>        <t color='#83ffffff' align='right'>%2     </t>",_title,_keyName];

if (isNil "bis_fnc_holdAction_running") then {bis_fnc_holdAction_running = false;};
if (isNil "bis_fnc_holdAction_animationIdleFrame") then {bis_fnc_holdAction_animationIdleFrame = 0;};

//resize arguments array to max 10 items
_arguments resize 10;
_arguments = _arguments + [_target,_titleCode,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_duration,_removeCompleted];

//[_target,_actionID,_titleCode,_icon,_textures,_frame,_showHint,_keyName] call bis_fnc_holdAction_showIcon;
OFT_fnc_holdAction_showIconF =
{
	params
	[
		["_target",objNull,[objNull]],
		["_actionID",0,[123]],
		["_titleCode",{},[{}]],
		["_icon","",["",{}]],
		["_texSet",TEXTURES_PROGRESS,[[]]],
		["_frame",0,[123]],
		["_showHint",false,[false]],
		["_keyName", "",[""]],
		["_fortificationArguments", [], [[]]]
	];

	if (_icon isEqualType {}) then {
		_icon = _target call _icon;
	};

	if (count _fortificationArguments == 0) then {
		_fortificationArguments = ["", "", 0, 0, 0];
	};

	_title = format["<t color='#FFFFFF' align='left'>%1</t>        <t color='#83ffffff' align='right'>%2     </t>",[_target, _fortificationArguments] call _titleCode,_keyName];
	_hint = "";
	if (_showHint) then {
		private _hint = format[localize "STR_A3_HoldKeyTo",format["<t color='#ffae00'>%1</t>",_keyName],[_target, _fortificationArguments] call _titleCode];
	};
	_target setUserActionText [_actionID,_title,_texSet select _frame,_icon + "<br/><br/>" + _hint];
};

OFT_fnc_holdAction_animationTimerCodeF =
{
	if (time > (missionNamespace getVariable ["bis_fnc_holdAction_animationIdleTime",-1]) && {_eval}) then
	{
		bis_fnc_holdAction_animationIdleTime = time + 0.065;
		bis_fnc_holdAction_animationIdleFrame = (bis_fnc_holdAction_animationIdleFrame + 1) % 12;

		//play idle animation only when action is not in progress
		if (!bis_fnc_holdAction_running) then
		{
			params["_titleCode","_iconIdle","_hint","_fortificationArguments"];
			private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
			private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];
			if (count _fortificationArguments == 0) then {
				_fortificationArguments = ["", "", 0, 0, 0];
			};

			//idle animations always have 12 frames
			[_originalTarget,_actionID,_titleCode,_iconIdle,TEXTURES_IDLE,bis_fnc_holdAction_animationIdleFrame,true,_keyName,_fortificationArguments] call OFT_fnc_holdAction_showIconF;
		};
	};
};

private _codeInit =
{
	bis_fnc_holdAction_running = true;

	//check if another hold action is running, if so terminate the new hold action execution
	if (!isNil "OFT_fnc_holdAction_scriptHandleF" && {!scriptDone OFT_fnc_holdAction_scriptHandleF}) exitWith {};

	bis_fnc_holdAction_params = _this;
	OFT_fnc_holdAction_scriptHandleF = _this spawn
	{
		//unwrap arguments supplied by addAction command
		params
		[
			["_target",objNull,[objNull]],
			["_caller",objNull,[objNull]],
			["_actionID",10,[123]],
			["_arguments",[],[[]]]
		];

		private _this = _caller;	//needed for conditions, there _caller is refferenced as _this for some legacy reason ;(
		private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
		private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];

		//disable player's action menu
		{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction"];

		//unwrap 'arguments' argument :)
		_arguments params["_a0","_a1","_a2","_a3","_a4","_a5","_a6","_a7","_a8","_a9","_target","_titleCode","_iconIdle","_iconProgress","_condShow","_condProgress","_codeStart","_codeProgress","_codeCompleted","_codeInterrupted","_duration","_removeCompleted"];
		_fortificationArguments = [_arguments select 0, _arguments select 1, _arguments select 2, _arguments select 3, _arguments select 4];

		//retype conditions from string to code
		private _condProgressCode = compile _condProgress;

		//play transition-in animation
		for "_i" from 0 to FRAME_MAX_IN do
		{
			sleep 0.05;

			//update icon
			[_target,_actionID,_titleCode,_iconIdle,TEXTURES_IN,_i,false,_keyName,_fortificationArguments] call OFT_fnc_holdAction_showIconF;
		};

		//execute supplied 'on start' action code
		[_target,_caller,_actionID,_arguments] call _codeStart;

		//progress init
		private _frame = 0;
		private _timeStart = time;
		private _timeNextStep = time;
		private _stepDuration = _duration / FRAME_MAX_PROGRESS;

		//handle progress
		while {call _condProgressCode && {_frame < FRAME_MAX_PROGRESS}} do
		{
			_timeNextStep = _timeStart + (_frame * _stepDuration);

			waitUntil
			{
				time >= _timeNextStep || {(inputAction "Action" < 0.5 && {inputAction "ActionContext" < 0.5}) || {visibleMap || {!(call _condProgressCode)}}}
			};

			//exit if progression failed - key was released or condition was not fulfiled
			if (time < _timeNextStep) exitWith
			{
				/*
				["[x] inputAction 'Action' : %1",inputAction "Action"] call bis_fnc_logFormat;
				["[x] inputAction 'ActionContext' : %1",inputAction "ActionContext"] call bis_fnc_logFormat;
				["[x] !(call _condProgressCode) : %1",!(call _condProgressCode)] call bis_fnc_logFormat;
				["[x] visibleMap : %1",visibleMap] call bis_fnc_logFormat;
				*/
			};

			//increment progress
			_frame = _frame + 1;

			//update icon
			[_target,_actionID,_titleCode,_iconProgress,TEXTURES_PROGRESS,_frame,false,_keyName,_fortificationArguments] call OFT_fnc_holdAction_showIconF;

			//execute supplied 'on progress' action code
			[_target,_caller,_actionID,_arguments,_frame,FRAME_MAX_PROGRESS] call _codeProgress;
		};

		//execute supplied 'completed' action code
		if (_frame == FRAME_MAX_PROGRESS) then
		{
			sleep _stepDuration;

			if (_removeCompleted) then
			{
				_target removeAction _actionID;
			};

			[_target,_caller,_actionID,_arguments] call _codeCompleted;
		}
		else
		{
			[_target,_caller,_actionID,_arguments] call _codeInterrupted;
		};

		//reset the progress texture
		[_target,_actionID,_titleCode,_iconIdle,TEXTURES_PROGRESS,0,false,_keyName,_fortificationArguments] call OFT_fnc_holdAction_showIconF;

		//enable player's action menu
		{inGameUISetEventHandler [_x, ""]} forEach ["PrevAction", "NextAction"];

		//reset 'running' flag
		bis_fnc_holdAction_running = false;
	};
};

//inject custom code to _condStart to allow for the idle animation
if (_iconIdle isEqualType "") then
{
	_fortificationArguments = [_arguments select 0, _arguments select 1, str (_arguments select 2), str (_arguments select 3), str (_arguments select 4)];
	_condShow = format["_target = _originalTarget; _eval = %1; [%2,""%3"",""%4"",%5] call OFT_fnc_holdAction_animationTimerCodeF; _eval",_condShow,_titleCode,_iconIdle,_hint,_fortificationArguments];
}
else
{
	_fortificationArguments = [_arguments select 0, _arguments select 1, str (_arguments select 2), str (_arguments select 3), str (_arguments select 4)];
	_condShow = format["_target = _originalTarget; _eval = %1; [%2,%3,""%4"",%5] call OFT_fnc_holdAction_animationTimerCodeF; _eval",_condShow,_titleCode,_iconIdle,_hint,_fortificationArguments];
};

//add the action
private _actionID = _target addAction [_title, _codeInit, _arguments, _priority, _showWindow, ACTION_HIDE_ON_USE, ACTION_SHORTCUT, _condShow, ACTION_DISTANCE, _showUnconscious, ""];

[_target, _actionID, _arguments] spawn {
	params
	[
		["_target",objNull,[objNull]],
		["_actionID",10,[123]],
		["_arguments",[],[[]]]
	];
	_arguments params["_a0","_a1","_a2","_a3","_a4","_a5","_a6","_a7","_a8","_a9","_target","_titleCode","_iconIdle","_iconProgress","_condShow","_condProgress","_codeStart","_codeProgress","_codeCompleted","_codeInterrupted","_duration","_removeCompleted"];
	_fortificationArguments = [_arguments select 0, _arguments select 1, _arguments select 2, _arguments select 3, _arguments select 4];
	private _keyNameRaw = actionKeysNames ["Action",1,"Keyboard"];
	private _keyName = _keyNameRaw select [1,count _keyNameRaw - 2];

	while {alive _target} do {
		waitUntil { _var = _target getVariable "updateAllHoldActions"; (!isNil "_var") && {_target getVariable "updateAllHoldActions"} };
		[_target,_actionID,_titleCode,_iconIdle,TEXTURES_PROGRESS,0,false,_keyName,_fortificationArguments] call OFT_fnc_holdAction_showIconF;
		sleep 0.1;
		_target setVariable ["updateAllHoldActions", false, true];
	};
};

//set the initial state to frame 0
[_target,_actionID,_titleCode,_iconIdle,TEXTURES_IDLE,0,false,_keyName,_fortificationArguments] call OFT_fnc_holdAction_showIconF;

_actionID
"""]
# --------------------------------------------------------------------------------------------

# fn_respawnHandle.sqf file
fn_respawnHandle_sqf = ["functions\\fn_respawnHandle.sqf", r"""fn_initRespawn = {
	diag_log "Initialising respawn markers";
	_allRespawnMarkersWest = missionNamespace getVariable "allRespawnMarkersWEST";
	_allRespawnMarkersEast = missionNamespace getVariable "allRespawnMarkersEAST";
	_allRespawnMarkersGuer = missionNamespace getVariable "allRespawnMarkersGUER";
	_allRespawnMarkersCiv = missionNamespace getVariable "allRespawnMarkersCIV";

	if (isNil "_allRespawnMarkersWest") then {
		diag_log "Initialising respawn markers for west side";
		_allRespawnMarkersWest = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for west side
			if (_x find "respawn_west" > -1) then {
				_allRespawnMarkersWest pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersWEST", _allRespawnMarkersWest, true];
	} else {
		diag_log format ["_allRespawnMarkersWest: %1", _allRespawnMarkersWest];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for west side
			if (_x find "respawn_west" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersWest isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersWest;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};

	if (isNil "_allRespawnMarkersEast") then {
		diag_log "Initialising respawn markers for east side";
		_allRespawnMarkersEast = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for east side
			if (_x find "respawn_east" > -1) then {
				_allRespawnMarkersEast pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersEAST", _allRespawnMarkersEast, true];
	} else {
		diag_log format ["_allRespawnMarkersEast: %1", _allRespawnMarkersEast];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for east side
			if (_x find "respawn_east" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersEast isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersEast;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};

	if (isNil "_allRespawnMarkersGuer") then {
		diag_log "Initialising respawn markers for guer side";
		_allRespawnMarkersGuer = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for guer side
			if (_x find "respawn_guer" > -1) then {
				_allRespawnMarkersGuer pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersGUER", _allRespawnMarkersGuer, true];
	} else {
		diag_log format ["_allRespawnMarkersGuer: %1", _allRespawnMarkersGuer];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for guer side
			if (_x find "respawn_guer" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersGuer isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersGuer;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};

	if (isNil "_allRespawnMarkersCiv") then {
		diag_log "Initialising respawn markers for civ side";
		_allRespawnMarkersCiv = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for civ side
			if (_x find "respawn_civ" > -1) then {
				_allRespawnMarkersCiv pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersCIV", _allRespawnMarkersCiv, true];
	} else {
		diag_log format ["_allRespawnMarkersCiv: %1", _allRespawnMarkersCiv];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for civ side
			if (_x find "respawn_civ" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersCiv isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersCiv;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};
};

fn_setVehicleToFollow = {
	_respawnName = _this select 0;
	diag_log format ["Setting marker %1 to follow vehicle", _respawnName];
	_vehicle = _this select 1;
	diag_log format ["Vehicle: %1", _vehicle];
	_isMoveOutWhenSpawn = _this select 2;
	diag_log format ["_isMoveOutWhenSpawn: %1", _isMoveOutWhenSpawn];

	_respawnNameList = missionNamespace getVariable format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")];
	// Check if _respawnName is not in the list
	if (!(_respawnName in _respawnNameList)) exitWith {
		deleteMarker _respawnName;
		diag_log format ["%1 is not in the list", _respawnName];
		true;
	};

	[_respawnName, _vehicle, _isMoveOutWhenSpawn] spawn {
		_respawnName = _this select 0;
		_vehicle = _this select 1;
		_isMoveOutWhenSpawn = _this select 2;
		_respawnNameVar = format ["%1_followVehicle", _respawnName];
		_respawnJumpOutVar = format ["%1_jumpOut", _respawnName];
		missionNamespace setVariable [_respawnNameVar, _vehicle, true];
		missionNamespace setVariable [_respawnJumpOutVar, _isMoveOutWhenSpawn, true];
		if (isServer) then {
			while {true} do {
				if (!alive _vehicle) exitWith {

					// Remove marker text
					_respawnName setMarkerText "";

					// Remove marker type
					_respawnName setMarkerType "Empty";

					// Remove marker
					deleteMarker _respawnName;

					// Remove variable from all respawn markers list
					_respawnNameList = missionNamespace getVariable format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")];
					_respawnNameList = _respawnNameList - [_respawnName];
					missionNamespace setVariable [format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")], _respawnNameList, true];
				};

				_respawnName = _this select 0;
				_vehicle = _this select 1;

				_respawnName setMarkerPos _vehicle;
				sleep 1;
			};
		};
	};
};

fn_movePlayerInSpawnVics = {
	_entity = _this select 0;
	_vehicle = _this select 1;
	_respawnName = _this select 2;
	_movePlayerToCargo = [_entity, _vehicle, _respawnName] spawn {
		_entity = _this select 0;
		_vehicle = _this select 1;
		_respawnName = _this select 2;
		_isJumpOutWhenSpawn = missionNamespace getVariable [format ["%1_jumpOut", _respawnName], false];
		
		_vehEmptyPositions = _vehicle emptyPositions "CARGO";

		// Try to move the unit into vehicle cargo if there is space
		if (_vehEmptyPositions > 0) then {
			
			moveOut _entity;
			_entity moveInCargo _vehicle;
		
		};

		if (_isJumpOutWhenSpawn) then {
			[_entity] spawn {
				_entity = _this select 0;
				sleep 1;
				moveOut _entity;
			};
		};
	};
};

// Add respawn marker
fn_addRespawnMarker = {
	_list = missionNamespace getVariable [format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")], []];

	_biggestNumber = 0;

	{
		// Current result is saved in variable _x
		// Find the last number of the marker name that is biggest
		_markerName = _x;
		_token = _markerName splitString "_";
		if (count _token > 2) then {
			_number = _token select 2;
			_number = parseNumber _number;
			if (_number > _biggestNumber) then {
				_biggestNumber = _number;
			};
		} else {
			_biggestNumber = 0;
		};

	} forEach _list;

	_markerName = format ["respawn_%1_%2", toLower (missionNamespace getVariable "playerSideVar"), _biggestNumber + 1];

	_markerVisibleName = _this select 0;
	_markerPos = _this select 1;
	_markerType = _this select 2;
	_marker = createMarker [_markerName, _markerPos];
	_marker setMarkerType _markerType;
	_marker setMarkerText _markerVisibleName;

	_list pushBack _markerName;
	missionNamespace setVariable [format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")], _list, true];

	_markerName;
};

// Create and set maker to follow vehicle
fn_createMarkerToFollowVehicle = {
	_markerVisibleName = _this select 0;
	_markerPos = _this select 1;
	_markerType = _this select 2;
	_vehicle = _this select 3;
	_isMoveOutWhenSpawn = _this select 4;

	_markerName = [_markerVisibleName, _markerPos, _markerType] call fn_addRespawnMarker;
	diag_log format ["Visible marker name: %1 have been created with name %2", _markerVisibleName, _markerName];
	[_markerName, _vehicle, _isMoveOutWhenSpawn] call fn_setVehicleToFollow;
};


////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if (side player == sideLogic) exitWith {true};

_request = (_this select 0);

switch (_request) do {
	// INITIALISATION
	case "init": {
		[] call fn_initRespawn;
	};

	// Set marker to follow vehicle
	case "setVehicleToFollow": {
		_respawnName = _this select 1;
		_vehicle = _this select 2;

		[_respawnName, _vehicle] call fn_setVehicleToFollow;
	};

	// Move player into vehicle cargo
	case "movePlayerInSpawnVics": {
		_entity = _this select 1;
		_vehicle = _this select 2;
		_respawnName = _this select 3;

		[_entity, _vehicle, _respawnName] call fn_movePlayerInSpawnVics;
	};

	// Add respawn marker
	case "addRespawnMarker": {
		_markerVisibleName = _this select 1;
		_markerPos = _this select 2;
		_markerType = _this select 3;

		[_markerVisibleName, _markerPos, _markerType] call fn_addRespawnMarker;
	};

	// Create and set maker to follow vehicle
	case "createMarkerToFollowVehicle": {
		_markerVisibleName = _this select 1;
		_markerType = _this select 2;
		_vehicle = _this select 3;
		_isMoveOutWhenSpawn = _this select 4;

		if (isNil "_isMoveOutWhenSpawn") then {
			_isMoveOutWhenSpawn = false;
		};

		_markerPos = getPos _vehicle;

		[_markerVisibleName, _markerPos, _markerType, _vehicle, _isMoveOutWhenSpawn] call fn_createMarkerToFollowVehicle;
	};
};"""]
# --------------------------------------------------------------------------------------------

# fn_showFPS.sqf file
fn_showFPS_sqf = ["functions\\fn_showFPS.sqf", r"""[] spawn {
	if (isDedicated && !isServer) exitWith {};

	_mk = createMarker ["fpsmarker", [0, -500]];
	_mk setMarkerType "mil_dot";
	_mk setMarkerSize [0,0];

	_mk1 = createMarker ["minFpsMarker", [0, -700]];
	_mk1 setMarkerType "mil_dot";
	_mk1 setMarkerSize [0,0];

	_mk2 = createMarker ["maxFpsMarker", [0, -900]];
	_mk2 setMarkerType "mil_dot";
	_mk2 setMarkerSize [0,0];

	_mk3 = createMarker ["averageLast10FpsMarker", [0, -1100]];
	_mk3 setMarkerType "mil_dot";
	_mk3 setMarkerSize [0,0];

	missionNamespace setVariable ["minFps", (round (diag_fps * 100.0)) / 100.0, true];
	missionNamespace setVariable ["maxFps", (round (diag_fps * 100.0)) / 100.0, true];
	missionNamespace setVariable ["averageLast10Fps", [(round (diag_fps * 100.0)) / 100.0], true];

	_mk1 setMarkerText format ["MIN FPS: %1", (round (diag_fps * 100.0)) / 100.0];
	_mk2 setMarkerText format ["MAX FPS: %1", (round (diag_fps * 100.0)) / 100.0];
	_mk3 setMarkerText format ["AVERAGE LAST 10 FPS: %1", (round (diag_fps * 100.0)) / 100.0];

	while {true} do {
		_currentFps = (round (diag_fps * 100.0)) / 100.0;
		_mk setMarkerText format ["CURRENT FPS: %1 fps", _currentFps];

		_minFps = missionNamespace getVariable ["minFps", 0];
		if (_currentFps < _minFps) then {
			_mk1 setMarkerText format ["MIN FPS: %1", _currentFps];
			missionNamespace setVariable ["minFps", _currentFps, true];
		};

		_maxFps = missionNamespace getVariable ["maxFps", 0];
		if (_currentFps > _maxFps) then {
			_mk2 setMarkerText format ["MAX FPS: %1", _currentFps];
			missionNamespace setVariable ["maxFps", _currentFps, true];
		};

		_averageLast10Fps = missionNamespace getVariable ["averageLast10Fps", []];
		if (count _averageLast10Fps > 9) then {
			_averageLast10Fps = _averageLast10Fps - [_averageLast10Fps select 0];
			_averageLast10Fps = _averageLast10Fps + [_currentFps];
		} else {
			_averageLast10Fps pushBack _currentFps;
		};

		_average = 0;
		{
			_average = _average + _x;
		} forEach _averageLast10Fps;
		_average = _average / count _averageLast10Fps;

		_mk3 setMarkerText format ["AVERAGE LAST 10 FPS CHECK: %1", _average];

		sleep 2;
	};
};
"""]
# --------------------------------------------------------------------------------------------

function_array = [fn_coverMap_sqf, fn_customFillBox_sqf, fn_fortificationBox_sqf, fn_gearBox_sqf, fn_holdActionAdd_sqf, fn_holdActionAddFortification_sqf, fn_respawnHandle_sqf, fn_showFPS_sqf]