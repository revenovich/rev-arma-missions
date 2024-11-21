fn_teleportArsenal = {
	params ["_arsenal", "_invisiblePad", "_isDelayed"];
	
	if (isNil "_isDelayed") then {
		_isDelayed = false;
	};

	private _position = getPosASL _invisiblePad;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", _position];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;

	_arsenal setPosASL _position;

	if (_isDelayed) then {
		private _newPos = [(_position select 0) + (random 10) - 5, (_position select 1) + (random 10) - 5, _position select 2];
		_invisiblePad setPosASL _newPos;
	};
};

fn_handleTargetArray = {
	params ["_targetArray", "_destinationObject", "_arrayDelay"];
	
	{
		[_x, _destinationObject, true] call fn_teleportArsenal;
		sleep _arrayDelay;
	} forEach _targetArray;
};

fn_handleTargetDestinationArray = {
	params ["_targetArray", "_destinationArray", "_arrayDelay"];
	
	{
		[_targetArray select _forEachIndex, _x] call fn_teleportArsenal;
		sleep _arrayDelay;
	} forEach _destinationArray;
};

if (!isServer) exitWith {};

params ["_request", "_targetObject", "_destinationObject", "_arrayDelay"];

if (isNil "_arrayDelay") then {
	_arrayDelay = 1;
};

switch (_request) do {
	case "init": {
		systemChat "Teleport script init";
	};

	case "teleportArsenal": {
		if (isNil "_targetObject" || isNil "_destinationObject") exitWith { systemChat "Teleport script: Missing parameters"; };
		// Check if the target object is an array
		if (typeName _targetObject == "ARRAY") then {
			if (typeName _destinationObject == "ARRAY") then {
				[_targetObject, _destinationObject, _arrayDelay] spawn fn_handleTargetDestinationArray;
			} else {
				[_targetObject, _destinationObject, _arrayDelay] spawn fn_handleTargetArray;
			};
		} else {
			[_targetObject, _destinationObject] call fn_teleportArsenal;
		};
	};
};