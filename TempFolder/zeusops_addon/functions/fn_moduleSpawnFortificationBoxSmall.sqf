/*
	@file_name: fn_moduleSpawnFortificationBoxSmall.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

// Exit if module wasn't created by this instance
if (!local _logic) exitWith {};

_pos = position _logic;

// Find object
_object = _logic call zeusops_fnc_getUnitUnderCursor;

// Spawn small fortification box
if (isNull _object) then {
	// Spawn fortification box
	_object = createVehicle ["CargoNet_01_box_f", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir (round random 360);

	// Allow zeuses to move the fortification box
	[(getAssignedCuratorLogic player),[[_object],true]] remoteExec ["addCuratorEditableObjects", allCurators, true];

	[2, _object] spawn ZO_fnc_fortificationBox;
	"Spawned small fortification box" call zeusops_fnc_showCuratorMessage;
} else {
	// Make existing object a fortification box
	[2, _object] spawn ZO_fnc_fortificationBox;
	"Made object a small fortification box" call zeusops_fnc_showCuratorMessage;
};

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
