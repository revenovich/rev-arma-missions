OftLeaderArray = [];
publicVariable "OftLeaderArray";
OftRiflemanArray = [];
publicVariable "OftRiflemanArray";
OftRadioArray = [];
publicVariable "OftRadioArray";
OftGuncrewArray = [];
publicVariable "OftGuncrewArray";
OftMedicArray = [];
publicVariable "OftMedicArray";
OftEngineerArray = [];
publicVariable "OftEngineerArray";
OftAutoRiflemanArray = [];
publicVariable "OftAutoRiflemanArray";

//1 LEADER //
oft_fnc_logic_init_leader = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_leader";

oft_fnc_add_leader = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_leader";

oft_fnc_rm_leader = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_leader";
////

//2 RIFLEMAN //
oft_fnc_logic_init_rifleman = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_rifleman";

oft_fnc_add_rifleman = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_rifleman";

oft_fnc_rm_rifleman = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_rifleman";
////

//3 RADIO //
oft_fnc_logic_init_radio = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_radio";

oft_fnc_add_radio = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_radio";

oft_fnc_rm_radio = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_radio";
////

//4 MEDIC //
oft_fnc_logic_init_medic = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_medic";

oft_fnc_add_medic = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_medic";

oft_fnc_rm_medic = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_medic";
////

//5 ENGINEER //
oft_fnc_logic_init_engineer = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_engineer";

oft_fnc_add_engineer = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_engineer";

oft_fnc_rm_engineer = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_engineer";
////

//6 AUTO RIFLEMAN //
oft_fnc_logic_init_autorifleman = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_autorifleman";

oft_fnc_add_autorifleman = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_autorifleman";

oft_fnc_rm_autorifleman = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_autorifleman";
////

//7 GUN CREW //
oft_fnc_logic_init_guncrew = {
	params ["_logic"];
	OftLeaderArray = [];
	private _units = synchronizedObjects _logic;
	{
		OftLeaderArray pushBack _x;
	} forEach _units;
};

publicVariable "oft_fnc_logic_init_guncrew";

oft_fnc_add_guncrew = {
	params ["_unit"];
	OftLeaderArray pushBack _unit;
};

publicVariable "oft_fnc_add_guncrew";

oft_fnc_rm_guncrew = {
	params ["_unit"];
	private _idx = OftLeaderArray find _unit;
	if (_idx >= 0) then {
		OftLeaderArray deleteAt _idx;
	};
};

publicVariable "oft_fnc_rm_guncrew";
////

////////////////////////////////////////////////////////////////////////////////////////////////////////

oft_fnc_gearLoad = {
	_loadout = missionNameSpace getVariable "playerGear";

	if (_loadout isEqualTo []) exitWith {};

	// remove current container contents
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeBackpack player;
	removeGoggles player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeAllWeapons player;

	// Give all items if they dont have it already
	if ((_loadout select 0 select 0) == "") then {
		removeUniform player;
	} else {
		player forceAddUniform (_loadout select 0 select 0);
	};
	if ((_loadout select 0 select 1) == "") then {
		removeVest player;
	} else {
		player addVest (_loadout select 0 select 1);
	};
	if ((_loadout select 0 select 2) != (backpack player)) then {
		if ((_loadout select 0 select 2) == "") then {
			removeBackpack player;
		} else {
			player addBackpack (_loadout select 0 select 2);
		};
	};
	if ((_loadout select 0 select 3) == "") then {
		removeHeadgear player;
	} else {
		player addHeadgear (_loadout select 0 select 3);
	};
	if ((_loadout select 0 select 4) == "") then {
		removeGoggles player;
	} else {
		player addGoggles (_loadout select 0 select 4);
	};
	if ((_loadout select 0 select 5) == "") then {
		player unlinkItem (hmd player);
	} else {
		player linkItem (_loadout select 0 select 5);
	};
	if ((_loadout select 0 select 6) == "") then {
		player removeWeapon (binocular player);
	} else {
		player addWeapon (_loadout select 0 select 6);
	};
	{
		player linkItem _x;
	} forEach (_loadout select 1);

	// copy primary info over
	_primary = [];
	{
		_primary pushBack _x;
	} forEach (_loadout select 5);

	// load primary plus attachments
	if (_primary select 0 != "") then {
		{
			player addItem _x;
		} forEach (_primary deleteAt 1);
		player addWeapon (_primary deleteAt 0);
		{
			player addPrimaryWeaponItem _x;
		} forEach _primary;
	} else {
		player removeWeapon (primaryWeapon player);
	};

	// copy secondary info over
	_secondary = [];
	{
		_secondary pushBack _x;
	} forEach (_loadout select 6);

	// load secondary plus attachments
	if (_secondary select 0 != "") then {
		{
			player addItem _x;
		} forEach (_secondary deleteAt 1);
		player addWeapon (_secondary deleteAt 0);
		{
			player addSecondaryWeaponItem _x;
		} forEach _secondary;
	} else {
		player removeWeapon (secondaryWeapon player);
	};

	// copy handgun info over
	_handgun = [];
	{
		_handgun pushBack _x;
	} forEach (_loadout select 7);

	// load handgun plus attachments
	if (_handgun select 0 != "") then {
		{
			player addItem _x;
		} forEach (_handgun deleteAt 1);
		player addWeapon (_handgun deleteAt 0);
		{
			player addHandgunItem _x;
		} forEach _handgun;
	} else {
		player removeWeapon (handgunWeapon player);
	};

	// load uniform contents
	{
		player addItemToUniform _x;
	} forEach (_loadout select 2);

	// load vest contents
	{
		player addItemToVest _x;
	} forEach (_loadout select 3);

	// load backpack contents
	{
		player addItemToBackpack _x;
	} forEach (_loadout select 4);
};