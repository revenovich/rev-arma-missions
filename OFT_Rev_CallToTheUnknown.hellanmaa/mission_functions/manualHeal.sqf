params ["_newUnit"];

_maxNumberOfHeals = missionNamespace getVariable ["maxNumberOfHeals", 0];

_newUnit setVariable ["numberOfHeals", _maxNumberOfHeals, true];

if (_maxNumberOfHeals isEqualTo 0) exitWith {};

[["add", _newUnit], OFT_fnc_healAction] remoteExec ["call", OFT_TO_ALL_PLAYERS];

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

					for "_i" from 1 to 2 do {
						hint format ["Healing in %1", 3 - _i];
						sleep 1;
					};

					_unit setVariable ["numberOfHeals", (_unit getVariable ["numberOfHeals", 0]) - 1, true];
					_unit setDamage 0;
					["ace_medical_treatment_fullHealLocal", _unit, _unit] call CBA_fnc_targetEvent;
					[_unit, false] call ace_medical_fnc_setUnconscious;

					_healActionId = _unit getVariable ["healActionId", -1];
					if (_healActionId > -1) then {
						[_unit, _healActionId] remoteExec ["removeAction", OFT_TO_ALL_PLAYERS];
					};

					[[["add", _unit], OFT_fnc_healAction] remoteExec ["call", OFT_TO_ALL_PLAYERS]];

					sleep 1;
					hint "";
				};
			};
		};
	};
}] call CBA_fnc_addEventHandler;

_newUnit setVariable ["unconsciousId", _unconsciousId, true];