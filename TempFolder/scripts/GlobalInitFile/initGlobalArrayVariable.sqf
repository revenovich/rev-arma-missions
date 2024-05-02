_pFilteredLauncherArray = [gAllVarArray, "launcherBox"] call gFilterString_Fnc;
_pFilteredGreArray = [gAllVarArray, "greBox"] call gFilterString_Fnc;
_pFiltered_TG_LauncherBoxArray = [gAllVarArray, "trainingGround_LauncherSpawnBox"] call gFilterString_Fnc;
_pFiltered_LoadoutSignArray = [gAllVarArray, "reChooseLoadout_Sign_"] call gFilterString_Fnc;
_pFiltered_Arti_Amb_Array = [gAllVarArray, "arti_amb_"] call gFilterString_Fnc;
_pFiltered_Arti_Amb_Target_Array = [gAllVarArray, "arti_target_"] call gFilterString_Fnc;
_pFiltered_Arti_Amb_Vir_Array = [gAllVarArray, "amb_vir_arti_"] call gFilterString_Fnc;
_pFiltered_Frontline_Spawn_Vic_Array = [gAllVarArray, "frontline_spawnVic_"] call gFilterString_Fnc;


_pFiltered_Frontline_Waypoint1_Vic_Array = [gAllVarArray, "frontline_line1waypoint_"] call gFilterString_Fnc;
_pFiltered_Frontline_Waypoint2_Vic_Array = [gAllVarArray, "frontline_line2waypoint_"] call gFilterString_Fnc;
_pFiltered_Frontline_Waypoint3_Vic_Array = [gAllVarArray, "frontline_line3waypoint_"] call gFilterString_Fnc;
_pFiltered_Frontline_Waypoint4_Vic_Array = [gAllVarArray, "frontline_line4waypoint_"] call gFilterString_Fnc;
_pFiltered_Frontline_Waypoint5_Vic_Array = [gAllVarArray, "frontline_line5waypoint_"] call gFilterString_Fnc;

gLauncherBoxArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gLauncherBoxArray pushBack _pTempObjName;
} forEach _pFilteredLauncherArray;
publicVariable "gLauncherBoxArray";

gGreBoxArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gGreBoxArray pushBack _pTempObjName;
} forEach _pFilteredGreArray;
publicVariable "gGreBoxArray";

gTG_LauncherBoxArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gTG_LauncherBoxArray pushBack _pTempObjName;
} forEach _pFiltered_TG_LauncherBoxArray;
publicVariable "gTG_LauncherBoxArray";

gLoadoutSignArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gLoadoutSignArray pushBack _pTempObjName;
} forEach _pFiltered_LoadoutSignArray;
publicVariable "gLoadoutSignArray";

gArtiAmbArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gArtiAmbArray pushBack _pTempObjName;
} forEach _pFiltered_Arti_Amb_Array;
publicVariable "gArtiAmbArray";

gArtiAmbTargetArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gArtiAmbTargetArray pushBack _pTempObjName;
} forEach _pFiltered_Arti_Amb_Target_Array;
publicVariable "gArtiAmbTargetArray";

gArtiAmbVirArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gArtiAmbVirArray pushBack _pTempObjName;
} forEach _pFiltered_Arti_Amb_Vir_Array;
publicVariable "gArtiAmbVirArray";

gFrontlineSpawnVicArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gFrontlineSpawnVicArray pushBack _pTempObjName;
} forEach _pFiltered_Frontline_Spawn_Vic_Array;
publicVariable "gFrontlineSpawnVicArray";

gFrontlineWaypoint1VicArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gFrontlineWaypoint1VicArray pushBack _pTempObjName;
} forEach _pFiltered_Frontline_Waypoint1_Vic_Array;
publicVariable "gFrontlineWaypoint1VicArray";

gFrontlineWaypoint2VicArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gFrontlineWaypoint2VicArray pushBack _pTempObjName;
} forEach _pFiltered_Frontline_Waypoint2_Vic_Array;
publicVariable "gFrontlineWaypoint2VicArray";

gFrontlineWaypoint3VicArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gFrontlineWaypoint3VicArray pushBack _pTempObjName;
} forEach _pFiltered_Frontline_Waypoint3_Vic_Array;
publicVariable "gFrontlineWaypoint3VicArray";

gFrontlineWaypoint4VicArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gFrontlineWaypoint4VicArray pushBack _pTempObjName;
} forEach _pFiltered_Frontline_Waypoint4_Vic_Array;
publicVariable "gFrontlineWaypoint4VicArray";

gFrontlineWaypoint5VicArray = [];
{
	// Current result is saved in variable _x
	_pTempObjName = missionNamespace getVariable _x;
	gFrontlineWaypoint5VicArray pushBack _pTempObjName;
} forEach _pFiltered_Frontline_Waypoint5_Vic_Array;
publicVariable "gFrontlineWaypoint5VicArray";

gFrontlineAllWpVicArray = [
	gFrontlineWaypoint1VicArray,
	gFrontlineWaypoint2VicArray,
	gFrontlineWaypoint3VicArray,
	gFrontlineWaypoint4VicArray,
	gFrontlineWaypoint5VicArray
];
publicVariable "gFrontlineAllWpVicArray";