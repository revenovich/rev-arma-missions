[] spawn { 
	sci1 sideChat "Start charging sequence."; 
	sleep 2; 
	sci1 sideChat "Booting up the system."; 
	sleep 6; 
	sci2 sideChat "System is online."; 
	sleep 3; 
	sci3 sideChat "System is stable."; 
	sleep 3; 
	sci1 sideChat "Start charging the accumulator."; 
	sleep 4; 
	sci1 sideChat "Charging the accumulator will take about 20 minutes."; 
	sleep 5; 
	sci1 sideChat "I know it's a long time, but we have to wait."; 
	sleep 3; 
	sci1 sideChat "In the meantime, try to secure the area.";
	sleep 4; 
	sci1 sideChat "I will let you know when the accumulator is fully charged."; 
	sleep 1200;
	sci1 sideChat "The accumulator is fully charged.";

	missionNamespace setVariable ["isFull", true, true];
}