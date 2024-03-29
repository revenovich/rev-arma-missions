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
		
		_caller sideChat "The panel on the generator said that the estimated time to full charge is 10 minutes.";

		sleep 300;
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep 297;
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
		
		_caller sideChat "The panel on the generator said that the estimated time to full charge is 5 minutes.";

		sleep 150;
		// Global hint for 50% charge
		["Device is now at 50% charge"] remoteExec ["hint", 0];
		sleep 3;
		[""] remoteExec ["hint", 0];
		sleep 147;
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