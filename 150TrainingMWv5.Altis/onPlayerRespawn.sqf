params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if ((missionNameSpace getVariable "playerGear") isEqualTo []) then {
	[0] spawn OFT_fnc_gearHandle;
} else {
	[3] call OFT_fnc_gearHandle;
};

[_newUnit] spawn {
	_newUnit = _this select 0;
	sleep 0.5;
	_listOfNearestObjects = nearestObjects [_newUnit, ["LandVehicle", "Air", "Ship"], 20];
	if (count _listOfNearestObjects > 0) then {
		_vic = _listOfNearestObjects select 0;
		["movePlayerInSpawnVics", _newUnit, _vic] call OFT_fnc_respawnHandle;
	};
};

