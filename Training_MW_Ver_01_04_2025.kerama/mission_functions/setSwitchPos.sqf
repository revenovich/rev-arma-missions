_this#0 attachTo [jamCar_1, [-1.1,-0.5,-0.7]];
[_this#0, 90] remoteExec ["setDir"];

// server
server_1 attachTo [jamCar_1, [-0.45,-0.5,-0.7]];
[server_1, -90] remoteExec ["setDir"];

// computer
computer_1 attachTo [jamCar_1, [-0.45,-0.5,-0.3]];
[computer_1, -90] remoteExec ["setDir"];

// generator
generator_1 attachTo [jamCar_1, [-0.2,-1.5,-0.55]];

// fuel
fuelCan_1 attachTo [jamCar_1, [-0.4,-1.9,-0.65]];

// burning barrel 
barrel_1 attachTo [jamCar_1, [0,0,1.4]];
barrel_2 attachTo [jamCar_1, [0,0.6,1.4]];
[barrel_1, [0,0,90]] call BIS_fnc_setObjectRotation;
[barrel_2, [0,0,90]] call BIS_fnc_setObjectRotation;
