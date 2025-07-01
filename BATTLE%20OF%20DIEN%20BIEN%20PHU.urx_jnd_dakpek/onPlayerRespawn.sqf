params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

[_oldUnit] spawn {
	if (isNil "_oldUnit" || !hasInterface) exitWith {};
	params ["_oldUnit"];

};

[_newUnit] spawn {
	if !(hasInterface || isDedicated) exitWith {};
	params ["_newUnit"];

	[_newUnit] call oft_fnc_gearLoad;
	_newUnit addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		private _isCarryingFlag = [_unit] call ace_flags_fnc_isCarryingFlag;
		if (_isCarryingFlag) then {
			private _flag = _unit getVariable ["ace_flags_carryingFlag", ""];
			_deathPos = getPosATL _unit;

			_lootHolder = createVehicle ["GroundWeaponHolder", _deathPos, [], 1, "NONE"];

			_lootHolder addItemCargoGlobal [_flag, 1];
			_unit forceFlagTexture "";
		};
	}];
};