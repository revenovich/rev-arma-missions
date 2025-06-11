[_this#0] spawn {
	sleep 1; // Wait for the unit to be fully initialized
	jason_voorhees = objNull;
	jason_voorhees = _this#0;
	publicVariable "jason_voorhees";
	_this#0 allowDamage false;
	_this#0 removeAllEventHandlers "HandleDamage";
	_this#0 addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

		if (_source == _unit) exitWith {0};
		if (_source isEqualTo jason_voorhees) exitWith {0};

		private _totalDamage = (_source getVariable ["returnIncrementDamage", 0]) + 0.4;
		[_source, _totalDamage, "Head", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
		[_source, _totalDamage, "Body", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
		_source setVariable ["returnIncrementDamage", _totalDamage, true];
	}];
};
