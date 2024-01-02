fire_barrel_1 = nil;
publicVariable "fire_barrel_1";

fire_barrel_2 = nil;
publicVariable "fire_barrel_2";

isDeployed = false;
publicVariable "isDeployed";

jamCar_1 addAction
[  
    "Pack up fire barrel",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_b1 = missionNamespace getVariable "fire_barrel_1";
		_b2 = missionNamespace getVariable "fire_barrel_2";
		if (typeOf _b1 == "Land_MetalBarrel_empty_F") then {deleteVehicle _b1};
		if (typeOf _b2 == "Land_MetalBarrel_empty_F") then {deleteVehicle _b2};
		missionNamespace setVariable ["fire_barrel_1", nil, true];
		missionNamespace setVariable ["fire_barrel_2", nil, true];
		missionNamespace setVariable ["isDeployed", false, true];
		barrel_1 hideObjectGlobal false;
		barrel_2 hideObjectGlobal false;
    },  
    [],
    1.5,  
    true,  
    true,  
    "",  
    "missionNamespace getVariable 'isDeployed' && (isNull objectParent _this)",  
    5,  
    false,  
    "",  
    ""  
];

jamCar_1 addAction  
[  
    "Deploy fire barrel",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];
		// Get direction of car and spawn barrels in the back
		_dir = getDir jamCar_1;
		_dir1 = _dir + 170;
		_dir2 = _dir + 190;
		_b1 = createVehicle ["Land_MetalBarrel_empty_F",(jamCar_1 getPos [5, _dir1]),[],0,"CAN_COLLIDE"];
		_b2 = createVehicle ["Land_MetalBarrel_empty_F",(jamCar_1 getPos [5, _dir2]),[],0,"CAN_COLLIDE"];
		missionNamespace setVariable ["fire_barrel_1", _b1, true];
		missionNamespace setVariable ["fire_barrel_2", _b2, true];
		missionNamespace setVariable ["isDeployed", true, true];
		barrel_1 hideObjectGlobal true;
		barrel_2 hideObjectGlobal true;
    },  
    [],  
    1.5,  
    true,  
    true,  
    "",
    "!(missionNamespace getVariable 'isDeployed') && (isNull objectParent _this)",  
    5,  
    false,  
    "",  
    ""  
];