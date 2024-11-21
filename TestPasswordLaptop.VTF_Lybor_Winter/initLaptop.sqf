[
	_this#0,
	"Access the laptop",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"!(_target getVariable ['laptopAccess', false])",
	"true",
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_caller, "Accessing the laptop...", 5] remoteExec ["globalChat", 0];
	},
	{ },
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_password = "halas#2024";
		_promptMessage = "Access the laptop by providing the password:";
		[_target, _caller, _password, _promptMessage] execVM "laptopAccess.sqf";
	},
	{ },
	[], 1, nil, false, false
] call BIS_fnc_holdActionAdd;

[
	_this#0,
	"Listen to recorded message",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_target getVariable ['laptopAccess', false] && !(_target getVariable ['isPlaying', false])",
	"true",
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
	},
	{ },
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target setVariable ["isPlaying", true, true];
		_duration = 37;
		[_target, _caller] execVM "laptopSound.sqf";
		[_duration, _target] spawn {
			params ["_duration", "_target"];
			sleep _duration;
			_target setVariable ["isPlaying", false, true];
		};
	},
	{ },
	[], 1, nil, false, false
] call BIS_fnc_holdActionAdd;