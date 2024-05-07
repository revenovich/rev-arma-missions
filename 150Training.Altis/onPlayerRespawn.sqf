if ((missionNameSpace getVariable "playerGear") isEqualTo []) then {
	[0] spawn OFT_fnc_gearHandle;
} else {
	[3] call OFT_fnc_gearHandle;
};
