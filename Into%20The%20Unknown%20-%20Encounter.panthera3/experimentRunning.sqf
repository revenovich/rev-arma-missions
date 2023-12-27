loopTime = 60;
randomMin = 0.5;
randomMid = 0.75;
randomMax = 1;

// Function to execute random strike position
fn_executeRandomStrikePos = {
	params ["_randomStrikePos"];

	_tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _randomStrikePos];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
};

[sci3, "Starting..."] remoteExec ["sideChat", 0];
sleep 2;
[sci3, "Started"] remoteExec ["sideChat", 0];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [randomMin, randomMid, randomMax];

_hidePos = getPosATL hidePos_1;
_mainPos = getPosATL mainPos_1;

[[mainPos_1], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
experimentCar_1 setPosATL _hidePos;

[sci2, "Where is the car?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "I don't know, it was here a second ago..."] remoteExec ["sideChat", 0];
sleep 2;
[sci3, "I think it teleported somewhere..."] remoteExec ["sideChat", 0];
sleep 25;

[[mainPos_1], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
experimentCar_1 setPosATL _mainPos;

[sci1, "There it is!"] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "What the hell?"] remoteExec ["sideChat", 0];
sleep 2;
[sci3, "What wrong with it?"] remoteExec ["sideChat", 0];
sleep 4;
[sci1, "I don't know, the power seem to be off..."] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "What do you mean?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "I think it's overloaded..."] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "Can you reduce the power?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "I don't know, I'll try..."] remoteExec ["sideChat", 0];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [1, 2, 3];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [1, 2, 3];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [3, 4, 5];

_posVarArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
_randomStrikePos = selectRandom _posVarArray;
// Call the function remotely
[[_randomStrikePos], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
sleep random [2, 3, 4];

[[mainPos_1], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
experimentCar_1 setPosATL _hidePos;

[sci1, " it gone again!"] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "So it's teleporting randomly?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "I think so..."] remoteExec ["sideChat", 0];
sleep 2;
[sci3, "So weird, what are we going to do?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "I don't know, I'll try to reduce the power again..."] remoteExec ["sideChat", 0];
sleep 5;

[[mainPos_1], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
experimentCar_1 setPosATL _mainPos;

[sci1, "There it is!"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "Uh oh..."] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "What do you mean uh oh?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "The power is still too high..."] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "What do you mean?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "I think we should get out of here FAST!"] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "What?"] remoteExec ["sideChat", 0];
sleep 2;
[sci1, "Let's go!"] remoteExec ["sideChat", 0];
sleep 2;
[sci2, "Okay!"] remoteExec ["sideChat", 0];
[sci3, "Sure!"] remoteExec ["sideChat", 0];

sci1 enableAI "all";
sci2 enableAI "all";
sci3 enableAI "all";

sci1 switchMove "";
sci2 switchMove "";
sci3 switchMove "";

grp1Test addWaypoint [getPosATL sciWaypoint_1, 0];
grp2Test addWaypoint [getPosATL sciWaypoint_1, 0];
grp3Test addWaypoint [getPosATL sciWaypoint_1, 0];

sleep 20;

// Get all players
_allPlayers = allPlayers;

// Strike all players
{
	// Get player
	_player = _x;

	// Strike player
	[[_player], fn_executeRandomStrikePos] remoteExec ['call', -2, true];
} forEach _allPlayers;