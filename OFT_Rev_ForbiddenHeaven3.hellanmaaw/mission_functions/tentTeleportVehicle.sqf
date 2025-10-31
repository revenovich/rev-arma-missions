params ["_thisList", "_thisTrigger", "_target"];

_is_player_detected = false;
_detected_player = null;
{
	// Current result is saved in variable _x
	if ((isPlayer _x) && (alive _x)) exitWith {
		_is_player_detected = true;
		_detected_player = _x;
	};
} forEach _thisList;

_isPlayerInVehicle = vehicle _detected_player != _detected_player;

if (_is_player_detected) then {
	if (_isPlayerInVehicle) then {
		moveOut _detected_player;
		_detected_player moveInAny _target;
	} else {
		_detected_player moveInAny _target;
	};
};