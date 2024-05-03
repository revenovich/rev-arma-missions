gTestFnc = {
	hint "test";
};
publicVariable "gTestFnc";

// Filter string function
gFilterString_Fnc = {
	params ["_toFilterArrayOfString", "_toFilterString"];
	_tempFilteredArray = [];
	{
		// Current result is saved in variable _x
		if (([_toFilterString, _x] call BIS_fnc_inString)) then {
			_tempFilteredArray pushBack _x;
		};
	} forEach _toFilterArrayOfString;
	_tempFilteredArray;
};
publicVariable "gFilterString_Fnc";
