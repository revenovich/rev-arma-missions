params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

[_oldUnit] spawn {
	if (isNil "_oldUnit" || !hasInterface) exitWith {};
	params ["_oldUnit"];

};

[_newUnit] spawn {
	if !(hasInterface || isDedicated) exitWith {};
	params ["_newUnit"];

	[_newUnit] call oft_fnc_gearLoad;
};