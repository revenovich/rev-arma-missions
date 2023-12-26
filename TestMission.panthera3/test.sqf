[_this, {
	_this allowDamage false;
	{ _x allowDamage false } forEach crew _this;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _this];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
	
	deleteVehicleCrew _this;
	deleteVehicle _this;
}] remoteExec ['call', 0 , _this]

[_this, {
	_this allowDamage false;
	{ _x allowDamage false } forEach crew _this;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _this];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0 , _this]

[_this, {
	[_this, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0 , _this]

[_this, {
	private _position = getPosASL _this;
	private _truePosition = [_position#0, _position#1, 1];
	private _dir = getDir _this;
	deleteVehicle _this;
	private _veh = createVehicle ["I_MRAP_03_hmg_F", _truePosition, [], 0, "CAN_COLLIDE"];
	_veh setDir _dir;
	_veh allowDamage false;
	_veh setVehicleLock "LOCKED";
	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _veh];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0 , _this]


[] spawn 
{
	while {true} do {
		s1 playMove "AmovPercMrunSlowWrflDf";
	};
};

[] spawn 
{
	sleep 10;
	mb1D enableAI "Move";
	doGetOut mb1D;
	doGetOut mb1C;

	grp1 addWaypoint [getPosASL wp1, 0];
};

DistanceToReach = 300;
this addAction
[  
    "Turn Off",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",1];  
		_target animateSource ["light",0];  
		_target setDamage 1;  
    },  
    [],
    1.5,  
    true,  
    true,  
    "",  
    "alive _target",  
    3,  
    false,  
    "",  
    ""  
];

this animateSource ["switchposition",1];
this animateSource ["light",0];
this setDamage 1;

this addAction  
[  
    "Turn On",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",-1];  
		_target animateSource ["light",1];  
		_target setDamage 0;  

		["generator_on", "SUCCEEDED"] call BIS_fnc_taskSetState;
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

[] spawn {
	sci2 globalChat "Professor Nikolai Volkov: Hello, there is a problem and we need your help.";
	sleep 3;
	sci2 globalChat "Professor Nikolai Volkov: The power is out and we need to turn it back on.";
	sleep 3;
	sci2 globalChat "Professor Nikolai Volkov: The generator located between the armory and the communications building";
	sleep 4;
	sci2 globalChat "Professor Nikolai Volkov: Turn it on and then come here to start the experiment.";
	[west, "generator_on", ["Turn on the generator to start the experiment", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;

	power_box1 addAction  
	[  
		"Turn On",  
		{  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_target animateSource ["switchposition",-1];  
			_target animateSource ["light",1];  
			_target setDamage 0;  

			missionNamespace setVariable ["isPowerOn", true, true];

			["generator_on", "SUCCEEDED"] call BIS_fnc_taskSetState;

			sci3 sideChat "We have power, get back here";
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

	sleep 3;
	sci3 globalChat "Dr. Haruka Tanaka: Do you think this will work?";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: I don't know, but we have to try.";
	sleep 2;
	sci2 globalChat "Professor Nikolai Volkov: I hope this will work.";
}

[] spawn {
	sci2 sideChat "Hello, there is a problem and we need your help.";
	sleep 3;
	sci2 sideChat "The power is out and we need to turn it back on.";
	sleep 3;
	sci2 sideChat "The generator located between the armory and the communications building";
	sleep 4;
	sci2 sideChat "Turn it on and then come here to start the experiment.";
	[west, "generator_on", ["Turn on the generator to start the experiment", "Turn on the generator", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;

	power_box1 addAction  
	[  
		"Turn On",  
		{  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_target animateSource ["switchposition",-1];  
			_target animateSource ["light",1];  
			_target setDamage 0;  

			missionNamespace setVariable ["isPowerOn", true, true];

			["generator_on", "SUCCEEDED"] call BIS_fnc_taskSetState;

			sci3 sideChat "We have power, get back here";
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

	sleep 3;
	sci3 sideChat "Do you think this will work?";
	sleep 2;
	sci1 sideChat "I don't know, but we have to try.";
	sleep 2;
	sci2 sideChat "I hope this will work.";
}

isPowerOn = false;
publicVariable "isPowerOn";

[] spawn {
	sci1 globalChat "Dr. Benjamin Shaw: I think we are ready to start the experiment.";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: Booting up the system.";
	sleep 2;
	sci2 globalChat "Professor Nikolai Volkov: System is online.";
	sleep 2;
	sci3 globalChat "Dr. Haruka Tanaka: System is stable.";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: Start charging the accumulator.";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: Charging the accumulator will take about 10 minutes.";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: I know it's a long time, but we have to wait.";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: In the meantime, try to defend the area.";
	sleep 2;
	sci1 globalChat "Dr. Benjamin Shaw: I will let you know when the accumulator is fully charged.";
	sleep 1;
	sci1 globalChat "Dr. Benjamin Shaw: The accumulator is fully charged.";
}

[] spawn {
	sci1 sideChat "I think we are ready to start the experiment.";
	sleep 2;
	sci1 sideChat "Booting up the system.";
	sleep 2;
	sci2 sideChat "System is online.";
	sleep 2;
	sci3 sideChat "System is stable.";
	sleep 2;
	sci1 sideChat "Start charging the accumulator.";
	sleep 2;
	sci1 sideChat "Charging the accumulator will take about 10 minutes.";
	sleep 2;
	sc1 sideChat "I know it's a long time, but we have to wait.";
	sleep 2;
	sci1 sideChat "In the meantime, try to defend the area.";
	sleep 2;
	sci1 sideChat "I will let you know when the accumulator is fully charged.";
	sleep 1;
	sci1 sideChat "The accumulator is fully charged.";
}

["setUnitSide.sqf"] remoteExec ["call", -2, true]

if (isPowerOn) then {
	["scriptStartExperiment.sqf"] remoteExec ["execVM", 0, true];
	deleteVehicle trigStartExperiment;
}