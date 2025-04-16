("OFT_Bg" call BIS_fnc_rscLayer) cutRsc ["black_screen", "PLAIN NOFADE", -1, false, false];
("OFT_ImageOverlay" call BIS_fnc_rscLayer) cutRsc ["wm_disp", "PLAIN NOFADE", -1, false, false];
playSound "oft_scream";
// ["oft_scream"] remoteExec ["playSound", [0, -2] select isDedicated];