params ["_thisList", "_thisTrigger", "_target", "_placementDiameter"];

if (isNil "_placementDiameter") then {
	_placementDiameter = 0;
};

_is_player_detected = false;
_detected_player = null;
{
	// Current result is saved in variable _x
	if ((isPlayer _x) && (alive _x)) exitWith {
		_is_player_detected = true;
		_detected_player = _x;
	};
} forEach _thisList;

_teleportPos = getPos _target;

_isPlayerInVehicle = vehicle _detected_player != _detected_player;

if (_is_player_detected) then {
	if (_isPlayerInVehicle) then {
		_vehicle = vehicle _detected_player;
		_vehicle setVehiclePosition [_target, [], _placementDiameter, "NONE"];
	} else {
		_detected_player setVehiclePosition [_target, [], _placementDiameter, "NONE"];
	};
};