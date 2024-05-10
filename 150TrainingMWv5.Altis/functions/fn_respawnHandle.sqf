fn_initRespawn = {
	diag_log "Initialising respawn markers";
	_allRespawnMarkersWest = missionNamespace getVariable "allRespawnMarkersWEST";
	_allRespawnMarkersEast = missionNamespace getVariable "allRespawnMarkersEAST";
	_allRespawnMarkersGuer = missionNamespace getVariable "allRespawnMarkersGUER";
	_allRespawnMarkersCiv = missionNamespace getVariable "allRespawnMarkersCIV";

	if (isNil "_allRespawnMarkersWest") then {
		diag_log "Initialising respawn markers for west side";
		_allRespawnMarkersWest = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for west side
			if (_x find "respawn_west" > -1) then {
				_allRespawnMarkersWest pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersWEST", _allRespawnMarkersWest, true];
	} else {
		diag_log format ["_allRespawnMarkersWest: %1", _allRespawnMarkersWest];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for west side
			if (_x find "respawn_west" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersWest isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersWest;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};

	if (isNil "_allRespawnMarkersEast") then {
		diag_log "Initialising respawn markers for east side";
		_allRespawnMarkersEast = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for east side
			if (_x find "respawn_east" > -1) then {
				_allRespawnMarkersEast pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersEAST", _allRespawnMarkersEast, true];
	} else {
		diag_log format ["_allRespawnMarkersEast: %1", _allRespawnMarkersEast];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for east side
			if (_x find "respawn_east" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersEast isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersEast;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};

	if (isNil "_allRespawnMarkersGuer") then {
		diag_log "Initialising respawn markers for guer side";
		_allRespawnMarkersGuer = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for guer side
			if (_x find "respawn_guer" > -1) then {
				_allRespawnMarkersGuer pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersGUER", _allRespawnMarkersGuer, true];
	} else {
		diag_log format ["_allRespawnMarkersGuer: %1", _allRespawnMarkersGuer];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for guer side
			if (_x find "respawn_guer" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersGuer isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersGuer;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};

	if (isNil "_allRespawnMarkersCiv") then {
		diag_log "Initialising respawn markers for civ side";
		_allRespawnMarkersCiv = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for civ side
			if (_x find "respawn_civ" > -1) then {
				_allRespawnMarkersCiv pushBack _x;
			};
		} forEach allMapMarkers;
		missionNamespace setVariable ["allRespawnMarkersCIV", _allRespawnMarkersCiv, true];
	} else {
		diag_log format ["_allRespawnMarkersCiv: %1", _allRespawnMarkersCiv];
		_tempList = [];
		{
			// Current result is saved in variable _x
			// Check if the marker is a respawn marker for civ side
			if (_x find "respawn_civ" > -1) then {
				_tempList pushBack _x;
			};
		} forEach allMapMarkers;

		if (_allRespawnMarkersCiv isEqualTo _tempList) then {
			diag_log "Lists are equal";
		} else {
			diag_log "Lists are not equal";
			// Remove item that redundant in the _tempList
			_tempList = _tempList - _allRespawnMarkersCiv;
			diag_log format ["_tempList: %1", _tempList];
			{
				// Current result is saved in variable _x
				deleteMarker _x;
			} forEach _tempList;
		};
	};
};

fn_setVehicleToFollow = {
	_respawnName = _this select 0;
	diag_log format ["Setting marker %1 to follow vehicle", _respawnName];
	_vehicle = _this select 1;
	diag_log format ["Vehicle: %1", _vehicle];
	_isMoveOutWhenSpawn = _this select 2;
	diag_log format ["_isMoveOutWhenSpawn: %1", _isMoveOutWhenSpawn];

	_respawnNameList = missionNamespace getVariable format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")];
	// Check if _respawnName is not in the list
	if (!(_respawnName in _respawnNameList)) exitWith {
		deleteMarker _respawnName;
		diag_log format ["%1 is not in the list", _respawnName];
		true;
	};

	[_respawnName, _vehicle, _isMoveOutWhenSpawn] spawn {
		_respawnName = _this select 0;
		_vehicle = _this select 1;
		_isMoveOutWhenSpawn = _this select 2;
		_respawnNameVar = format ["%1_followVehicle", _respawnName];
		_respawnJumpOutVar = format ["%1_jumpOut", _respawnName];
		missionNamespace setVariable [_respawnNameVar, _vehicle, true];
		missionNamespace setVariable [_respawnJumpOutVar, _isMoveOutWhenSpawn, true];
		if (isServer) then {
			while {true} do {
				if (!alive _vehicle) exitWith {

					// Remove marker text
					_respawnName setMarkerText "";

					// Remove marker type
					_respawnName setMarkerType "Empty";

					// Remove marker
					deleteMarker _respawnName;

					// Remove variable from all respawn markers list
					_respawnNameList = missionNamespace getVariable format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")];
					_respawnNameList = _respawnNameList - [_respawnName];
					missionNamespace setVariable [format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")], _respawnNameList, true];
				};

				_respawnName = _this select 0;
				_vehicle = _this select 1;

				_respawnName setMarkerPos _vehicle;
				sleep 1;
			};
		};
	};
};

fn_movePlayerInSpawnVics = {
	_entity = _this select 0;
	_vehicle = _this select 1;
	_respawnName = _this select 2;
	_movePlayerToCargo = [_entity, _vehicle, _respawnName] spawn {
		_entity = _this select 0;
		_vehicle = _this select 1;
		_respawnName = _this select 2;
		_isJumpOutWhenSpawn = missionNamespace getVariable [format ["%1_jumpOut", _respawnName], false];
		
		_vehEmptyPositions = _vehicle emptyPositions "CARGO";

		// Try to move the unit into vehicle cargo if there is space
		if (_vehEmptyPositions > 0) then {
			
			moveOut _entity;
			_entity moveInCargo _vehicle;
		
		};

		if (_isJumpOutWhenSpawn) then {
			moveOut _entity;
		};
	};
};

// Add respawn marker
fn_addRespawnMarker = {
	_list = missionNamespace getVariable [format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")], []];

	_biggestNumber = 0;

	{
		// Current result is saved in variable _x
		// Find the last number of the marker name that is biggest
		_markerName = _x;
		_token = _markerName splitString "_";
		if (count _token > 2) then {
			_number = _token select 2;
			_number = parseNumber _number;
			if (_number > _biggestNumber) then {
				_biggestNumber = _number;
			};
		} else {
			_biggestNumber = 0;
		};

	} forEach _list;

	_markerName = format ["respawn_%1_%2", toLower (missionNamespace getVariable "playerSideVar"), _biggestNumber + 1];

	_markerVisibleName = _this select 0;
	_markerPos = _this select 1;
	_markerType = _this select 2;
	_marker = createMarker [_markerName, _markerPos];
	_marker setMarkerType _markerType;
	_marker setMarkerText _markerVisibleName;

	_list pushBack _markerName;
	missionNamespace setVariable [format ["allRespawnMarkers%1", toUpper (missionNamespace getVariable "playerSideVar")], _list, true];

	_markerName;
};

// Create and set maker to follow vehicle
fn_createMarkerToFollowVehicle = {
	_markerVisibleName = _this select 0;
	_markerPos = _this select 1;
	_markerType = _this select 2;
	_vehicle = _this select 3;
	_isMoveOutWhenSpawn = _this select 4;

	_markerName = [_markerVisibleName, _markerPos, _markerType] call fn_addRespawnMarker;
	diag_log format ["Visible marker name: %1 have been created with name %2", _markerVisibleName, _markerName];
	[_markerName, _vehicle, _isMoveOutWhenSpawn] call fn_setVehicleToFollow;
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
		_respawnName = _this select 3;

		[_entity, _vehicle, _respawnName] call fn_movePlayerInSpawnVics;
	};

	// Add respawn marker
	case "addRespawnMarker": {
		_markerVisibleName = _this select 1;
		_markerPos = _this select 2;
		_markerType = _this select 3;

		[_markerVisibleName, _markerPos, _markerType] call fn_addRespawnMarker;
	};

	// Create and set maker to follow vehicle
	case "createMarkerToFollowVehicle": {
		_markerVisibleName = _this select 1;
		_markerType = _this select 2;
		_vehicle = _this select 3;
		_isMoveOutWhenSpawn = _this select 4;

		if (isNil "_isMoveOutWhenSpawn") then {
			_isMoveOutWhenSpawn = false;
		};

		_markerPos = getPos _vehicle;

		[_markerVisibleName, _markerPos, _markerType, _vehicle, _isMoveOutWhenSpawn] call fn_createMarkerToFollowVehicle;
	};
};