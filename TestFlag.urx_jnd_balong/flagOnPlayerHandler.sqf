params ["_player"];

[_player, ["Deploy Flag",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_cursorPos = screenToWorld [0.5, 0.5];
		_flag = flag _caller;
		_flag setFlagOwner objNull;
		_flag setPosATL _cursorPos;
		_flag setFlagAnimationPhase 0;
		[_flag, 1, 0.5] call BIS_fnc_animateFlag;
		_caller setVariable ["isDeployingFlag", true, true];

		waitUntil {(flagAnimationPhase _flag) isEqualTo 1};

		_caller setVariable ["isDeployingFlag", false, true];
		_caller setVariable ["carryingFlag", false, true];
		_caller setVariable ["flag", objNull, true];
	},
	[_player],
	6,
	false,
	true,
	"",
	"_target getVariable ['carryingFlag', false] && !(_target getVariable ['isDeployingFlag', false])",
	1
]] remoteExec ["addAction", _player];