#include "initSettings.sqf"

// Define functions here early before Athena has a chance to define them
fnc_gatherGroups     = compileFinal preprocessFileLineNumbers "\zeusops_addon\athena\gatherGroups.sqf";
fnc_gatherUnits      = compileFinal preprocessFileLineNumbers "\zeusops_addon\athena\gatherUnits.sqf";
fnc_gatherVehicles   = compileFinal preprocessFileLineNumbers "\zeusops_addon\athena\gatherVehicles.sqf";
