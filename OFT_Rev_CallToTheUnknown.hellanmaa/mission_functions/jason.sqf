[_this#0] spawn {
	sleep 1;
	jason_voorhees = objNull;
	jason_voorhees = _this#0;
	publicVariable "jason_voorhees";
	_this#0 allowDamage false;
	_this#0 removeAllEventHandlers "HandleDamage";
	_this#0 addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

		if (!(_source == _unit) && !(_source isEqualTo jason_voorhees)) then {
			private _totalDamage = (_source getVariable ["returnIncrementDamage", 0]) + 0.2;
			[_source, _totalDamage, "Head", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
			[_source, _totalDamage, "Body", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
			_source setVariable ["returnIncrementDamage", _totalDamage, true];
		};

	}];
};
