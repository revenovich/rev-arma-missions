oft_fn_findNearestAmmoBox = {
	params ["_unit"];

	private _nearestObjs = nearestObjects [_unit, [], 10];
	private _nearestAmmoBoxObj = objNull;
	{
		// Current result is saved in variable _x
		if ((str _x) find "oft_105_ammo" >= 0) exitWith {
			_nearestAmmoBoxObj = _x;
		};
	} forEach _nearestObjs;
	_unit setVariable ["ammoBoxObj", _nearestAmmoBoxObj, true];
	_nearestAmmoBoxObj
};

publicVariable "oft_fn_findNearestAmmoBox";

oft_fn_handleShowCondition = {
	params ["_unit", "_caller"];
	private _distance = _caller distance _unit;
	if (_distance > 5) exitWith {false};

	private _isCallerGunner = gunner _unit == _caller;
	if (_isCallerGunner) exitWith {false};

	if (_caller getVariable ["oftCutTextRun", false]) exitWith {false};
	private _currentAmmoInside = _target magazineTurretAmmo ["vn_cannon_m101_mag_he_x8", [0]];
	if (_currentAmmoInside > 0) exitWith {false}; 

	private _nearestAmmoBoxObj = [_unit] call oft_fn_findNearestAmmoBox;
	if (isNull _nearestAmmoBoxObj) exitWith {
		[_caller] spawn {
			params ['_caller'];
			private _isCutTextRun = _caller getVariable ["oftCutTextRun", false];
			if (!_isCutTextRun) then {
				[["<t color='#ffffff' size='1'>There is no ammo box in radius of 10</t>", "PLAIN", 0, true, true]] remoteExec ["cutText", _caller];
				_caller setVariable ["oftCutTextRun", true, true];
			};
		};

		[_caller] spawn {
			params ['_caller'];
			sleep 5;
			[["", "PLAIN", 0, true, true]] remoteExec ["cutText", _caller];
			_caller setVariable ["oftCutTextRun", false, true];
		};
		false
	};

	private _currentAmmo = _nearestAmmoBoxObj getVariable ["ammoCount", 0];

	if (_currentAmmo > 0) then {
		true
	} else {
		[_caller] spawn {
			params ['_caller'];
			private _isCutTextRun = _caller getVariable ["oftCutTextRun", false];
			if (!_isCutTextRun) then {
				[["<t color='#ffffff' size='1'>No shell left in nearest ammo box</t>", "PLAIN", -1, true, true]] remoteExec ["cutText", _caller];
				_caller setVariable ["oftCutTextRun", true, true];
			};
		};

		[_caller] spawn {
			params ['_caller'];
			sleep 5;
			[["", "PLAIN", 0, true, true]] remoteExec ["cutText", _caller];
			_caller setVariable ["oftCutTextRun", false, true];
		};
		false
	}
};

publicVariable "oft_fn_handleShowCondition";

oft_fn_handleArtil = {
	params ["_unit"];

	_unit setVehicleAmmo 0;

	[
		_unit,
		"Reload",
		"\a3\ui_f\data\igui\cfg\actions\reload_ca.paa",
		"\a3\ui_f\data\igui\cfg\actions\reload_ca.paa",
		'[_target, _this] call oft_fn_handleShowCondition;',
		"true",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
		},
		{ },
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			private _magClass = "vn_cannon_m101_mag_he_x8";
			private _turretPath = [0];

			private _ammoBoxObj = _target getVariable "ammoBoxObj";
			if (isNull _ammoBoxObj) exitWith {};
			private _ammoInAmmoBox = _ammoBoxObj getVariable "ammoCount";
			_ammoBoxObj setVariable ["ammoCount", _ammoInAmmoBox - 1, true];
			[[format ["<t color='#ffffff' size='1'>%1 shell(s) left in ammo box</t>", _ammoInAmmoBox - 1], "PLAIN", -1, true, true]] remoteExec ["cutText", _caller];
			_target setMagazineTurretAmmo [_magClass, 1, _turretPath];
		},
		{ },
		[], 0.5, nil, false, false
	] call BIS_fnc_holdActionAdd;
};

publicVariable "oft_fn_handleArtil";

oft_fn_handleAmmoBox = {
	params ['_unit', '_ammoCount'];

	private _ammoBoxArr = missionNamespace getVariable ["oftAmmoBoxArr", []];
	private _ammoBoxArrCount = count _ammoBoxArr;
	private _unitVarName = format ["oft_105_ammo_%1", (_ammoBoxArrCount + 1)];
	_unit setVehicleVarName _unitVarName;
	missionNamespace setVariable [_unitVarName, _unit, true];
	_ammoBoxArr pushBack _unitVarName;
	missionNamespace setVariable ["oftAmmoBoxArr", _ammoBoxArr, true];

	_unit setVariable ["ammoCount", _ammoCount, true];

	[
		_unit,
		"Get current ammo count",
		"\a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa",
		"\a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa",
		'(_this distance _target) < 3',
		"true",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
		},
		{ },
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			[[format ["<t color='#ffffff' size='1'>%1 shell(s) in ammo box</t>", _target getVariable "ammoCount"], "PLAIN", 0, true, true]] remoteExec ["cutText", _caller];
			[_caller] spawn {params ["_caller"]; sleep 4; [["", "PLAIN", 0, true, true]] remoteExec ["cutText", _caller];};
		},
		{ },
		[], 0.5, nil, false, false
	] call BIS_fnc_holdActionAdd;
};

publicVariable "oft_fn_handleAmmoBox";