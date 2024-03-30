powerBox_1 animateSource ["switchposition",1];
powerBox_1 animateSource ["light",0];
powerBox_1 setDamage 1;

powerBox_1 addAction [
	"Turn On",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target animateSource ["switchposition",-1];
		_target animateSource ["light",1];
		_target setDamage 0;

		_isTaskGenerator1Triggered = missionNamespace getVariable ["isTaskGenerator1Triggered", false];
		if (!_isTaskGenerator1Triggered) then {
			[independent, "generator_on1", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;
			missionNamespace setVariable ["isTaskGenerator1Triggered", true, true];
		} else {
			["generator_on1", "SUCCEEDED"] call BIS_fnc_taskSetState;
		};
		
		missionNamespace setVariable ["isGenerator1On", true, true];

		_timeToCharge = missionNamespace getVariable ["1_labTotalTimeToCharge", 600];

		_minutesToCharge = floor(_timeToCharge / 60);
		
		_caller sideChat "The panel on the generator said that the estimated time to full charge is " + str(_minutesToCharge) + " minutes.";

		sleep (_timeToCharge / 2);
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep (_timeToCharge / 2 - 3);
		[] spawn {
			// Global hint for 100% charge
			["Device is now at 100% charge"] remoteExec ["hint", 0];
			sleep 3;
			// Global hint empty string to clear hint
			[""] remoteExec ["hint", 0];
		};
		missionNamespace setVariable ["isDevicePower1On", true, true];
		[independent, "failsafe1", ["Disable device fail safe to unlock its full potential", "Disable device fail safe", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!alive _target",   
	3,   
	true,   
	"",   
	""   
];

powerBox_2 animateSource ["switchposition",1];
powerBox_2 animateSource ["light",0];
powerBox_2 setDamage 1;

powerBox_2 addAction [
	"Turn On",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target animateSource ["switchposition",-1];
		_target animateSource ["light",1];
		_target setDamage 0;

		_isTaskGenerator2Triggered = missionNamespace getVariable ["isTaskGenerator2Triggered", false];
		if (!_isTaskGenerator2Triggered) then {
			[independent, "generator_on2", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;
			missionNamespace setVariable ["isTaskGenerator2Triggered", true, true];
		} else {
			["generator_on2", "SUCCEEDED"] call BIS_fnc_taskSetState;
		};
		
		missionNamespace setVariable ["isGenerator2On", true, true];
		
		_timeToCharge = missionNamespace getVariable ["2_labTotalTimeToCharge", 300];

		_minutesToCharge = floor(_timeToCharge / 60);

		_caller sideChat "The panel on the generator said that the estimated time to full charge is " + str(_minutesToCharge) + " minutes.";

		sleep (_timeToCharge / 2);
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep (_timeToCharge / 2 - 3);
		[] spawn {
			// Global hint for 100% charge
			["Device is now at 100% charge"] remoteExec ["hint", 0];
			sleep 3;
			// Global hint empty string to clear hint
			[""] remoteExec ["hint", 0];
		};
		missionNamespace setVariable ["isDevicePower2On", true, true];
		[independent, "failsafe2", ["Disable device fail safe to unlock its full potential", "Disable device fail safe", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!alive _target",   
	3,   
	true,   
	"",   
	""   
];

powerBox_3 animateSource ["switchposition",1];
powerBox_3 animateSource ["light",0];
powerBox_3 setDamage 1;

powerBox_3 addAction [
	"Turn On",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target animateSource ["switchposition",-1];
		_target animateSource ["light",1];
		_target setDamage 0;

		_isTaskGenerator3Triggered = missionNamespace getVariable ["isTaskGenerator3Triggered", false];
		if (!_isTaskGenerator3Triggered) then {
			[independent, "generator_on3", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;
			missionNamespace setVariable ["isTaskGenerator3Triggered", true, true];
		} else {
			["generator_on3", "SUCCEEDED"] call BIS_fnc_taskSetState;
		};
		
		missionNamespace setVariable ["isGenerator3On", true, true];

		_timeToCharge = missionNamespace getVariable ["3_labTotalTimeToCharge", 300];

		_minutesToCharge = floor(_timeToCharge / 60);
		
		_caller sideChat "The panel on the generator said that the estimated time to full charge is " + str(_minutesToCharge) + " minutes.";

		sleep (_timeToCharge / 2);
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep (_timeToCharge / 2 - 3);
		[] spawn {
			// Global hint for 100% charge
			["Device is now at 100% charge"] remoteExec ["hint", 0];
			sleep 3;
			// Global hint empty string to clear hint
			[""] remoteExec ["hint", 0];
		};
		missionNamespace setVariable ["isDevicePower3On", true, true];
		[independent, "failsafe3", ["Disable device fail safe to unlock its full potential", "Disable device fail safe", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!alive _target",   
	3,   
	true,   
	"",   
	""   
];

powerBox_4 animateSource ["switchposition",1];
powerBox_4 animateSource ["light",0];
powerBox_4 setDamage 1;

powerBox_4 addAction [
	"Turn On",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target animateSource ["switchposition",-1];
		_target animateSource ["light",1];
		_target setDamage 0;

		_isTaskGenerator4Triggered = missionNamespace getVariable ["isTaskGenerator4Triggered", false];
		if (!_isTaskGenerator4Triggered) then {
			[independent, "generator_on4", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;
			missionNamespace setVariable ["isTaskGenerator4Triggered", true, true];
		} else {
			["generator_on4", "SUCCEEDED"] call BIS_fnc_taskSetState;
		};
		
		missionNamespace setVariable ["isGenerator4On", true, true];

		_timeToCharge = missionNamespace getVariable ["4_labTotalTimeToCharge", 300];

		_minutesToCharge = floor(_timeToCharge / 60);
		
		_caller sideChat "The panel on the generator said that the estimated time to full charge is " + str(_minutesToCharge) + " minutes.";

		sleep (_timeToCharge / 2);
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep (_timeToCharge / 2 - 3);
		[] spawn {
			// Global hint for 100% charge
			["Device is now at 100% charge"] remoteExec ["hint", 0];
			sleep 3;
			// Global hint empty string to clear hint
			[""] remoteExec ["hint", 0];
		};
		missionNamespace setVariable ["isDevicePower4On", true, true];
		[independent, "failsafe4", ["Disable device fail safe to unlock its full potential", "Disable device fail safe", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!alive _target",   
	3,   
	true,   
	"",   
	""   
];

powerBox_5 animateSource ["switchposition",1];
powerBox_5 animateSource ["light",0];
powerBox_5 setDamage 1;

powerBox_5 addAction [
	"Turn On",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target animateSource ["switchposition",-1];
		_target animateSource ["light",1];
		_target setDamage 0;

		_isTaskGenerator5Triggered = missionNamespace getVariable ["isTaskGenerator5Triggered", false];
		if (!_isTaskGenerator5Triggered) then {
			[independent, "generator_on5", ["Turn on the generator to power up the device", "Turn on the generator", "cookiemarker"], objNull, "SUCCEEDED", 1, true] call BIS_fnc_taskCreate;
			missionNamespace setVariable ["isTaskGenerator5Triggered", true, true];
		} else {
			["generator_on5", "SUCCEEDED"] call BIS_fnc_taskSetState;
		};
		
		missionNamespace setVariable ["isGenerator5On", true, true];

		_timeToCharge = missionNamespace getVariable ["5_labTotalTimeToCharge", 300];

		_minutesToCharge = floor(_timeToCharge / 60);
		
		_caller sideChat "The panel on the generator said that the estimated time to full charge is " + str(_minutesToCharge) + " minutes.";

		sleep (_timeToCharge / 2);
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep (_timeToCharge / 2 - 3);
		[] spawn {
			// Global hint for 100% charge
			["Device is now at 100% charge"] remoteExec ["hint", 0];
			sleep 3;
			// Global hint empty string to clear hint
			[""] remoteExec ["hint", 0];
		};
		missionNamespace setVariable ["isDevicePower5On", true, true];
		[independent, "failsafe5", ["Disable device fail safe to unlock its full potential", "Disable device fail safe", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
	},
	[],   
	1.5,   
	true,   
	true,   
	"",   
	"!alive _target",   
	3,   
	true,   
	"",   
	""   
];