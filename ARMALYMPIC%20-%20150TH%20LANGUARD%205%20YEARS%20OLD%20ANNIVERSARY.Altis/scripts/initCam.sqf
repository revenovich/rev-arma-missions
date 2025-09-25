systemChat "Initing Cam";

/* create camera and stream to render surface */
cam_1 = "camera" camCreate [0,0,0];
cam_2 = "camera" camCreate [0,0,0];
cam_3 = "camera" camCreate [0,0,0];
cam_4 = "camera" camCreate [0,0,0];
cam_5 = "camera" camCreate [0,0,0];
cam_6 = "camera" camCreate [0,0,0];

cam_1 cameraEffect ["Internal", "Back", "rtt1"];
cam_2 cameraEffect ["Internal", "Back", "rtt2"];
cam_3 cameraEffect ["Internal", "Back", "rtt3"];
cam_4 cameraEffect ["Internal", "Back", "rtt4"];
cam_5 cameraEffect ["Internal", "Back", "rtt5"];
cam_6 cameraEffect ["Internal", "Back", "rtt6"];

/* attach cam to gunner cam position */
cam_1 attachTo [uav_1, [0,0,0], "PiP0_pos"];
cam_2 attachTo [uav_2, [0,0,0], "PiP0_pos"];
cam_3 attachTo [uav_3, [0,0,0], "PiP0_pos"];

/* make it zoom in a little */
cam_1 camSetFov 0.1;
cam_2 camSetFov 0.1;
cam_3 camSetFov 0.1;
cam_4 camSetFov 0.1;
cam_5 camSetFov 0.1;
cam_6 camSetFov 0.1;

/* switch cam to thermal */
"rtt1" setPiPEffect [0];
"rtt2" setPiPEffect [0];
"rtt3" setPiPEffect [0];
"rtt4" setPiPEffect [0];
"rtt5" setPiPEffect [0];
"rtt6" setPiPEffect [0];

/* adjust cam orientation */
addMissionEventHandler ["Draw3D", {
    _dir_1 = 
        (uav_1 selectionPosition "PiP0_pos") 
            vectorFromTo 
        (uav_1 selectionPosition "PiP0_dir");
    cam_1 setVectorDirAndUp [
        _dir_1, 
        _dir_1 vectorCrossProduct [-(_dir_1 select 1), _dir_1 select 0, 0]
    ];

    _dir_2 = 
        (uav_2 selectionPosition "PiP0_pos") 
            vectorFromTo 
        (uav_2 selectionPosition "PiP0_dir");
    cam_2 setVectorDirAndUp [
        _dir_2, 
        _dir_2 vectorCrossProduct [-(_dir_2 select 1), _dir_2 select 0, 0]
    ];

    _dir_3 = 
        (uav_3 selectionPosition "PiP0_pos") 
            vectorFromTo 
        (uav_3 selectionPosition "PiP0_dir");
    cam_3 setVectorDirAndUp [
        _dir_3, 
        _dir_3 vectorCrossProduct [-(_dir_3 select 1), _dir_3 select 0, 0]
    ];
}];