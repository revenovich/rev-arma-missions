fn_initRespawn = {
	_allRespawnMarkersWest = [];
	_allRespawnMarkersEast = [];
	_allRespawnMarkersGuer = [];
	_allRespawnMarkersCiv = [];

	{
		if (_x find "respawn_west" > -1) then {
			_allRespawnMarkersWest pushBack _x;
		} else {
			if (_x find "respawn_east" > -1) then {
				_allRespawnMarkersEast pushBack _x;
			} else {
				if (_x find "respawn_guer" > -1) then {
					_allRespawnMarkersGuer pushBack _x;
				} else {
					if (_x find "respawn_civ" > -1) then {
						_allRespawnMarkersCiv pushBack _x;
					};
				};
			};
		};
	} forEach allMapMarkers;

	missionNamespace setVariable ["allRespawnMarkersWest", _allRespawnMarkersWest];
	missionNamespace setVariable ["allRespawnMarkersEast", _allRespawnMarkersEast];
	missionNamespace setVariable ["allRespawnMarkersGuer", _allRespawnMarkersGuer];
	missionNamespace setVariable ["allRespawnMarkersCiv", _allRespawnMarkersCiv];
};

fn_setVehicleToFollow = {
	_respawnName = _this select 0;
	_vehicle = _this select 1;

	[_respawnName, _vehicle] spawn {
		_respawnName = _this select 0;
		_vehicle = _this select 1;
		while {true} do {
			if (!alive _vehicle && isNull _vehicle) exitWith {
				// Remove marker
				deleteMarker _respawnName;
			};

			_respawnName = _this select 0;
			_vehicle = _this select 1;

			_respawnName setMarkerPos _vehicle;
			sleep 1;
		};
	};
};

fn_movePlayerInSpawnVics = {
	_entity = _this select 0;
	_vehicle = _this select 1;
	_movePlayerToCargo = [_entity, _vehicle] spawn {
				
		_entity = _this select 0;
		_vehicle = _this select 1;
		
		_vehEmptyPositions = _vehicle emptyPositions "CARGO";

		// Try to move the unit into vehicle cargo if there is space
		if (_vehEmptyPositions > 0) then {
			
			moveOut _entity;
			_entity moveInCargo _vehicle;
		
		};
	};
};


////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if (side player == sideLogic) exitWith {true};

_request = (_this select 0);

switch (_request) do {
	// INITIALISATION
	case "init": {
		[] call fn_initRespawn;
	};

	// Set marker to follow vehicle
	case "setVehicleToFollow": {
		_respawnName = _this select 1;
		_vehicle = _this select 2;

		[_respawnName, _vehicle] call fn_setVehicleToFollow;
	};

	// Move player into vehicle cargo
	case "movePlayerInSpawnVics": {
		_entity = _this select 1;
		_vehicle = _this select 2;

		[_entity, _vehicle] call fn_movePlayerInSpawnVics;
	};
};