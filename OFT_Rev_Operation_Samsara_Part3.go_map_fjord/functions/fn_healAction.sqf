fn_addHealAction = {
	params ["_targetUnit"];

	private _healActionId = _targetUnit addAction [
		format ["Full Heal | %1 left", _targetUnit getVariable ["numberOfHeals", 0]],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];

			_target setVariable ["numberOfHeals", (_target getVariable ["numberOfHeals", 0]) - 1, true];
			_target setDamage 0;
			["ace_medical_treatment_fullHealLocal", _target, _target] call CBA_fnc_targetEvent;
			[_target, false] call ace_medical_fnc_setUnconscious;

			[_target, _actionId] remoteExec ["removeAction", OFT_TO_ALL_PLAYERS];
			[[["add", _target], OFT_fnc_healAction] remoteExec ["call", OFT_TO_ALL_PLAYERS]];
		},
		[],
		1,
		true,
		true,
		"",
		"(alive _target) && (_target getVariable ['numberOfHeals', 0] > 0) && _this == _target",
		1
	];

	_targetUnit setVariable ["healActionId", _healActionId, true];
};

if (!isServer) exitWith {};

params ["_request", "_targetUnit"];

switch (_request) do {
	case "init": {
		systemChat "Heal action script init";
		diag_log "Heal action script init";
	};

	case "add": {
		[_targetUnit] call fn_addHealAction;
	};
};
