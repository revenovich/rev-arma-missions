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

device_3 addAction [
	"Turn on power first",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		[independent, "generator_on3", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!isGenerator3On",
	3,   
	true,   
	"",   
	""   
];

device_4 addAction [
	"Turn on power first",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		[independent, "generator_on4", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!isGenerator4On",
	3,   
	true,   
	"",   
	""   
];

device_5 addAction [
	"Turn on power first",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		[independent, "generator_on5", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!isGenerator5On",
	3,   
	true,   
	"",   
	""   
];