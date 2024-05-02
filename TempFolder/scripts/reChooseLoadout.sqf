gRoleNameTitleAndLoadoutArray = [
	["Change to Platoon Leader loadout", "PMC_PltLeader"],
	["Change to Squad Leader loadout", "PMC_SLeader"],
	["Change to Rifleman loadout", "PMC_Rifleman"],
	["Change to Medic loadout", "PMC_Medic"],
	["Change to AT Rifleman loadout", "PMC_AT_Rifleman"],
	["Change to Marksman loadout", "PMC_Marksman"],
	["Change to Engineer loadout", "PMC_Engineer"]
];
publicVariable "gRoleNameTitleAndLoadoutArray";

initLoadoutSign_Fnc = {
	params ["_signToInit"];
	{
		// Current result is saved in variable _x
		_signToInit addAction [_x#0, {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_caller call removeAllLoadout_Fnc;
			_caller setUnitLoadout (missionConfigFile >> "CfgRespawnInventory" >> _arguments#0);
		}, [_x#1], 1.5, true, true, "", "true", 3];

	} forEach gRoleNameTitleAndLoadoutArray;
};
publicVariable "initLoadoutSign_Fnc";


{
	// Current result is saved in variable _x

	[_x, {
		[_this] call initLoadoutSign_Fnc;
	}] remoteExec ['call', 0 , _x]
	
} forEach gLoadoutSignArray;