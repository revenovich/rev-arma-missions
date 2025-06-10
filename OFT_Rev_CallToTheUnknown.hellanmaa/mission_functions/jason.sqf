[_this#0] spawn {
	sleep 1; // Wait for the unit to be fully initialized
	_this#0 removeAllEventHandlers "HandleDamage";
	_this#0 addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

		private _totalDamage = (_source getVariable ["returnIncrementDamage", 0]) + 0.2;
		[_source, _totalDamage, "Head", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
		[_source, _totalDamage, "Body", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
		_source setVariable ["returnIncrementDamage", _totalDamage, true];
		0
	}];
};
