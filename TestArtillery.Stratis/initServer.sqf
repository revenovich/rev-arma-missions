missionNamespace setVariable ["oft_serverInit", false, true];

oft_fn_handleArtil = {
	params ["_unit"];

	systemChat "Init artillery";

	_unit setVehicleAmmo 0;
	_unit removeAllMagazinesTurret [];

	[
		_unit,
		"Reload",
		"\a3\ui_f\data\igui\cfg\actions\reload_ca.paa",
		"\a3\ui_f\data\igui\cfg\actions\reload_ca.paa",
		"vehicle _this != _target",
		"true",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
		},
		{ },
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			private _magClass = "vn_cannon_m101_mag_he_x8";
			private _turretPath = [0];

			private _currentMag = _target magazinesTurret [_turretPath, true];
			if (count _currentMag < 1) then {
				_target addMagazineTurret [_magClass, _turretPath, 1];
			} else {
				_magClass = _currentMag#0;
				private _currentAmmo = _target magazineTurretAmmo [_magClass, _turretPath];
				private _newAmmo = _currentAmmo + 1;

				_target setMagazineTurretAmmo [_magClass, _newAmmo, _turretPath];
			};

		},
		{ },
		[], 1, nil, false, false
	] call BIS_fnc_holdActionAdd;
};

publicVariable "oft_fn_handleArtil";

missionNamespace setVariable ["oft_serverInit", true, true];