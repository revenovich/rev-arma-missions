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