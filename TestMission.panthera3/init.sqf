if (isServer) then {
	// Array of names of trucks that it's possible to respawn in
	_respawnTrucks = ["truck_1", "truck_2", "truck_3"];

	// Event handler to add respawn points every time a player is killed

	_addRespawnPoints = [_respawnTrucks] spawn {
		
		_respawnTrucks = _this select 0;
		
		while {true} do {
			{
			
				_currentPlayer = _x;
			
				// Check if the unit is a player
				if (!alive _currentPlayer) then {
		
					// Create respawn position on each truck
					{
						test = [_currentPlayer, _x] spawn {
							format ["%1, %2!", _this select 1, _this select 0] remoteExec ["hint", 0];
							sleep 5;
							[""] remoteExec ["hint", 0];
						};

						// Add respawn position to the truck
						[_currentPlayer, (missionNameSpace getVariable _x), _x] call BIS_fnc_addRespawnPosition;
					
					} forEach _respawnTrucks;
				};
		
			} forEach allPlayers;
		
			sleep 1;
		};
	};

	// Add an event handler to remove the respawn points once the player has spawned
	playerRespawnHandler = addMissionEventHandler ["EntityRespawned", {
		params ["_entity", "_corpse"];
		
		// Check if the unit is a player
		if (isPlayer _entity) then {
		
			// Remove the respawn points
			{
		
				_x call BIS_fnc_removeRespawnPosition;
				
			} forEach (_entity call BIS_fnc_getRespawnPositions);
			
			_movePlayerToCargo = [_entity] spawn {
				
				_entity = _this select 0;
				
				_playerVeh = vehicle _entity;
				_vehEmptyPositions = _playerVeh emptyPositions "CARGO";
			
				// Try to move the unit into vehicle cargo if there is space
				if (_vehEmptyPositions > 0) then {
					
					moveOut _entity;
					_entity moveInCargo _playerVeh;
				
				};
			};
		};
	}];
};
