_pTestArray = [];
_pTestArray2 = [];
{
	// Current result is saved in variable _x
	_pTempTestObj = typeOf(_x);
	_pTestArray pushBack _pTempTestObj;
} forEach nearestObjects [p_1, [], 150];

{
	// Current result is saved in variable _x
	_pStrX = str _x;
	if ((["smoke", _pStrX] call BIS_fnc_inString) && (["red", _pStrX] call BIS_fnc_inString)) then {
		_pTempTestObj = _x;
		_pTestArray2 pushBack _pTempTestObj;
	};
} forEach _pTestArray;
_pTestArray2;

_this addEventHandler ["EnemyDetected", { 
   	params ["_group", "_newTarget"];
	_ptoCall = random [1, 10, 20];
	hint str _ptoCall;
	if (_ptoCall < 11) then {

		_pEnemyPos1 = getPos ((units _newTarget)#0);
		_pXspread1 = random [-100, 0, 80];
		_pYspread1 = random [-100, 0, 80];
		_pNewPos1 = [_pEnemyPos1#0 + _pXspread1, _pEnemyPos1#1 + _pYspread1, _pEnemyPos1#2];

		_pEnemyPos2 = getPos ((units _newTarget)#0);
		_pXspread2 = random [-80, 0, 50];
		_pYspread2 = random [-80, 0, 70];
		_pNewPos2 = [_pEnemyPos2#0 + _pXspread2, _pEnemyPos2#1 + _pYspread2, _pEnemyPos2#2];

		_pEnemyPos3 = getPos ((units _newTarget)#0);
		_pXspread3 = random [-80, 0, 90];
		_pYspread3 = random [-120, 0, 80];
		_pNewPos3 = [_pEnemyPos3#0 + _pXspread3, _pEnemyPos3#1 + _pYspread3, _pEnemyPos3#2];

		_pEnemyPos4 = getPos ((units _newTarget)#0);
		_pXspread4 = random [-60, 0, 80];
		_pYspread4 = random [-80, 0, 50];
		_pNewPos4 = [_pEnemyPos4#0 + _pXspread4, _pEnemyPos4#1 + _pYspread4, _pEnemyPos4#2];

		_pEnemyPos5 = getPos ((units _newTarget)#0);
		_pXspread5 = random [-80, 0, 80];
		_pYspread5 = random [-80, 0, 80];
		_pNewPos5 = [_pEnemyPos5#0 + _pXspread5, _pEnemyPos5#1 + _pYspread5, _pEnemyPos5#2];

		mortar_1 doArtilleryFire [_pNewPos1, "rhs_12Rnd_m821_HE", 1];
		mortar_2 doArtilleryFire [_pNewPos2, "rhs_12Rnd_m821_HE", 1];
		mortar_3 doArtilleryFire [_pNewPos3, "rhs_12Rnd_m821_HE", 1];
		mortar_4 doArtilleryFire [_pNewPos4, "rhs_12Rnd_m821_HE", 1];
		mortar_5 doArtilleryFire [_pNewPos5, "rhs_12Rnd_m821_HE", 1];
	};
}];


_this addEventHandler ["EnemyDetected", { 
   	params ["_group", "_newTarget"];
	gTarget = _group;
	publicVariable "gTarget";
}];

[_this, "Sh_82mm_AMOS", 100, 24, 10, {false}, 0, 250, 1000] spawn BIS_fnc_fireSupportVirtual;
"RHS_mag_m1_he_12"

gArtillery doArtilleryFire [gTestMarkerPos, "RHS_mag_m1_he_12", 3];