[_this#0, { 
	_this addAction ["<t color='#FF0000'>Lovely snowman want a hug &lt;3</t>", {  
		params ["_target", "_caller", "_actionId", "_arguments"];  
		deleteVehicle _target;
		_position = position _target;
		sleep 1;
		_box = createVehicle ["LIB_AmmoCrate_Arty_SU", _position, [], 0, "CAN_COLLIDE"];
		_box setMaxLoad 9999;
		clearItemCargoGlobal _box;
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		_box addItemCargoGlobal ["LIB_PzFaust_30m", 10];
	}, nil, 1.5, true, true, "", "true", 1];
}] remoteExec ['call', 0 , _this#0]