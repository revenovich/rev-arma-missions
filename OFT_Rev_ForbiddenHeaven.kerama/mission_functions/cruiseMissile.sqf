fn_cruiseMissile = {
	params ["_object", "_target", "_spawnZoffset", "_optionalSpeed", "_optionalAmmoType"];

	if (isNil "_optionalSpeed") then {
		_optionalSpeed = 450;
	};

	if (_optionalSpeed <= 0) then {
		_optionalSpeed = 450;
	};

	if (isNil "_optionalAmmoType") then {
		_optionalAmmoType = "ammo_Missile_Cruise_01";
	};

	if (_optionalAmmoType == "") then {
		_optionalAmmoType = "ammo_Missile_Cruise_01";
	};

	private _spawnASL = (getPosASL _object) vectorAdd [0,0,_spawnZoffset];

	private _targetPos = getPosASL _target;

	private _dir = vectorNormalized (_targetPos vectorDiff _spawnASL);

	private _ammo = _optionalAmmoType;
	private _m = createVehicle [_ammo, _spawnASL, [], 0, "CAN_COLLIDE"];

	_m setVectorDirAndUp [_dir, [0,0,1]];
	_m setVelocity (_dir vectorMultiply _optionalSpeed);

	_m setMissileTarget [_target, true];
};

publicVariable "fn_cruiseMissile";