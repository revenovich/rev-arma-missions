waitUntil { missionNameSpace getVariable ["initDone", false] };

missionNamespace setVariable ["deadZombiesArray", [], true];

[] spawn {

	while {true} do {
		_allMissionObjects = allMissionObjects "Land";
		{
			// Current result is saved in variable _x
			if (side _x isEqualTo civilian) then {
				if (["zombie", str (typeOf _x)] call BIS_fnc_inString) then {
					_deadZombiesArray = missionNamespace getVariable ["deadZombiesArray", []];

					if (!(_x in _deadZombiesArray)) then {
						// Add the zombie to the array
						_deadZombiesArray pushBack _x;
						missionNamespace setVariable ["deadZombiesArray", _deadZombiesArray, true];
					};

					// If the array is larger than 50, delete the first element
					if (count _deadZombiesArray > 50) then {
						// Pop the first element from the array then delete the object
						deleteVehicle (_deadZombiesArray select 0);
						_deadZombiesArray = _deadZombiesArray - [_deadZombiesArray select 0];
						missionNamespace setVariable ["deadZombiesArray", _deadZombiesArray, true];
					};
				};
			};
		} forEach _allMissionObjects;
		sleep 10;
	};

};