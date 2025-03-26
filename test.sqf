[_this, {
	_this allowDamage false;
	{
		_x allowDamage false
	} forEach crew _this;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _this];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;

	deleteVehicleCrew _this;
	deleteVehicle _this;
}] remoteExec ['call', 0, _this]

[_this, {
	_this allowDamage false;
	{
		_x allowDamage false
	} forEach crew _this;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _this];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0, _this]

[_this, {
	[_this, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0, _this]

[_this, {
	private _position = getPosASL _this;
	private _truePosition = [_position#0, _position#1, 1];
	private _dir = getDir _this;
	deleteVehicle _this;
	private _veh = createVehicle ["I_MRAP_03_hmg_F", _truePosition, [], 0, "CAN_COLLIDE"];
	_veh setDir _dir;
	_veh allowDamage false;
	_veh setVehicleLock "LOCKED";
	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _veh];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0, _this]

[] spawn
{
	while { true } do {
		s1 playMove "AmovPercMrunSlowWrflDf";
	};
};

[] spawn
{
	sleep 10;
	mb1D enableAI "Move";
	doGetOut mb1D;
	doGetOut mb1C;

	grp1 addWaypoint [getPosASL wp1, 0];
};

DistanceToReach = 300;
this addAction
[
	"Turn Off",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target animateSource ["switchposition", 1];
		_target animateSource ["light", 0];
		_target setDamage 1;
	},
	[],
	1.5,
	true,
	true,
	"",
	"alive _target",
	3,
	false,
	"",
	""
];

this animateSource ["switchposition", 1];
this animateSource ["light", 0];
this setDamage 1;

isPowerOn = false;
publicVariable "isPowerOn";

["setUnitSide.sqf"] remoteExec ["call", -2, true]

if (isPowerOn) then {
	["scriptStartExperiment.sqf"] remoteExec ["execVM", 0, true];
	deleteVehicle trigStartExperiment;
}

[independent, "destroyPole", ["Destroy transmitter pole to reestablish with HQ", "Destroy transmitter", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;

[independent, "ambush", ["Fight back the ambush and figure out who done it", "Fight back the ambush", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
["ambush", "SUCCEEDED"] call BIS_fnc_taskSetState;

[independent, "passCk", ["Try to pass checkpoint and move into NU controlled zone", "Pass checkpoint", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
["passCk", "SUCCEEDED"] call BIS_fnc_taskSetState;

[sci1, "lalalala"] remoteExec ["sideChat", 0];
[sci10, "AH BLYAT, equipment error snow storm in 1 minutes"] remoteExec ["sideChat", 0];
[sci10, "Snow storm will last in 1 minute"] remoteExec ["sideChat", 0];
[sci10, "Snow storm over, next one may be in 34 minute"] remoteExec ["sideChat", 0];

[Nik, "Charge completed, ready guys"] remoteExec ["sideChat", 0];

[radioMan_1, "Jammed Messages: Recon team report!"] remoteExec ["sideChat", 0];
[_this, "SIT_U1", "ASIS"] call BIS_fnc_ambientAnim;
[_this, "SIT_U1", "LIGHT"] call BIS_fnc_ambientAnim;
[_this, "LEAN_ON_TABLE", "LIGHT"] call BIS_fnc_ambientAnim;
[_this, "WATCH2", "ASIS"] call BIS_fnc_ambientAnim;
[_this, "GUARD", "ASIS"] call BIS_fnc_ambientAnim;

while { true } do {
	_this engineOn true;
}

["experimentRunning.sqf"] remoteExec ["execVM", 0, true];

[[_this, 5, 7, 10], "randomTeleport.sqf"] remoteExec ["execVM", 0, false];

// Infinity ammo
this addEventHandler ["Fired", {
	(_this select 0) setVehicleAmmo 1
}]

missionNamespace setVariable ["1_labTotalTimeToCharge", 12, true];

// Infinity ammo with fast reload
_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_unit setWeaponReloadingTime [_gunner, _muzzle, 0.1];
	_unit setVehicleAmmo 1;
}];

_this removeAllEventHandlers "Fired";

[] spawn {
	sleep 5;
	[truck_1, 1] spawn rhs_fnc_ss21_AI_prepare;
	sleep 3;
	[truck_2, 1] spawn rhs_fnc_ss21_AI_prepare;
	sleep 5;
	[truck_1, getPosATL missile_target_1] spawn rhs_fnc_ss21_AI_launch;
	sleep 5;
	[truck_2, getPosATL missile_target_2] spawn rhs_fnc_ss21_AI_launch;
}

{
	if (side _x isEqualTo west) then {
		deleteGroup group _x;
	}
} forEach allGroups;

(unitBackpack player) setMaxLoad 999999999999;

[_this] spawn {
	while { true } do {
		sleep 1;
		_this#0 setFuel 1;
	};
};

[_this] spawn {
	while { true } do {
		sleep 10;
		_this#0 setVehicleAmmo 1;
	};
};

[this] spawn {
	if (isServer) then {
		waitUntil {
			missionNameSpace getVariable ["initDone", false]
		};
		[2, _this#0] spawn OFT_fnc_gearBox;
	};
};

[this] spawn {
	if (isServer) then {
		waitUntil {
			missionNameSpace getVariable ["initDone", false]
		};
		["addRespawnVehicle", ""] spawn OFT_fnc_respawnVehicles;
	};
};

[_this, "mi8"] spawn {
	var = call compile format ["%1", _this#1];
	var = (_this#0);
	hint format ["%1", var];
	publicVariable (format ["%1", var]);
	["addRespawnVehicle", (format ["%1", var]), "Mi-8 Spawn Heli"] spawn OFT_fnc_respawnVehicles;
};

["test", _this] spawn {
	missionNamespace setVariable [_this#0, _this#1, true];
	["addRespawnVehicle", _this#0, "Mi-8 Spawn Heli"] spawn OFT_fnc_respawnVehicles;
};

[] spawn {
	{
		// Current result is saved in variable _x
		hint format ["%1", markerText _x];
		sleep 4;
	} forEach allMapMarkers;
};

["createMarkerToFollowVehicle", "UH-60 Mobile Heli Spawn", "b_air", _this] call OFT_fnc_respawnHandle;

[_this] spawn {
	_veh = _this#0;
	while { alive _veh } do {
		_veh setFuel 1;
		sleep 120;
	};
};

_this onMapSingleClick {
	params ["_this", "_pos", "_units", "_shift", "_alt"];

	_unitSide = toUpper (missionNamespace getVariable "playerSideVar");
	_varName = format ["allRespawnMarkers%1", _unitSide];

	_nearestMarker = [missionNamespace getVariable _varName, _pos] call BIS_fnc_nearestPosition;

	systemChat format ["Nearest marker is %1", _nearestMarker];

	if (_pos distance (getMarkerPos _nearestMarker) > 10) exitWith {
		systemChat "You clicked too far from the nearest marker";
	};

	_nearestMarkerVar = format ["%1_followVehicle", _nearestMarker];
	_vehicle = missionNamespace getVariable [_nearestMarkerVar, objNull];

	_currentVeh = vehicle _this;
	if (!isNull _currentVeh) then {
		moveOut _this;
	};

	if (!isNull _vehicle) then {
		[_this, _vehicle] spawn {
			_vehicle = _this#1;
			sleep 0.5;
			["movePlayerInSpawnVics", _this#0, _vehicle] call OFT_fnc_respawnHandle;
		};
	};
};

[this] execVM "mission_functions\initHQTruck.sqf";
[this] execVM "mission_functions\initInfTruck.sqf";

[3, _this] call OFT_fnc_gearBox;

[this] execVM "mission_functions\initHQTruck.sqf";
[this] execVM "mission_functions\initInfTruck.sqf";

[3, _this] call OFT_fnc_gearBox;

_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_unit setWeaponReloadingTime [_gunner, _muzzle, 0.1];
	_unit setVehicleAmmo 1;
}];

this forceFlagTexture "textures\vietnam-flag.jpg";

[true] execVM "missions\shockwave.sqf";

[] spawn {
	_allCivUnits = allUnits select {
		side _x isEqualTo sideEmpty
	};

	while { true } do {
		{
			if (!alive _x) then {
				deleteVehicle _x;
			};
		} forEach _allCivUnits;

		sleep 10;
	};
};

[] spawn {
	while { true } do {
		{
			if (side _x isEqualTo civilian) then {
				if (["zombie", str (typeOf _x)] call BIS_fnc_inString) then {
					deleteVehicle _x;
				};
			};
		} forEach allMissionObjects "Land";
		sleep 10;
	};
};

[] spawn {
	hint format ["Server fps: %1", diag_fps];
	diag_log format ["Server fps: %1", diag_fps];

	sleep 5;

	hint "";
};

[] spawn {
	while { true } do {
		hint format ["Server fps: %1", diag_fps];
		diag_log format ["Server fps: %1", diag_fps];

		sleep 5;

		hint "";
	};
};

[3, this] call OFT_fnc_fortificationBox;

[this] execVM "mission_functions\initHQTruck.sqf";
[this] spawn {
	if (isServer) then {
		waitUntil {
			missionNameSpace getVariable ["initDone", false]
		};
		[2, _this#0, 10] spawn OFT_fnc_gearBox;
		[3, _this#0] call OFT_fnc_fortificationBox;
	};
};

// get count of all opfor units
_opforUnits = allUnits select {
	side _x isEqualTo east
};
count _opforUnits;

[_this, oft_t_1 , 10, 5] spawn {
	params ["_arty", "_fireTarget", "_delayBtwShots", "_delayStart"];
	_arty addEventHandler ["Fired", {params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];_unit setVehicleAmmo 1;}];
	for "_i" from 1 to _delayStart do {sleep 1;};
	while { alive _arty } do {_targetPos = getPosATL _fireTarget;_ammoType = getArtilleryAmmo [_arty] select 0;_numRounds = 1;_arty doArtilleryFire [_targetPos, _ammoType, _numRounds];sleep _delayBtwShots;};
};

[this] execVM "mission_functions\heliHandle.sqf";

_crews = fullCrew this;
{
	_x disableAI "MOVE";
} forEach _crews;

["teleportArsenal", [main_arsenal_5, main_arsenal_6, main_arsenal_7, main_arsenal_8], [oft_pad_teleport_des_1,oft_pad_teleport_des_2,oft_pad_teleport_des_3,oft_pad_teleport_des_4]] call OFT_fnc_teleportThings;

playSound3D [getMissionPath _soundFile, _laptop1, _isInside, getPosASL _laptop1, _volume, _pitch, _range];

playSound3D [getMissionPath "files\wolf-howl-main.ogg", _this, false, getPosASL _this, 1, 1, 100];

_path = getMissionPath "files\wolf-howl-main.ogg";
_dist = 2000;
playSound3D [_path, _this, false, getPosASL _this, 5, 1, _dist];
playSound3D [_path, _this, false, getPosASL _this, 5, 1, _dist];

_this addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	[format ["%1 was hit by %2 with %3 cause %4 damage", _unit, _instigator, _source, _damage]] remoteExec ["systemChat", 0];
	["ace_medical_treatment_fullHealLocal", _unit, _unit] call CBA_fnc_targetEvent;
	_unit setDamage 0;
}];

[_this] spawn {
	sleep 3;
	_this#0 setVariable ["totalDamage", 0, true];
	_this#0 setVariable ["oft_maxDamage", 20000, true];
	_this#0 removeAllEventHandlers "HandleDamage";
	_handleDamageEvent = _this#0 addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
		if (!(alive _unit)) exitWith {
			_unit removeEventHandler ["HandleDamage", _unit getVariable "handleDamageHandler"];
		};

		_totalDamage = _unit getVariable ["totalDamage", 0];
		_addDamage = _totalDamage + _damage;

		[format ["Shield: %1/%2", (_unit getVariable ["oft_maxDamage", 20000]) - _addDamage, (_unit getVariable ["oft_maxDamage", 20000])]] remoteExec ["hintSilent", [0, -2] select isDedicated];

		if (_addDamage >= (_unit getVariable ["oft_maxDamage", 20000])) then {
			[_unit] spawn {
				_unit = _this#0;
				[format ["Shield: 0/%1", (_unit getVariable ["oft_maxDamage", 20000])]] remoteExec ["hintSilent", [0, -2] select isDedicated];
				sleep 5;
				[""] remoteExec ["hintSilent", [0, -2] select isDedicated];
			};
			_unit setDamage 1;
		};
		_unit setVariable ["totalDamage", _addDamage, true];
		["ace_medical_treatment_fullHealLocal", _unit, _unit] call CBA_fnc_targetEvent;
		0
	}];
	_this#0 setVariable ["handleDamageHandler", _handleDamageEvent, true];
};


[west, "getIntel", ["A conversation between officers saying that they need to move their troops to Helbotn to protect the head scientist and help him find somethings", "Intel Got", "cookiemarker"], objNull, "ASSIGNED", 1, true] call BIS_fnc_taskCreate;
["getIntel", "SUCCEEDED"] call BIS_fnc_taskSetState;

_isGroupHaveUnit = [];
{
	_isGroupHaveUnit pushBack (count units _x > 0);
} forEach allGroups;
hint str _isGroupHaveUnit;

_emptyGroups = [];
{
	if (count units _x isEqualTo 0) then {
		_emptyGroups pushBack _x;
	};
} forEach allGroups;

{
	deleteGroup _x;
} forEach _emptyGroups;

_path = getMissionPath "files\zombie-moan.ogg"; 
_dist = 400; 
playSound3D [_path, _this, false, getPosASL _this, 5, 1, _dist]; 
playSound3D [_path, _this, false, getPosASL _this, 5, 1, _dist];

_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_unit setAmmo [primaryWeapon _unit, 1];
}];

[["<t color='#ffffff' size='3'>I HEAR YOU</t><br/><t color='#ffffff' size='3'>MY CHILDREN</t>", "PLAIN", -1, true, true]] remoteExec ["cutText", [0,-2] select isDedicated];

cutText ["<t color='#ffffff' size='1'>20:20 brief nha mn</t>", "PLAIN", -1, true, true];

_path = getMissionPath "files\zombie-screaming.ogg"; 
_dist = 1000; 
playSound3D [_path, _this, false, getPosASL _this, 5, 1, _dist]; 
playSound3D [_path, _this, false, getPosASL _this, 5, 1, _dist];

_test = [];
_test1 = player getVariable ['carryingFlag', false];
_test pushBack _test1;
_test2 = !(player getVariable ['isDeployingFlag', false]);
_test pushBack _test2;
_test;