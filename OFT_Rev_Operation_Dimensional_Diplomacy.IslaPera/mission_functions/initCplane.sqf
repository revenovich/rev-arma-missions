if (!isServer) exitWith {};
[_this#0] spawn {
	waitUntil { missionNameSpace getVariable ["initDone", false] };

	_plane = _this#0;

	// Get all crew members
	_planeCrew = crew _plane;

	// Check if there are any crew members and if so, disable damage for each of them
	if ((count _planeCrew) > 0) then {
		{
			// Current result is saved in variable _x
			_x allowDamage false;

		} forEach _planeCrew;
	};

	// Disable damage for the plane itself
	_plane allowDamage false;

	// Clear plane inventory
	clearWeaponCargoGlobal _plane;
	clearItemCargoGlobal _plane;
	clearMagazineCargoGlobal _plane;
	clearBackpackCargoGlobal _plane;

	// Refuel the plane every 1 minute
	// Also add to plane inventory 100 parachutes
	[_plane] spawn {
		params ["_plane"];
		while {alive _plane} do {
			_plane setFuel 0.5;
			_plane addBackpackCargoGlobal ["B_Parachute", 100];
			sleep 60;
		};
	};

	// Lock pilot seat
	_plane lockDriver true;

	// Lock copilot seat
	_plane lockTurret [[0], true];

	// Group of the plane crew
	_planeCrewGroup = group (_planeCrew#0);

	// Set group name
	_planeCrewGroup setGroupIdGlobal ["C-130 crews"];

	// Set group speed to limited
	_planeCrewGroup setSpeedMode "LIMITED";

	// Set behaviour to safe
	_planeCrewGroup setBehaviourStrong "SAFE";

	// Set formation to column
	_planeCrewGroup setFormation "FILE";

	// Set plane flyInHeightASL
	_plane flyInHeightASL [100, 100, 100];

	// Set plane fly height to 1500 meters
	// Note: Plane can not be force change altitude
	_plane flyInHeight 1500;

	// Create spawn point attached to the plane
	["createMarkerToFollowVehicle", "C-130 Mobile Respawn", "b_plane", _plane] call OFT_fnc_respawnHandle;
};