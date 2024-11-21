[
	_this#0,
	"Access the laptop",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"!(_target getVariable ['laptopAccess', false])",
	"true",
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_caller globalChat "Accessing the laptop...";
	},
	{ },
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_password = "1234";
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
		_volume = 10;
		_pitch = 1;
		_range = 300;
		_isInside = false;
		_soundFile = "recording.ogg";
		_isCustomSound = true;
		_duration = 37;

		_target setVariable ["isPlaying", true, true];

		if (_isCustomSound) then {
			playSound3D [getMissionPath _soundFile, _target, _isInside, getPosASL _target, _volume, _pitch, _range];
		} else {
			playSound3D [_soundFile, _target, _isInside, getPosASL _target, _volume, _pitch, _range];
		};

		[_duration, _target] spawn {
			params ["_duration", "_target"];
			sleep _duration;
			_target setVariable ["isPlaying", false, true];
		};
	},
	{ },
	[], 1, nil, false, false
] call BIS_fnc_holdActionAdd;