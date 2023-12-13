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

[_this, {
	[_this, nil, true] spawn BIS_fnc_moduleLightning;
}] remoteExec ['call', 0 , _this]

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
}] remoteExec ['call', 0 , _this]


[] spawn 
{
	while {true} do {
		s1 playMove "AmovPercMrunSlowWrflDf";
	};
};