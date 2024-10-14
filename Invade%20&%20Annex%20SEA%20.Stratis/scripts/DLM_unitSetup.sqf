_unit = _this select 0;
if(isNull _unit) exitWith {};

if((_unit isKindOf "Ship") OR (_unit isKindOf "Wheeled_APC_F")) then {[_unit] execVM "scripts\DLM_boatPush\DLM_boatPush_setupUnit.sqf"};
if((_unit isKindOf "B_MRAP_01_F") OR (_unit isKindOf "B_MRAP_01_hmg_F")) then {clearitemcargo _unit; clearWeaponCargoGlobal _unit; clearMagazineCargoGlobal _unit;};

_Mohawk = ["I_Heli_Transport_02_F"];
_ghosthawk = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_F"];

_unit = _this select 0;
_type = typeOf _unit;

if(isNull _unit) exitWith {};
if(_type in _Mohawk) then {
	[_unit] execVM "heliDoorM.sqf";
};
if(_type in _ghosthawk) then {
	[_unit] execVM "heliDoor.sqf";
};