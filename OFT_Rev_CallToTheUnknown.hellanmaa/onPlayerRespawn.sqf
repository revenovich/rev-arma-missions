params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if ((missionNameSpace getVariable "playerGear") isEqualTo []) then {
	if (missionNamespace getVariable ["isAutoGear", false]) then {
		[0] spawn OFT_fnc_gearHandle;
	};
} else {
	if (missionNamespace getVariable ["isAutoGear", false]) then {
		[3] call OFT_fnc_gearHandle;
	};
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

	_lookAtHandle = _oldUnit getVariable ["lookAtHandle", objNull];
	if (!isNull _lookAtHandle) then {
		terminate _lookAtHandle;
		_oldUnit setVariable ["lookAtHandle", objNull, true];
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

	// [_newUnit] execVM "mission_functions\manualHeal.sqf";

	// [_newUnit] execVM "mission_functions\playerWearMask.sqf";

	private _lookAtHandle = [_newUnit] spawn {
		params ["_newUnit"];
		while {alive _newUnit} do {
			private _from = eyePos _newUnit;
			private _to = _from vectorAdd (eyeDirection _newUnit vectorMultiply 3000);
			private _hit = lineIntersectsSurfaces [_from, _to, _newUnit, objNull, true, 1, "VIEW", "FIRE"];

			if (_hit isNotEqualTo []) then {
				private _objectHit = (_hit select 0) select 2;

				private _damage = _newUnit getVariable ["increamentDamage", 0];

				if (_objectHit isEqualTo jason_voorhees) then {
					_damage = _damage + 0.3;
					[_newUnit, _damage, "Head", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
					[_newUnit, _damage, "Body", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
				} else {
					_damage = 0;
				};
				_newUnit setVariable ["increamentDamage", _damage, true];
			};

			sleep 0.2;
		};
	};
	_newUnit setVariable ["lookAtHandle", _lookAtHandle, true];
};