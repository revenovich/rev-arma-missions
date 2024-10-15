params ["_heli"];

if (isNil "_heli") exitWith {};

_heli setVariable ["heliMoving", true, true];

_heli addAction [
	format ["<t color='#FF0000'>Go</t>"],
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_crews = fullCrew _target;
		{
			// Current result is saved in variable _x
			_x#0 enableAI "MOVE";
		} forEach _crews;
		_driver = driver _target;
		_driverGroup = group _driver;
		_driverGroup setCurrentWaypoint [_driverGroup, 12];

		_target setVariable ["heliMoving", true, true];
	},
	[],
	99,
	false,
	true,
	"",
	"alive _target && !(_target getVariable ['heliMoving', false]) && (vehicle _this == _target)",
	5
];