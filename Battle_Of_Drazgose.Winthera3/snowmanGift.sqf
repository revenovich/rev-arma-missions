[_this#0, { 
	_this addAction ["<t color='#FF0000'>Lovely snowman want a hug &lt;3</t>", {  
		params ["_target", "_caller", "_actionId", "_arguments"];  
		deleteVehicle _target;
		_box = "LIB_AmmoCrate_Arty_SU" createVehicle (position _target);
		_box setMaxLoad 9999;
		clearItemCargoGlobal _box;
		sleep 1;
		_box addItemCargoGlobal ["LIB_PzFaust_30m", 10];
	}, nil, 1.5, true, true, "", "true", 5];
}] remoteExec ['call', 0 , _this#0]