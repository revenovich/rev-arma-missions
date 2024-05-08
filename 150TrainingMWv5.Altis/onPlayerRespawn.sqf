params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if ((missionNameSpace getVariable "playerGear") isEqualTo []) then {
	[0] spawn OFT_fnc_gearHandle;
} else {
	[3] call OFT_fnc_gearHandle;
};

[_newUnit] spawn {
	["init"] call OFT_fnc_respawnHandle;
	_newUnit = _this select 0;
	sleep 0.1;

	_unitSide = toUpper (missionNamespace getVariable "playerSideVar");
	_varName = format ["allRespawnMarkers%1", _unitSide];

	_nearestMarker = [missionNamespace getVariable _varName, _newUnit] call BIS_fnc_nearestPosition;
	_nearestMarkerVar = format ["%1_followVehicle", _nearestMarker];
	_vehicle = missionNamespace getVariable [_nearestMarkerVar, objNull];

	if (!isNull _vehicle) then {
		["movePlayerInSpawnVics", _newUnit, _vehicle] call OFT_fnc_respawnHandle;
	};
};


