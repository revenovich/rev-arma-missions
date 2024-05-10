if (!isServer) exitWith {};

[_this#0] spawn {
	waitUntil { missionNameSpace getVariable ["initDone", false] };

	// Get the vehicle variable
	_veh = _this select 0;

	// Set vehicle no damage
	_veh allowDamage false;

	// Check if the vehicle is the correct type
	if (!(_veh isEqualTo inf_truck_no_gun)) exitWith {};

	// Clear the vehicle inventory
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;

	// Create a spawn marker for the vehicle
	["createMarkerToFollowVehicle", "Infantry Truck", "b_mech_inf", _veh, false] call OFT_fnc_respawnHandle;
};