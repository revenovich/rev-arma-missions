spawnAllFrontlineVics_Fnc = {
	params [["_numberOfVicsPerPoint", 0, [0]]];
	for "_i" from 0 to _numberOfVicsPerPoint do {
		[] spawn {

			// Current result is saved in variable _x
			_waypointCouterHelper = 0;
			{
				// Current result is saved in variable _x
				_tempSpawnPos = getPos _x;
				_tempSpawnPosX = _tempSpawnPos#0 + random [-50, 0, 50];
				_tempSpawnPosY = _tempSpawnPos#1 + random [-50, 0, 50];
				_pSpawnedVic = [[_tempSpawnPosX, _tempSpawnPosY, _tempSpawnPos#2], 0, selectRandom gSpawnVicArrayHeavyArmor, east] call BIS_fnc_spawnVehicle;
				_pSpawnedVic#0 addMPEventHandler ["MPKilled", {
					params ["_unit", "_killer", "_instigator", "_useEffects"];
					[_unit] spawn {
						sleep 10;
						deleteVehicle (_this#0);
					};

				}];

				_pSpawnedVic#0 addEventHandler ["GetOut", {
					params ["_vehicle", "_role", "_unit", "_turret"];
					[_vehicle] spawn {
						sleep (random [30, 60, 90]);
						[(_this#0), "Sh_125mm_APFSDS_T_Red", 5, 20, 0.5, {false}, 0, 10, 2000] spawn BIS_fnc_fireSupportVirtual;
					};
					[_unit] spawn {
						[_this#0] spawn {
							while {alive(_this#0)} do {
								sleep (random [5, 10, 20]);
								[(_this#0), "Sh_155mm_AMOS", 20, 2, 5, {false}, 0, 250, 10] spawn BIS_fnc_fireSupportVirtual;
							};
						};
					};
				}];

				{
					// Current result is saved in variable _x
					_x addMPEventHandler ["MPKilled", {
						params ["_unit", "_killer", "_instigator", "_useEffects"];
						[_unit] spawn {
							sleep 5;
							deleteVehicle (_this#0);
						};
					}];

				} forEach _pSpawnedVic#1;

				_pWpArrayOfGroup = gFrontlineAllWpVicArray#_waypointCouterHelper;
				{
					// Current result is saved in variable _x
					_pSpawnedVic#2 addWaypoint [getPosATL _x, -1];
				} forEach _pWpArrayOfGroup;

				_waypointCouterHelper = _waypointCouterHelper + 1;
			} forEach gFrontlineSpawnVicArray;
		};
	};
};
publicVariable "spawnAllFrontlineVics_Fnc";