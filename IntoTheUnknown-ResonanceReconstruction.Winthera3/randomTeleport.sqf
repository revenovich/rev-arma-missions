entityToTele = _this#0;

sleepMax = 5;
sleepMid = 7;
sleepMin = 10;

// If there are _this#1, _this#2 and _this#3, use them as sleep values
if (count _this > 1) then {
	sleepMax = _this#3;
	sleepMid = _this#2;
	sleepMin = _this#1;
};

targetIndex = 0;

telePosList = [tele_1, tele_2, tele_3, tele_4, tele_5, tele_6, tele_7, tele_8];

// Select random position from list
telePos = selectRandom telePosList;

// Get ATL position of telePos
telePosATL = getPosATL telePos;

// Get ATL position of entityToTele
entityToTeleATL = getPosATL entityToTele;

// Function to execute strike
fn_executeRandomStrikePos = {
	params ["_strikePos"];

	_tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _strikePos];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
};

// Strike entityToTele
[[entityToTele], fn_executeRandomStrikePos] remoteExec ['call', targetIndex, false];

// Sleep 1 second
sleep 1;

// Teleport entityToTele to telePos
entityToTele setPosATL telePosATL;

// Sleep random from 5 to 10 seconds
sleep random [sleepMin, sleepMid, sleepMax];

// Strike telePos
[[entityToTele], fn_executeRandomStrikePos] remoteExec ['call', targetIndex, false];

// Sleep 1 second
sleep 1;

// Teleport entityToTele to entityToTeleATL
entityToTele setPosATL entityToTeleATL;

// Heal entityToTele
[entityToTele] call ace_medical_treatment_fnc_fullHealLocal;