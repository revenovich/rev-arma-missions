[] spawn {
	while {true} do {
		if (gIsAutoSpawnFrontlineVics == true) then {
			[random [0, 1, 2]] call spawnAllFrontlineVics_Fnc;
			sleep (random[250, 400, 550]);
		};
	};
};