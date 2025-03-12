params ["_newUnit"];

_maxNumberOfHeals = missionNamespace getVariable ["maxNumberOfHeals", 0];

_newUnit setVariable ["numberOfHeals", _maxNumberOfHeals, true];

if (_maxNumberOfHeals isEqualTo 0) exitWith {};

// Manual Full Heal
fn_addHealAction = {
	params ["_newUnit"];

	private _healActionId = _newUnit addAction [
		format ["Full Heal | %1 left", _newUnit getVariable ["numberOfHeals", 0]],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];

			_target setVariable ["numberOfHeals", (_target getVariable ["numberOfHeals", 0]) - 1, true];
			_target setDamage 0;
			["ace_medical_treatment_fullHealLocal", _target, _target] call CBA_fnc_targetEvent;
			[_target, false] call ace_medical_fnc_setUnconscious;

			_target removeAction _actionId;

			[_target] call fn_addHealAction;
		},
		[],
		1,
		true,
		true,
		"",
		"(alive _target) && (_target getVariable ['numberOfHeals', 0] > 0) && _this == _target",
		1
	];

	_newUnit setVariable ["healActionId", _healActionId, true];
};

[_newUnit] call fn_addHealAction;

private _unconsciousId = ["ace_unconscious", {
	params ["_unit", "_state"];

	// Check if the unit is unconscious
	if (_state) then {
		// Check if the unit is a player
		if (isPlayer _unit) then {
			// Check if the unit has any heals left, if so, decrement the number of heals and heal the unit
			if (_unit getVariable ["numberOfHeals", 0] > 0) then {
				[_unit] spawn {
					params ["_unit"];

					for "_i" from 1 to 5 do {
						hint format ["Healing in %1", 6 - _i];
						sleep 1;
					};

					_unit setVariable ["numberOfHeals", (_unit getVariable ["numberOfHeals", 0]) - 1, true];
					_unit setDamage 0;
					["ace_medical_treatment_fullHealLocal", _unit, _unit] call CBA_fnc_targetEvent;
					[_unit, false] call ace_medical_fnc_setUnconscious;

					_healActionId = _unit getVariable ["healActionId", -1];
					if (_healActionId > -1) then {
						_unit removeAction _healActionId;
					};

					[_unit] call fn_addHealAction;

					sleep 1;
					hint "";
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;

_newUnit setVariable ["unconsciousId", _unconsciousId, true];