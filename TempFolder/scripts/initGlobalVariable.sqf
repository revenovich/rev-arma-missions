gSpawnVicArrayLightArmor = [
	"O_LSV_02_unarmed_F",
	"O_MRAP_02_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
	"UK3CB_AAF_O_BRDM2_UM",
	"UK3CB_AAF_O_GAZ_Vodnik_Cannon",
	"RHS_UAZ_MSV_01",
	"UK3CB_O_G_Hilux_BTR"
];
publicVariable "gSpawnVicArrayLightArmor";

gSpawnVicArrayMediumArmor = [
	"O_APC_Wheeled_02_rcws_v2_F",
	"O_APC_Tracked_02_cannon_F",
	"UK3CB_AAF_O_CREW",
	"UK3CB_AAF_O_M113_MK19",
	"rhs_bmp3mera_msv",
	"rhs_bmp2_msv",
	"rhs_prp3_tv",
	"UK3CB_O_G_MTLB_PKT"
];
publicVariable "gSpawnVicArrayMediumArmor";

gSpawnVicArrayHeavyArmor = [
	"rhs_t80uk", 
	"rhs_t80b", 
	"rhs_t72be_tv", 
	"rhsusf_m1a1aimd_usarmy", 
	"rhsusf_m1a1aim_tuski_d"
];
publicVariable "gSpawnVicArrayHeavyArmor";

gSpawnVicArray = [gSpawnVicArrayLightArmor, gSpawnVicArrayMediumArmor];
publicVariable "gSpawnVicArray";

gSpawnVicTypeStringArray = ["Light Armor", "Medium Armor"];
publicVariable "gSpawnVicTypeStringArray";

gLauncherNameArray = [
	"rhs_weap_M136",
	"rhs_weap_M72a7",
	"rhs_weap_rhsg2",
	"rhs_weap_rpg18",
	"rhs_weap_rpg26",
	"rhs_weap_panzerfaust60",
	"rhs_weap_rpg75",
	"rhs_weap_m80"
];
publicVariable "gLauncherNameArray";

gGreNameArray = [
	"rhs_mag_m69",
	"rhs_mag_m67",
	"rhs_mag_an_m8hc"
];
publicVariable "gGreNameArray";

gAllVarArray = allVariables missionNamespace;
publicVariable "gAllVarArray";

//Init an array for all roles
gAllRolesArray = ["Squad Leader", "Rifleman", "Medic", "Engineer", "AT", "Marksman", "Platoon Leader"];
publicVariable "gAllRolesArray";

gAllMarkersOnMap = allMapMarkers;
publicVariable "gAllMarkersOnMap";

gIsAutoSpawnFrontlineVics = true;
publicVariable "gIsAutoSpawnFrontlineVics";