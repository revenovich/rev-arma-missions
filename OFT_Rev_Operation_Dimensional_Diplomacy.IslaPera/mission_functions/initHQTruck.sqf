if (!isServer) exitWith {};

[_this#0] spawn {
	waitUntil { missionNameSpace getVariable ["initDone", false] };

	// Get the vehicle variable
	_veh = _this select 0;

	// Set vehicle no damage
	_veh allowDamage false;

	// Clear the vehicle inventory
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;

	// Create a spawn marker for the vehicle
	["createMarkerToFollowVehicle", "Mobile HQ", "b_hq", _veh, true] call OFT_fnc_respawnHandle;
};