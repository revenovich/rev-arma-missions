////////////////////////////////////////////////
//             EDITABLE VARIABLES             //
////////////////////////////////////////////////

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
_uniform = "PB_2015M_ACU";
_vest = "PB_2015M_Carrier_Lite";
_backpack = "B_Kitbag_tan";
_headgear = "ptv_beret";
_radio = "TFAR_anprc152";
_backpackLeader = "TFAR_rt1523g_big_rhs";
_nightvision = "UK3CB_Earpiece_NVG";
_weapon1Use = "rhs_weap_rpg18";
_weaponMain = ["rhs_weap_l1a1", "rhs_mag_20Rnd_762x51_m62_fnfal", ["", ""]];
_weaponAR = ["UK3CB_M1919A6_Browning", "UK3CB_M1919_50Rnd_3006_Magazine_G", ["", ""]];
_weaponGrenadier = ["hlc_rifle_m203", "rhs_mag_20Rnd_556x45_M193_stanag", ["", ""], "rhs_mag_M441_HE"];
_weaponMarksman = ["hlc_rifle_M14_Bipod", "hlc_20Rnd_762x51_B_M14", ["hlc_optic_artel_m14", ""]];
_weaponLauncher = ["rhs_weap_rpg7", "rhs_rpg7_PG7V_mag", [""]];

////////////////////////////////////////////////
//        DO NOT EDIT BELOW THIS LINE         //
////////////////////////////////////////////////

missionNameSpace setVariable ["gearUniform", _uniform, true];
missionNameSpace setVariable ["gearVest", _vest, true];
missionNameSpace setVariable ["gearBackpack", _backpack, true];
missionNameSpace setVariable ["gearHeadgear", _headgear, true];
missionNameSpace setVariable ["gearRadio", _radio, true];
missionNameSpace setVariable ["gearBackpackLeader", _backpackLeader, true];
missionNameSpace setVariable ["gearNightvision", _nightvision, true];
missionNameSpace setVariable ["gearWeapon1Use", _weapon1Use, true];
missionNameSpace setVariable ["gearWeaponMain", _weaponMain, true];
missionNameSpace setVariable ["gearWeaponAR", _weaponAR, true];
missionNameSpace setVariable ["gearWeaponGrenadier", _weaponGrenadier, true];
missionNameSpace setVariable ["gearWeaponMarksman", _weaponMarksman, true];
missionNameSpace setVariable ["gearWeaponLauncher", _weaponLauncher, true];
