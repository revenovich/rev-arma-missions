gArtiAmbTargetPosArray = [];
publicVariable "gArtiAmbTargetPosArray";
{
	// Current result is saved in variable _x
	_pTempPos = getPos (_x);
	gArtiAmbTargetPosArray pushBack _pTempPos;
} forEach gArtiAmbTargetArray;

oneArtiAmbFire_Fnc = {
	params ["_toFiredArti", "_roundName"];
	while {true} do {
		_pRandomTargetPos = selectRandom gArtiAmbTargetPosArray;
		_toFiredArti doArtilleryFire [_pRandomTargetPos, _roundName, 1];
		sleep (random [20, 50, 80]);
	};
};
publicVariable "oneArtiAmbFire_Fnc";

{
	// Current result is saved in variable _x
	[_x, "RHS_mag_m1_he_12"] remoteExec ['oneArtiAmbFire_Fnc'];
	
} forEach gArtiAmbArray;