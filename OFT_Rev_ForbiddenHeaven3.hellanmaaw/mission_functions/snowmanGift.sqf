[[_this#0, _this#1], { 
	_this#0 addAction ["<t color='#FF0000'>Lovely snowman want a hug &lt;3</t>", {  
		params ["_target", "_caller", "_actionId", "_arguments"];  
		deleteVehicle _target;
		_position = position _target;
		sleep 1;
		_box = createVehicle ["Box_NATO_WpsLaunch_F", _position, [], 0, "CAN_COLLIDE"];
		_box setMaxLoad 9999;
		clearItemCargoGlobal _box;
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		clearBackpackCargoGlobal _box;
		if (_arguments#1 == true) then {
			_box addItemCargoGlobal ["HLC_wp_M134Painless", 1];
			_box addItemCargoGlobal ["hlc_500rnd_762x51_Belt", 2];
		} else {
			_box addItemCargoGlobal ["hlc_500rnd_762x51_Belt", 2];
		};
	}, [_this#0, _this#1], 1.5, true, true, "", "true", 2];
}] remoteExec ['call', [0,-2] select isDedicated];