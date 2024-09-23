params ["_isStart"];

all_players = allPlayers;

if (_isStart) then {
	call {playSound "shockwave";};
	{
		// Current result is saved in variable _x
		[_x, true, 10] call ace_medical_fnc_setUnconscious;
	} forEach all_players;

	// Get all unit side independent
	independent_units = allUnits select {side _x isEqualTo independent};

	{
		// Current result is saved in variable _x
		_x setDamage 1;
	} forEach independent_units;
} else {
	{
		// Current result is saved in variable _x
		[_x, false] call ace_medical_fnc_setUnconscious;
		_x setDamage 0;
	} forEach all_players;
}