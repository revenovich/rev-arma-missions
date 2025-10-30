params ["_deviceTruck"];

[
	_deviceTruck,
	"Start the device",
	"a3\ui_f\data\igui\cfg\actions\ico_on_ca.paa",
	"a3\ui_f\data\igui\cfg\actions\ico_on_ca.paa",
	"!(_target getVariable ['isActivated', false]) && (isNull objectParent _this) && (_this distance _target < 5)",
	"true",
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_textForChat = "I'm starting the device";
		[_caller, _textForChat] remoteExec ["sideChat", 0];
	},
	{ },
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];  

		private _anchorZones = [anchorZone_1, anchorZone_2, anchorZone_3];
		private _isInAnchorZone = false;

		{
			if (_caller inArea _x) then {
				_isInAnchorZone = true;
			};
		} forEach _anchorZones;

		if (_isInAnchorZone) then {
			_target setVariable ["isDeviceTruckActive", true, true];
			_textForChat = "Device successfully started";
			[_caller, _textForChat] remoteExec ["sideChat", 0];
			"deviceBoom" remoteExec ["playSound", 0];
			[_caller] spawn {
				// Wait for 5 to 7 minutes
				private _this = _this select 0;
				private _waitTime = [300, 420] call BIS_fnc_randomInt;
				sleep _waitTime;
				_textForChat2 = "The device has stabilized.";
				[_this, _textForChat2] remoteExec ["sideChat", 0];
			};
		} else {
			_target setVariable ["isActivated", false, true];
			_textForChat = "Hmm... must be in an anchor zone to start the device";
			[_caller, _textForChat] remoteExec ["sideChat", 0];
		};
	},
	{ },
	[], 5, nil, false, false
] call BIS_fnc_holdActionAdd;