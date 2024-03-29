device_1 addAction [
	"Turn on power first",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		[independent, "generator_on1", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!isGenerator1On",
	3,   
	true,   
	"",   
	""   
];

device_2 addAction [
	"Turn on power first",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		[independent, "generator_on2", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!isGenerator2On",
	3,   
	true,   
	"",   
	""   
];