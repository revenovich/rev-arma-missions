params ["_thisList", "_thisTrigger"];

_is_player_detected = false;
_detected_player = null;
{
	// Current result is saved in variable _x
	if ((isPlayer _x) && (alive _x)) exitWith {
		_is_player_detected = true;
		_detected_player = _x;
	};
} forEach _thisList;

_teleportPos = getPos altar_teleport_1;

_isPlayerInVehicle = vehicle _detected_player != _detected_player;

if (_is_player_detected) then {
	if (_isPlayerInVehicle) then {
		_vehicle = vehicle _detected_player;
		_vehicle setVehiclePosition [altar_teleport_1, [], 50, "NONE"];
	} else {
		_detected_player setVehiclePosition [altar_teleport_1, [], 50, "NONE"];
	};
};