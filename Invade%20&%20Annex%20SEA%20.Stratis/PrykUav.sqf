/*
Script can be added to any vehicle or unit by putting:
"_null = this spawn {While {isNil "PrykUavInit"} do {sleep 2};  _this spawn PrykUavInit;}" in its init line.

Put " execVM "PrykUav.sqf" " in init.sqf
PrykUav.sqf is free to use and edit. Send me your enhacements or issues in a PM at forums.bistudio.com or olikow.pl
*/

//Private ["_uav","_delay","_range","_UavInSight","_UavGetInSight"];
PrykUav_delay = 5;  			//Check for new targets every x sec				
PrykUav_refreshrate = 1; 		//Refresh markers every x sec. Should be divisible by PrykUav_delay	
PrykUav_recogSide = true;		//False for not to color according to the side	
PrykUav_disappear = 300;		//Marker will disappear after x sec				
PrykUav_Scan = true;			//Look for new deployed Uavs?					
PrykUav_maxRange = 1000;		//Maximal range. Not higher than 6000.							

if (!isDedicated && (player != player)) then
{
    waitUntil {player == player};
    waitUntil {time > 10};
};

PrykUav_range = 1;
PrykUavInit = {
Private ["_Uav"];
_Uav = _this;
if (isNil "PrykUavFogLoop") then {PrykUavFogLoop = _Uav spawn PrykUavGetRange};
_uav setVariable ["UavInSight",[]];
_Uav spawn PrykUavPosition;
While {Alive _Uav && fuel _uav > 0.05} do
	{ _script = _Uav spawn PrykUavGetInSight;
	sleep PrykUav_delay;
	}	
};
		
PrykUavGetInSight = {
	Private ["_Uav","_UavInSight","_UavSide"];
	_Uav = _this;
	//_UavSide = side _Uav;
	_UavInSight = _Uav getVariable "UavInSight";
	{
		If ( !(lineintersects [aimpos _uav, getposASL _x, _uav, _x]) && !(terrainIntersectASL [getposASL _uav, getposASL _x]) && ((_uav distance _x) < PrykUav_range) && alive _x && vehicle _x == _x && !(_x isKindOf "Animal") && _x != _uav)
			then {
				If (!(_x in _UavInSight)) then {_UavInSight set [count _UavInSight, _x]};
				_x setVariable ["UavLastSeen", [time, _Uav]];}
	} foreach (_uav nearObjects ["AllVehicles", PrykUav_range]);		//if experiencing freezes try to change (_uav nearObjects ["AllVehicles", PrykUav_range]) to (Allunits + vehicles)
	_Uav setVariable ["UavInSight",_UavInSight]; 
	{
	If ((time -((_x getVariable "UavLastSeen")select 0)) <  PrykUav_delay) then{
	[_x,_Uav] spawn PrykUavMarker}} foreach _UavInSight //Deprecated since PvP update by PrykUavPlayer
};

PrykUavMarker = { If (side (_this select 1) == playerSide) then {
	Private ["_target","_marker","_timestamp","_UavInSight"];
	_target = (_this select 0);
	If (!(_target getVariable ["UavHasMarker",false])) then {

	_target setVariable ["UavHasMarker",true];
	_timestamp = ((_target getVariable "UavLastSeen")select 0);
	_UavInSight = (_this select 1) getVariable "UavInSight";
	// 0: obiekt 1: Uav
	_marker = createMarkerLocal [str _target + str random 1, position _target];
	/*if ((_this select 1)== _target) then {_isUav = true;
	_marker SetMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerSize [PrykUav_range,PrykUav_range]}*/
	if (vehicle _target isKindOf "Land" && !(vehicle _target isKindOf "Man")) then {
		_marker setMarkerShapeLocal "ICON";
		_marker setmarkertypeLocal "c_car";};
	if (vehicle _target isKindOf "Helicopter") then { 
		_marker setmarkershapeLocal "ICON";
		_marker setmarkertypeLocal "c_air";};
	if (vehicle _target isKindOf "Plane") then {
		_marker setmarkershapeLocal "ICON";
		_marker setmarkertypeLocal "c_plane";};
	if (vehicle _target isKindOf "Ship") then {
	_marker setmarkershapeLocal "ICON";
	_marker setmarkertypeLocal "c_ship";};
	_marker setMarkerColorLocal "ColorGreen";
	//if ( ((side _target) getfriend (side (_this select 1))) < 0.6 AND PrykUav_recogSide) then {_marker setMarkerColorLocal "ColorRed"} else {_marker setmarkersizeLocal [0.75,0.75]};
	if (!(PrykUav_recogSide)) then {_marker setMarkerColorLocal "ColorOrange";};
	if (_target isKindOf "Man") then {
		_marker setmarkershapeLocal "ICON";
		_marker setmarkertypeLocal "mil_triangle_noShadow";
		_marker setMarkerSizeLocal [0.5,0.7]};
	
While {(_target in _UavInSight) AND (time - _timestamp) < PrykUav_disappear} 
	do{
	While {(_target in _UavInSight) AND ((time - _timestamp) < PrykUav_delay)} 
		do{
		sleep PrykUav_refreshrate;
			/*if ( ((side _target) getfriend (side (_this select 1))) < 0.6 AND PrykUav_recogSide) then {_marker setMarkerColorLocal "ColorRed"}
			else {_marker setmarkersizeLocal [0.5,0.5];if (!(PrykUav_recogSide)) then {_marker setMarkerColorLocal "ColorOrange";};};*/
		If (PrykUav_recogSide) then {
			switch (side _target) do {
			case EAST:{_marker setMarkerColorLocal "colorEAST"};
			case West:{_marker setMarkerColorLocal "colorWEST"};
			case resistance:{_marker setMarkerColorLocal "colorGUER"};
			case civilian:{_marker setMarkerColorLocal "colorCIV"};
			default {_marker setMarkerColorLocal "colorUNKNOWN"};
			};
			};
		//if (_isUav) then {_marker setMarkerSize [PrykUav_range,PrykUav_range]}; 
		_marker setMarkerDirLocal (getDir _target);
		_marker setMarkerPosLocal (getPos _target);
		_timestamp = ((_target getVariable "UavLastSeen")select 0);
		_marker setMarkerAlphaLocal 1;};
	_marker setMarkerAlphaLocal ((-(time - _timestamp)+PrykUav_disappear)/PrykUav_disappear);
	_timestamp = ((_target getVariable "UavLastSeen")select 0);
	sleep PrykUav_refreshrate;};
	deleteMarkerLocal _marker;
	_target setVariable ["UavHasMarker",false];
	}
	}};
	
PrykUavGetRange={ While {true} do{
sleep PrykUav_refreshrate;				//lub sleep PrykUav_delay
Private ["_fog","_fogcalc"];
_fogcalc = 0;
_fog = fog;
If (_fog < 0.2 AND _fog >= 0) then { _fogcalc = -23000 * _fog + 6000};
If (_fog >= 0.2 AND _fog < 0.5) then { _fogcalc = -4000 * _fog + 2200};
If (_fog >= 0.5 ) then { _fogcalc = -400 * _fog + 400};
If (_fog < 0) then { _fogcalc = 6000};
If (_fogcalc > PrykUav_maxRange) then { _fogcalc = PrykUav_maxRange};
PrykUav_range = _fogcalc}};

PrykUavPosition = {
Private ["_uav","_marker"];
_uav = _this;
_marker = createMarkerLocal [str _uav + str random 1, position _uav];
_marker SetMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "Border";
if (((getPosATL _uav) select 2) > 2) then {_marker setMarkerAlphaLocal 0.5} else {_marker setMarkerAlphaLocal 0};
_marker setMarkerSizeLocal [PrykUav_range,PrykUav_range];
While {Alive _Uav && canMove _Uav} do {
	sleep PrykUav_refreshrate;
	_marker setMarkerPosLocal (getPos _uav);
	if (((getPosATL _uav) select 2) > 2) then {_marker setMarkerAlphaLocal 0.5} else {_marker setMarkerAlphaLocal 0};
	_marker setMarkerSizeLocal [PrykUav_range,PrykUav_range];
};
deleteMarkerLocal _marker;
};
	
If (!isDedicated AND PrykUav_Scan) then {
	While {true} do
	{ sleep 10;
	{If ((str(_x getVariable ["UavInSight","Dupa"])) == """Dupa""" AND side _x == playerSide) then {_x spawn PrykUavInit} } foreach AllUnitsUav;
	sleep 10;
};};