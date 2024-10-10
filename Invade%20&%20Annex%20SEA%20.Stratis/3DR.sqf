if (!isDedicated) then {

	waitUntil {!isNull (findDisplay 46)};

	if( (difficultyOption "thirdPersonView")isEqualTo 1) then
	{
		while {true} do {

			waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};

			if  (((vehicle player) == player) && (speed ( player)) >= -10) then {
				player switchCamera "INTERNAL";
			};
			sleep 0.1;
		};
	};
};