
ambFireVirArti_Fnc = {
	params ["_pTarget"];
	while {true} do {
		[_pTarget, "Sh_155mm_AMOS", random [500, 1000, 1500], 5, 2, {false}, 0, 250, 10] spawn BIS_fnc_fireSupportVirtual;
		sleep (random [20, 40, 80]);
	};
};
publicVariable "ambFireVirArti_Fnc";

{
	// Current result is saved in variable _x
	[_x] remoteExec ['ambFireVirArti_Fnc'];
	
} forEach gArtiAmbVirArray;