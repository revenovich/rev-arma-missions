/*
	@file_name: fn_moduleSpawnRearmBox.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

// Exit if module wasn't created by this instance, or if it's not activated
if (!local _logic) exitWith {};

_pos = position _logic;

// Find object
_object = _logic call zeusops_fnc_getUnitUnderCursor;

// Spawn rearm box
if (isNull _object) then {
	// Spawn ammobox
	_object = createVehicle ["B_supplyCrate_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir (round random 360);

	// Allow zeuses to move the ammobox
	[(getAssignedCuratorLogic player),[[_object],true]] remoteExec ["addCuratorEditableObjects", allCurators, true];

	[3, _object] spawn ZO_fnc_gearBox;
	"Spawned rearm box" call zeusops_fnc_showCuratorMessage;
} else {
	// Make existing object an rearm box
	[3, _object] spawn ZO_fnc_gearBox;
	"Made object an rearm box" call zeusops_fnc_showCuratorMessage;
};

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
