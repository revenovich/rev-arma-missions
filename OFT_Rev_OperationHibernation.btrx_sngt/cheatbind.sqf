params ["_bindUnit", "_isActive"];

if (isNil "_isActive") then { _isActive = false};

private _fireEventIndex = _bindUnit getVariable ["rlxn_fire_event", -1];
private _isBound = _fireEventIndex != -1;

if (_isActive) then {
	if (_isBound) then {
		_bindUnit removeEventHandler ["Fired", _fireEventIndex];

		private _eventIdx = _bindUnit addEventHandler ["Fired", {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

			private _obj = cursorObject;
			if (_obj isKindOf "AllVehicles") then {
				if (_obj isKindOf "Man") then {
					[_obj, 10.0, "Head", "bullet", _unit] call ace_medical_fnc_addDamageToUnit;
					[_obj, true] call ace_medical_fnc_setUnconscious;
				} else {
					if (_obj isKindOf "LandVehicle" || _obj isKindOf "Air" || _obj isKindOf "Ship") then {
						private _driver = driver _obj;

						[_driver, 10.0, "Head", "bullet", _unit] call ace_medical_fnc_addDamageToUnit;
						[_driver, true] call ace_medical_fnc_setUnconscious;
					};
				};
			};
		}];

		_bindUnit setVariable ["rlxn_fire_event", _eventIdx, true];
	} else {
		private _eventIdx = _bindUnit addEventHandler ["Fired", {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

			private _obj = cursorObject;
			if (_obj isKindOf "AllVehicles") then {
				if (_obj isKindOf "Man") then {
					[_obj, 10.0, "Head", "bullet", _unit] call ace_medical_fnc_addDamageToUnit;
					[_obj, true] call ace_medical_fnc_setUnconscious;
				} else {
					if (_obj isKindOf "LandVehicle" || _obj isKindOf "Air" || _obj isKindOf "Ship") then {
						private _driver = driver _obj;

						[_driver, 10.0, "Head", "bullet", _unit] call ace_medical_fnc_addDamageToUnit;
						[_driver, true] call ace_medical_fnc_setUnconscious;
					};
				};
			};
		}];

		_bindUnit setVariable ["rlxn_fire_event", _eventIdx, true];
	};
} else {
	if (_fireEventIndex != -1) then {
		_bindUnit removeEventHandler ["Fired", _fireEventIndex];
	};
};



