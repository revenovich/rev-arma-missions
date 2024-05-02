/*
	@file_name: fn_moduleMoveRespawnPosition.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

// Exit if module wasn't created by this instance
if (!local _logic) exitWith {};

_pos = getPosASL _logic;

// Find object
_object = _logic call zeusops_fnc_getUnitUnderCursor;

if (isNull _object) then {
	// Move spawn
	missionNameSpace setVariable ["RESPAWN_POSITION", _pos, true];
	"Moved Respawn position" call zeusops_fnc_showCuratorMessage;
} else {
	// Move spawn to object
	missionNameSpace setVariable ["RESPAWN_POSITION", getPosASL _object, true];
	"Moved Respawn position to object" call zeusops_fnc_showCuratorMessage;
};

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
