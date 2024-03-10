randomMin = 0.5;
randomMid = 0.75;
randomMax = 1;

numTarget = -2;

// Function to execute random strike position
fn_executeRandomStrikePos = {
	params ["_randomStrikePos"];

	_tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _randomStrikePos];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
};

[Nik, "I'm starting the teleportation device..."] remoteExec ["sideChat", 0];
sleep 2;
[Nik, "Starting..."] remoteExec ["sideChat", 0];
sleep 2;
[Nik, "Started"] remoteExec ["sideChat", 0];

sleep random [10, 25, 30];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];


[Nik, "Get ready for the teleportation..."] remoteExec ["sideChat", 0];
sleep 2;
[Nik, "It may hurt like last time..."] remoteExec ["sideChat", 0];
sleep random [5, 10, 15];


_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [randomMin, randomMid, randomMax];


[Nik, "Here we go..."] remoteExec ["sideChat", 0];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep random [5, 10, 15];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
[Nik, "3..."] remoteExec ["sideChat", 0];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep 1;


_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep 1;

[Nik, "2..."] remoteExec ["sideChat", 0];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep 1;
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
[Nik, "1..."] remoteExec ["sideChat", 0];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep 1;
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep 1;
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
sleep 1;

// Get all players
_allPlayers = allPlayers;

// Strike all players
{
	// Get player
	_player = _x;

	// Strike player
	[[_player], fn_executeRandomStrikePos] remoteExec ['call', numTarget, true];
} forEach _allPlayers;