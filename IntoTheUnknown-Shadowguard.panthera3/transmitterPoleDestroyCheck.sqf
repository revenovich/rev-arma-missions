while {true} do {
	// Check transmitterPole damage
	if (damage transmitterPole == 1) exitWith {
		["destroyPole", "SUCCEEDED"] call BIS_fnc_taskSetState; 
	}
};