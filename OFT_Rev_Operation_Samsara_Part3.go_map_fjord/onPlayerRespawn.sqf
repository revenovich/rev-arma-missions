params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if ((missionNameSpace getVariable "playerGear") isEqualTo []) then {
	[0] spawn OFT_fnc_gearHandle;
} else {
	[3] call OFT_fnc_gearHandle;
};

[_oldUnit] spawn {
	if (isNil "_oldUnit" || !hasInterface) exitWith {};

	params ["_oldUnit"];

	_healActionId = _oldUnit getVariable ["healActionId", -1];
	if (_healActionId > -1) then {
		_oldUnit removeAction _healActionId;
	};

	_unconsciousId = _oldUnit getVariable ["unconsciousId", -1];
	if (_unconsciousId > -1) then {
		_oldUnit removeEventHandler ["ace_unconscious", _unconsciousId];
	};
};

[_newUnit] spawn {
	if !(hasInterface || isDedicated) exitWith {};

	["init"] call OFT_fnc_respawnHandle;
	_newUnit = _this select 0;
	sleep 0.1;

	_unitSide = toUpper (missionNamespace getVariable "playerSideVar");
	_varName = format ["allRespawnMarkers%1", _unitSide];

	_nearestMarker = [missionNamespace getVariable _varName, _newUnit] call BIS_fnc_nearestPosition;
	_nearestMarkerVar = format ["%1_followVehicle", _nearestMarker];
	_vehicle = missionNamespace getVariable [_nearestMarkerVar, objNull];

	if (!isNull _vehicle) then {
		["movePlayerInSpawnVics", _newUnit, _vehicle, _nearestMarker] call OFT_fnc_respawnHandle;
	};

	missionNamespace setVariable ["maxNumberOfHeals", 0, true];
	[_newUnit] execVM "mission_functions\manualHeal.sqf";

	[_newUnit] execVM "mission_functions\playerWearMask.sqf";
};