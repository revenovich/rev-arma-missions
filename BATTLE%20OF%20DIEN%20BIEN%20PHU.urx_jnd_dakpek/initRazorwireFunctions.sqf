fnc_handleWireDamage = {
	params ["_thisList", "_thisTrigger"];

	// Get synchronized objects
	private _synchronizedObjects = synchronizedObjects _thisTrigger;
	if (count _synchronizedObjects == 0) exitWith {};

	// Find first object that has razorwire_* in it variable name
	private _razorWireObject = objNull;

	{
		// Current result is saved in variable _x
		if ((str _x) find "razorwire_" != -1)  exitWith {_razorWireObject = _x};
	} forEach _synchronizedObjects;

	if (isNull _razorWireObject) exitWith {};
	if (count _thisList < 1) exitWith {};
	if (!(alive _razorWireObject)) exitWith {
		deleteVehicle _thisTrigger;
	};

	[_thisList, _razorWireObject] spawn {
		params ["_thisList", "_razorWireObject"];

		while {count _thisList > 0 && alive _razorWireObject} do {
			// Extract all players in the trigger area
			private _playersInArea = [];
			{
				if (isPlayer _x) then {
					_playersInArea pushBack _x;
				};
			} forEach _thisList;
			if (count _playersInArea == 0) exitWith {};

			// Loop through all players in the trigger area and apply damage increasingly
			{
				private _player = _x;
				if (alive _player) then {
					private _randomDamage = random [0.5, 0.7, 0.7];
					private _randomPart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];

					// Apply damage to the player
					[_player, _randomDamage, _randomPart, "cut", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
				};
			} forEach _playersInArea;	

			// Wait for a short time before the next damage application
			sleep 0.5;
		};

	};
};

publicVariable "fnc_handleWireDamage";