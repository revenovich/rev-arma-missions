params ["_unit", "_index"];

if (isNil "_unit") exitWith {};

switch (_index) do {
	case 0: { 
		_heli = vehicle _unit;
		_heli flyInHeight [0, true];
		_heli engineOn false;
		_crews = fullCrew _heli;
		{
			_x#0 disableAI "MOVE";
		} forEach _crews;
		_heli setVariable ["heliMoving", false, true];
	};
	default { };
};