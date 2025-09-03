fn_teleportThing = {
	params ["_targetObject", "_destinationTarget", "_positionAdd"];

	// Set not allow damage on player to prevent got killed by lightning
	_targetObject allowDamage false;

	private _position = getPosATL _destinationTarget;

	if (!(_positionAdd isEqualTo [])) then {
		_positionX = (_position#0) + (_positionAdd#0);
		_positionY = (_position#1) + (_positionAdd#1);
		_positionZ = (_position#2) + (_positionAdd#2);
		_position = [_positionX, _positionY, _positionZ];
	};

	// Check if _targetObject is a vehicle and have units inside
	if (_targetObject isKindOf "LandVehicle" || _targetObject isKindOf "Air" || _targetObject isKindOf "Ship") then {
		if (count (crew _targetObject) > 0) then {
			{
				private _crewUnit = _x;
				[_crewUnit] spawn {
					params ["_crewUnit"];
					// Set not allow damage on crew unit to prevent got killed by lightning
					_crewUnit allowDamage false;
					sleep 2;
					_crewUnit allowDamage true;
				};
			} forEach crew _targetObject;
		};
	};

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", _position];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;

	_targetObject setPosATL _position;
	[_targetObject] spawn {
		params ["_targetObject"];
		sleep 2;
		_targetObject allowDamage true;
	};
};

publicVariable "fn_teleportThing";

fn_teleportGroup = {
	params ["_group", "_destinationTarget"];

	private _increamentX = 0;
	private _increamentY = 0;
	private _increamentZ = 0;

	{
		private _unit = _x;
		private _positionX = _increamentX;
		private _positionY = _increamentY;
		private _positionZ = _increamentZ;
		private _positionAdd = [_positionX, _positionY, _positionZ];
		_increamentX = _increamentX + random [1, 3, 5];
		_increamentY = _increamentY + random [1, 3, 5];
		[_unit, _destinationTarget, _positionAdd] call fn_teleportThing;
	} forEach units _group;
};

publicVariable "fn_teleportGroup";

fn_oft_teleport = {
	params ["_type",  "_targetObject", "_destinationObject"];

	switch (_type) do {
		case "teleportThings": {
			[_targetObject, _destinationObject, []] call fn_teleportThing;
		};
		case "teleportGroup": {
			[_targetObject, _destinationObject] call fn_teleportGroup;
		};
		default {
			diag_log format ["fn_oft_teleport: Unknown type '%1'", _type];
		};
	};
};

publicVariable "fn_oft_teleport";