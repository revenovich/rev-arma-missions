////////////////////////////////////////////////
//             EDITABLE VARIABLES             //
////////////////////////////////////////////////


        ///////////////////////////////
        //     NOTES ON VARIABLES    // 
        ///////////////////////////////

// Make sure the ammo fits the weapon.
// Give best allowed vest, backpack, and helmet that players are allowed (e.g. armored vest instead of chest rig).
// Give tracer/mixed ammo if possible.
// Each item needs to be within double quotes: ""
// If there are multiple items, meaning attachments and mags, all of the are inside [] as well
// Each attachment needs to be within quotes, and then after each attachment there needs to be a comma after the quotes
// You can have maximum of 4 attachments, but you can have zero as well. In that case just have [""] in where the attachment should be
// Example; ["weapon", "mag", [""]];
// Each line needs to end in a ;
// Basic info for a weapon line: ["weapon_name", "magazine_name", ["attachment1","attachment2","attachment3","attachment4"], "secondary_ammunition_if_any"];

//////////////////////////////////////////////// ALL ROLES
// AT Rifleman, Autorifleman, Engineer, Grenadier, Marksman, Medic, Rifleman, Teamleader
////////////////////////////////////////////////

//// UNIFORMS
_uniformBasic = "U_B_CombatUniform_mcam_tshirt";

_uniformAT = "U_B_CombatUniform_mcam_tshirt";
_uniformAutorifleman = "U_B_CombatUniform_mcam_tshirt";
_uniformEngineer = "U_B_CombatUniform_mcam_tshirt";
_uniformGrenadier = "U_B_CombatUniform_mcam_tshirt";
_uniformMarksman = "U_B_CombatUniform_mcam_tshirt";
_uniformMedic = "U_B_CombatUniform_mcam_tshirt";
_uniformRifleman = "U_B_CombatUniform_mcam_tshirt";
_uniformLeader = "U_B_CombatUniform_mcam_tshirt";
////

//// VESTS
_vestBasic = "V_Chestrig_rgr";

_vestAT = "V_Chestrig_rgr";
_vestAutorifleman = "V_Chestrig_rgr";
_vestEngineer = "V_Chestrig_rgr";
_vestGrenadier = "V_Chestrig_rgr";
_vestMarksman = "V_Chestrig_rgr";
_vestMedic = "V_Chestrig_rgr";
_vestRifleman = "V_Chestrig_rgr";
_vestLeader = "V_Chestrig_rgr";
////

//// BACKPACKS
_backpackBasic = "B_AssaultPack_rgr";

_backpackAT = "B_AssaultPack_rgr";
_backpackAutorifleman = "B_AssaultPack_rgr";
_backpackEngineer = "B_AssaultPack_rgr";
_backpackGrenadier = "B_AssaultPack_rgr";
_backpackMarksman = "B_AssaultPack_rgr";
_backpackMedic = "B_AssaultPack_rgr";
_backpackRifleman = "B_AssaultPack_rgr";
_backpackLeader = "TFAR_rt1523g";
////

//// HEADGEAR
_headgearBasic = "H_HelmetB_light";

_headgearAT = "H_HelmetB_light";
_headgearAutorifleman = "H_HelmetB_light";
_headgearEngineer = "H_HelmetB_light";
_headgearGrenadier = "H_HelmetB_light";
_headgearMarksman = "H_HelmetB_light";
_headgearMedic = "H_HelmetB_light";
_headgearRifleman = "H_HelmetB_light";
_headgearLeader = "H_HelmetB_light";
////

//// EQUIPMENT & WEAPONS
_radio = "TFAR_anprc152";
_nightvision = "NVGoggles";
_weapon1Use = ["ACE_launch_NLAW_ready_F", "NLAW_F"];
_weaponMain = ["arifle_MSBS65_UBS_sand_F", "30Rnd_65x39_caseless_msbs_mag", ["", ""]];
_weaponAR = ["arifle_MSBS65_UBS_sand_F", "30Rnd_65x39_caseless_msbs_mag", ["", ""]];
_weaponGrenadier = ["arifle_MSBS65_GL_sand_F", "30Rnd_65x39_caseless_msbs_mag", ["", ""], "1Rnd_HE_Grenade_shell"];
_weaponMarksman = ["arifle_MSBS65_UBS_sand_F", "30Rnd_65x39_caseless_msbs_mag", ["", ""]];
_weaponLauncher = ["", "", [""]];
////

//// IS LEADER USE GRENADE LAUNCHER
_leaderGL = true;
////

//// IS LEADER MASTER ALL SPECIALIST
_leaderMasterAllSpecialist = false;
////

//// IS USE UNIT INSTEAD OF DEFINED LOADOUT ABOVE
_isUseUnit = true;
////

////////////////////////////////////////////////
//        DO NOT EDIT BELOW THIS LINE         //
////////////////////////////////////////////////

if (_isUseUnit) then {
	_nullUnits = [];
	_notNullUnits = [];

	// AT Rifleman
	if (isNull atrifleman) then {
		_nullUnits pushBack "AT Rifleman";
	} else {
		[5, atrifleman, "LOADOUT AT RIFLEMAN"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack atrifleman;
	};

	// Autorifleman
	if (isNull autorifleman) then {
		_nullUnits pushBack "Autorifleman";
	} else {
		[5, autorifleman, "LOADOUT AUTORIFLEMAN"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack autorifleman;
	};

	// Engineer
	if (isNull engineer) then {
		_nullUnits pushBack "Engineer";
	} else {
		[5, engineer, "LOADOUT ENGINEER"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack engineer;
	};

	// Grenadier
	if (isNull grenadier) then {
		_nullUnits pushBack "Grenadier";
	} else {
		[5, grenadier, "LOADOUT GRENADIER"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack grenadier;
	};

	// Marksman
	if (isNull marksman) then {
		_nullUnits pushBack "Marksman";
	} else {
		[5, marksman, "LOADOUT MARKSMAN"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack marksman;
	};

	// Medic
	if (isNull medic) then {
		_nullUnits pushBack "Medic";
	} else {
		[5, medic, "LOADOUT MEDIC"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack medic;
	};

	// Rifleman
	if (isNull rifleman) then {
		_nullUnits pushBack "Rifleman";
	} else {
		[5, rifleman, "LOADOUT RIFLEMAN"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack rifleman;
	};

	// Teamleader
	if (isNull teamleader) then {
		_nullUnits pushBack "Teamleader";
	} else {
		[5, teamleader, "LOADOUT TEAMLEADER"] call OFT_fnc_gearHandle;
		_notNullUnits pushBack teamleader;
	};

	if (count _nullUnits > 0) then {
		_nullUnitsString = _nullUnits joinString ", ";
		_nullUnitsString = format ["%1 not found in mission, loadout not applied", _nullUnitsString];
		hint _nullUnitsString;
	};

	AllPlayableUnitsItens = [];
	{AllPlayableUnitsItens = AllPlayableUnitsItens + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x)} forEach (_notNullUnits);
	AllPlayableUnitsItens = AllPlayableUnitsItens select {count _x > 0};
	AllPlayableUnitsItens = AllPlayableUnitsItens arrayIntersect AllPlayableUnitsItens;

	additionalItems = addArsenalItems call ace_arsenal_fnc_getVirtualItems;
	// Convert because format return is: [["item1", any], ["item2", any], ["item3", any], ...]. Hashmap
	additionalItems = (toArray additionalItems)#0;

	// Get unique items
	AllPlayableUnitsItens = AllPlayableUnitsItens + additionalItems;

	itemsRemove = removeArsenalItems call ace_arsenal_fnc_getVirtualItems;
	// Convert because format return is: [["item1", any], ["item2", any], ["item3", any], ...]. Hashmap
	itemsRemove = (toArray itemsRemove)#0;

	// Delete the two arsenals
	{
		deleteVehicle _x;
	} forEach [addArsenalItems, removeArsenalItems];

	// Remove items
	AllPlayableUnitsItens = AllPlayableUnitsItens - itemsRemove;

	// Save all items to missionNamespace
	missionNamespace setVariable ["AllPlayableUnitsItens", AllPlayableUnitsItens, true];


	// Delete template units
	{
		deleteVehicle _x;
	} forEach _notNullUnits;

} else {
	//// UNIFORMS
	missionNameSpace setVariable ["gearUniformBasic", _uniformBasic, true];

	missionNameSpace setVariable ["gearUniformAT", _uniformAT, true];
	missionNameSpace setVariable ["gearUniformAutorifleman", _uniformAutorifleman, true];
	missionNameSpace setVariable ["gearUniformEngineer", _uniformEngineer, true];
	missionNameSpace setVariable ["gearUniformGrenadier", _uniformGrenadier, true];
	missionNameSpace setVariable ["gearUniformMarksman", _uniformMarksman, true];
	missionNameSpace setVariable ["gearUniformMedic", _uniformMedic, true];
	missionNameSpace setVariable ["gearUniformRifleman", _uniformRifleman, true];
	missionNameSpace setVariable ["gearUniformLeader", _uniformLeader, true];
	////

	//// VESTS
	missionNameSpace setVariable ["gearVestBasic", _vestBasic, true];

	missionNameSpace setVariable ["gearVestAT", _vestAT, true];
	missionNameSpace setVariable ["gearVestAutorifleman", _vestAutorifleman, true];
	missionNameSpace setVariable ["gearVestEngineer", _vestEngineer, true];
	missionNameSpace setVariable ["gearVestGrenadier", _vestGrenadier, true];
	missionNameSpace setVariable ["gearVestMarksman", _vestMarksman, true];
	missionNameSpace setVariable ["gearVestMedic", _vestMedic, true];
	missionNameSpace setVariable ["gearVestRifleman", _vestRifleman, true];
	missionNameSpace setVariable ["gearVestLeader", _vestLeader, true];
	////

	//// BACKPACKS
	missionNameSpace setVariable ["gearBackpackBasic", _backpackBasic, true];

	missionNameSpace setVariable ["gearBackpackAT", _backpackAT, true];
	missionNameSpace setVariable ["gearBackpackAutorifleman", _backpackAutorifleman, true];
	missionNameSpace setVariable ["gearBackpackEngineer", _backpackEngineer, true];
	missionNameSpace setVariable ["gearBackpackGrenadier", _backpackGrenadier, true];
	missionNameSpace setVariable ["gearBackpackMarksman", _backpackMarksman, true];
	missionNameSpace setVariable ["gearBackpackMedic", _backpackMedic, true];
	missionNameSpace setVariable ["gearBackpackRifleman", _backpackRifleman, true];
	missionNameSpace setVariable ["gearBackpackLeader", _backpackLeader, true];
	////

	//// HEADGEAR
	missionNameSpace setVariable ["gearHeadgearBasic", _headgearBasic, true];

	missionNameSpace setVariable ["gearHeadgearAT", _headgearAT, true];
	missionNameSpace setVariable ["gearHeadgearAutorifleman", _headgearAutorifleman, true];
	missionNameSpace setVariable ["gearHeadgearEngineer", _headgearEngineer, true];
	missionNameSpace setVariable ["gearHeadgearGrenadier", _headgearGrenadier, true];
	missionNameSpace setVariable ["gearHeadgearMarksman", _headgearMarksman, true];
	missionNameSpace setVariable ["gearHeadgearMedic", _headgearMedic, true];
	missionNameSpace setVariable ["gearHeadgearRifleman", _headgearRifleman, true];
	missionNameSpace setVariable ["gearHeadgearLeader", _headgearLeader, true];
	////

	//// EQUIPMENT & WEAPONS
	missionNameSpace setVariable ["gearRadio", _radio, true];
	missionNameSpace setVariable ["gearNightvision", _nightvision, true];
	missionNameSpace setVariable ["gearWeapon1Use", _weapon1Use, true];
	missionNameSpace setVariable ["gearWeaponMain", _weaponMain, true];
	missionNameSpace setVariable ["gearWeaponAR", _weaponAR, true];
	missionNameSpace setVariable ["gearWeaponGrenadier", _weaponGrenadier, true];
	missionNameSpace setVariable ["gearWeaponMarksman", _weaponMarksman, true];
	missionNameSpace setVariable ["gearWeaponLauncher", _weaponLauncher, true];
	////
};

//// IS LEADER USE GRENADE LAUNCHER
missionNameSpace setVariable ["gearLeaderGL", _leaderGL, true];
////

//// IS LEADER MASTER ALL SPECIALIST
missionNameSpace setVariable ["LeaderMasterAllSpecialist", _leaderMasterAllSpecialist, true];
////

//// IS USE UNIT INSTEAD OF DEFINED LOADOUT ABOVE
missionNameSpace setVariable ["gearIsUseUnit", _isUseUnit, true];
////