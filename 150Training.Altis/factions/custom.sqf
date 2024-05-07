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

////////////////////////////////////////////////
//        DO NOT EDIT BELOW THIS LINE         //
////////////////////////////////////////////////

// _testUnit = missionNameSpace getVariable "test_1";
if (isNull test_1) then {
	hint "No unit found";
} else {
	_loadout = getUnitLoadout test_1;

	_uniform = _loadout select 3;
	_trueUniform = _uniform select 0;

	_uniformBasic = _trueUniform;
};


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

//// IS LEADER USE GRENADE LAUNCHER
missionNameSpace setVariable ["gearLeaderGL", _leaderGL, true];
////