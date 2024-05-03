//// Recruit Training Ground Box Refill Function

reFillBox_Fnc = {
	_pNumberOfLauncher = 100;
	params ["_toRefillBox"];
	{
		// Current result is saved in variable _x
		_toRefillBox addItemCargoGlobal [_x, _pNumberOfLauncher];
	} forEach gLauncherNameArray;
};
publicVariable "reFillBox_Fnc";

reFillGreBox_Fnc = {
	_pNumberOfGre = 100;
	params ["_toRefillBox"];
	{
		// Current result is saved in variable _x
		_toRefillBox addItemCargoGlobal [_x, _pNumberOfGre];
	} forEach gGreNameArray;
};
publicVariable "reFillGreBox_Fnc";

////

removeAllLoadout_Fnc = {
	params ["_bodyToBeRemove"];

	removeAllWeapons _bodyToBeRemove;

	removeGoggles _bodyToBeRemove;

	removeHeadgear _bodyToBeRemove;

	removeVest _bodyToBeRemove;

	removeUniform _bodyToBeRemove;

	removeAllAssignedItems _bodyToBeRemove;

	clearAllItemsFromBackpack _bodyToBeRemove;

	removeBackpack _bodyToBeRemove;
};
publicVariable "removeAllLoadout_Fnc";

removeMarkerOnMap_Fnc = {
	params ["_toRemoveMarker"];
	_pTempMarkersArray = gAllMarkersOnMap;
	{
		// Current result is saved in variable _x
		_pTempMarkersText = markerText _x;
		if ([_toRemoveMarker, _pTempMarkersText] call BIS_fnc_inString) then {
			deleteMarker _x;
		};
	} forEach _pTempMarkersArray;
};
publicVariable "removeMarkerOnMap_Fnc";