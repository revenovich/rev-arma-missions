[_this, {
	_this allowDamage false;
	{ _x allowDamage false } forEach crew _this;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _this];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
	
	deleteVehicleCrew _this;
	deleteVehicle _this;
}] remoteExec ['call', 0 , _this]

[_this, {
	_this allowDamage false;
	{ _x allowDamage false } forEach crew _this;

	private _tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _this];
	[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0 , _this]