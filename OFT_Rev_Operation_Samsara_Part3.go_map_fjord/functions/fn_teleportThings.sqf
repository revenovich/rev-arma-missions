fn_teleportThing = {
	params ["_targetObject", "_destinationTarget"];

	// Set not allow damage on player to prevent got killed by lightning
	_targetObject allowDamage false;

	private _position = getPosASL _destinationTarget;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", _position];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;

	_targetObject setPosASL _position;
	[_targetObject] spawn {
		params ["_targetObject"];
		sleep 2;
		_targetObject allowDamage true;
	};
};

if (!isServer) exitWith {};

params ["_request", "_targetObject", "_destinationObject"];

switch (_request) do {
	case "init": {
		systemChat "Teleport script init";
		diag_log "Teleport script init";
	};

	case "teleport": {
		[_targetObject, _destinationObject] call fn_teleportThing;
	};
};