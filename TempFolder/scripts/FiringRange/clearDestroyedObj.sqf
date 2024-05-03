{
	// Current result is saved in variable _x
	if (_x isKindOf "Man" && !(isPlayer _x)) then {
		_pNearestObj = nearestObjects [_x, ["LandVehicle"], 50];
		{
			// Current result is saved in variable _x
			if (!(isNull _x)) then {	
				if (damage _x >= 0.3) then {
					_x call del_Fnc;
				};
			};
		} forEach _pNearestObj;
		sleep 5;
		deleteVehicle _x;
	};
} forEach _this#1;

del_Fnc = {
	params ["_toDelObj"];

	sleep 5;
	deleteVehicle _toDelObj;
}