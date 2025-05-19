/*
	@file_name: fn_gearHandle.sqf
	@file_author: Dyzalonius
*/

//// ////////////////////////////////////////////
//               SUB-FUNCTIONS               // 
//// ////////////////////////////////////////////

fn_gearSnitch = {
	_gearMessage = "";

	{
		if ("MineDetector" in (vestItems player + uniformItems player + backpackItems player)) then {
			_gearMessage = _gearMessage + format["\n%1 - MINEDETECTOR", name _x];
		};
		if ((secondaryWeapon _x) in ["launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_F"]) then {
			_gearMessage = _gearMessage + format["\n%1 - MAAWS MOD1", name _x];
		};
		if (!((primaryWeapon _x) in [_weaponMain select 0, _weaponAR select 0]) && (primaryWeapon _x) != "") then {
			_gearMessage = _gearMessage + format["\n%1 - PRIMARY:\n%2", name _x, primaryWeapon _x];
		};
	} forEach allPlayers;

	if (_gearMessage == "") then {
		hint "No suspicious gear";
	} else {
		hint _gearMessage;
	};
};

fn_gearLoad = {
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

fn_gearLoadout = {
	_loadout = _this;

	switch (_loadout) do {
		case "ENGINEER": {
			["LOADOUT ENGINEER"] call fn_loadoutLoad;

			player setVariable ["Ace_medical_medicClass", 0, true];
			player setVariable ["ACE_IsEngineer", 1, true];
			player setVariable ["ACE_isEOD", 1, true];
		};
		case "MEDIC": {
			["LOADOUT MEDIC"] call fn_loadoutLoad;

			player setVariable ["Ace_medical_medicClass", 1, true];
			player setVariable ["Ace_IsEngineer", 0, true];
			player setVariable ["ACE_isEOD", 0, true];
		};
		case "TEAMLEADER": {
			["LOADOUT TEAMLEADER"] call fn_loadoutLoad;

			_isLeaderMasterAllSpecialist = missionNamespace getVariable ["LeaderMasterAllSpecialist", false];
			if (_isLeaderMasterAllSpecialist) then {
				player setVariable ["Ace_medical_medicClass", 1, true];
				player setVariable ["Ace_IsEngineer", 1, true];
				player setVariable ["ACE_isEOD", 1, true];
			} else {
				player setVariable ["Ace_medical_medicClass", 0, true];
				player setVariable ["Ace_IsEngineer", 0, true];
				player setVariable ["ACE_isEOD", 0, true];
			};
		};
		default {
			["LOADOUT " + _loadout] call fn_loadoutLoad;

			player setVariable ["Ace_medical_medicClass", 0, true];
			player setVariable ["Ace_IsEngineer", 0, true];
			player setVariable ["ACE_isEOD", 0, true];
		};
	};

	// Save default loadout to playerGear if it's empty
	_loadout = missionNameSpace getVariable "playerGear";
	if (_loadout isEqualTo []) exitWith {
		[] call fn_gearSave;
	};
};

fn_gearSave = {
	_items = [];
	_linkedItems = [];

	_uniform = [];
	_vest = [];
	_backpack = [];

	_primary = [];
	_secondary = [];
	_handgun = [];

	// save loose items
	_items pushBack (uniform player);
	_items pushBack (vest player);
	_items pushBack (backpack player);
	_items pushBack (headgear player);
	_items pushBack (goggles player);
	_items pushBack (hmd player);
	_items pushBack (binocular player);

	// save linked items
	_linkedItems = (assignedItems player);

	// save uniform contents
	{
		_uniform pushBack _x;
	} forEach (uniformItems player);

	// save vest contents
	{
		_vest pushBack _x;
	} forEach (vestItems player);

	// save backpack contents
	{
		_backpack pushBack _x;
	} forEach (backpackItems player);

	// save primary plus attachments
	_primary pushBack (primaryWeapon player);
	_primary pushBack (primaryWeaponMagazine player);
	{
		_primary pushBack _x;
	} forEach (primaryWeaponItems player);

	// save secondary plus attachments
	_secondary pushBack (secondaryWeapon player);
	_secondary pushBack (secondaryWeaponMagazine player);
	{
		_secondary pushBack _x;
	} forEach (secondaryWeaponItems player);

	// save pistol plus attachments
	_handgun pushBack (handgunWeapon player);
	_handgun pushBack (handgunMagazine player);
	{
		_handgun pushBack _x;
	} forEach (handgunItems player);

	// save loadout
	_loadout = [_items, _linkedItems, _uniform, _vest, _backpack, _primary, _secondary, _handgun];
	missionNameSpace setVariable ["playerGear", _loadout, false];
};

fn_loadoutSave = {
	_unit = _this select 0;
	_loadoutName = _this select 1;

	_items = [];
	_linkedItems = [];

	_uniform = [];
	_vest = [];
	_backpack = [];

	_primary = [];
	_secondary = [];
	_handgun = [];

	// save loose items
	_items pushBack (uniform _unit);
	_items pushBack (vest _unit);
	_items pushBack (backpack _unit);
	_items pushBack (headgear _unit);
	_items pushBack (goggles _unit);
	_items pushBack (hmd _unit);
	_items pushBack (binocular _unit);

	// save linked items
	_linkedItems = (assignedItems _unit);

	// save uniform contents
	{
		_uniform pushBack _x;
	} forEach (uniformItems _unit);

	// save vest contents
	{
		_vest pushBack _x;
	} forEach (vestItems _unit);

	// save backpack contents
	{
		_backpack pushBack _x;
	} forEach (backpackItems _unit);

	// save primary plus attachments
	_primary pushBack (primaryWeapon _unit);
	_primary pushBack (primaryWeaponMagazine _unit);
	{
		_primary pushBack _x;
	} forEach (primaryWeaponItems _unit);

	// save secondary plus attachments
	_secondary pushBack (secondaryWeapon _unit);
	_secondary pushBack (secondaryWeaponMagazine _unit);
	{
		_secondary pushBack _x;
	} forEach (secondaryWeaponItems _unit);

	// save pistol plus attachments
	_handgun pushBack (handgunWeapon _unit);
	_handgun pushBack (handgunMagazine _unit);
	{
		_handgun pushBack _x;
	} forEach (handgunItems _unit);

	// save loadout
	_loadout = [_items, _linkedItems, _uniform, _vest, _backpack, _primary, _secondary, _handgun];
	missionNamespace setVariable [_loadoutName, _loadout, true];

	if ((missionNameSpace getVariable ["LoadoutNameList", []] isEqualTo [])) then {
		_loadoutNameList = [_loadoutName];
		missionNameSpace setVariable ["LoadoutNameList", _loadoutNameList, true];
	} else {
		_loadoutNameList = missionNameSpace getVariable "LoadoutNameList";
		_loadoutNameList pushBack _loadoutName;
		missionNameSpace setVariable ["LoadoutNameList", _loadoutNameList, true];
	};
};

fn_setLoadoutByRole = {
	// get player role and save default loadout
	// Role example: Team leader@CO so we need to split it
	_role = (roleDescription player) splitString "@";
	_role = _role select 0;

	// Upercase role
	_role = toUpper _role;

	// Check if role name is more than 1 word, concat all words
	_role = _role splitString " ";
	if (count _role > 1) then {
		_tempRole = "";
		{
			// Current result is saved in variable _x
			_tempRole = _tempRole + _x;
		} forEach _role;
		_role = _tempRole;
	} else {
		_role = _role select 0;
	};

	// get loadout name list
	_loadoutNameList = missionNameSpace getVariable ["LoadoutNameList", []];

	// Check if loadout name list is empty
	if (_loadoutNameList isEqualTo []) exitWith {
		diag_log "Loadout name list is empty";
	};

	{
		// Current result is saved in variable _x
		_loadoutName = _x;
		_trueLoadoutName = _loadoutName;

		// Split loadout name
		// Loadout name example: LOADOUT AT RIFLEMAN so we need to split it
		_loadoutName = _loadoutName splitString " ";

		// Check if loadout name is more than 2 words, concat from 2nd word
		if (count _loadoutName > 2) then {
			_tempName = "";
			{
				// Current result is saved in variable _x
				if (_x != "LOADOUT") then {
					_tempName = _tempName + _x;
				};
			} forEach _loadoutName;
			_loadoutName = _tempName;
		} else {
			_loadoutName = _loadoutName select 1;
		};

		if (_role == _loadoutName) then {
			_loadout = missionNamespace getVariable _trueLoadoutName;
			missionNameSpace setVariable ["playerGear", _loadout, false];
		};
	} forEach _loadoutNameList;
};

fn_loadoutLoad = {
	_loadoutName = _this select 0;

	_loadout = missionNamespace getVariable _loadoutName;

	if (isNil "_loadout") exitWith {
		systemChat "Loadout not found";
	};
	if (_loadout isEqualTo []) exitWith {};

	// remove current container contents
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;
	removeBackpack player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeAllWeapons player;

	// Give all items if they dont have it already
	if (_loadout select 0 select 0 == "") then {
		removeUniform player;
	} else {
		player forceAddUniform (_loadout select 0 select 0);
	};
	if (_loadout select 0 select 1 == "") then {
		removeVest player;
	} else {
		player addVest (_loadout select 0 select 1);
	};
	if (_loadout select 0 select 2 != (backpack player)) then {
		if (_loadout select 0 select 2 == "") then {
			removeBackpack player;
		} else {
			player addBackpack (_loadout select 0 select 2);
		};
	};
	if (_loadout select 0 select 3 == "") then {
		removeHeadgear player;
	} else {
		player addHeadgear (_loadout select 0 select 3);
	};
	if (_loadout select 0 select 4 == "") then {
		removeGoggles player;
	} else {
		player addGoggles (_loadout select 0 select 4);
	};
	if (_loadout select 0 select 5 == "") then {
		player unlinkItem (hmd player);
	} else {
		player linkItem (_loadout select 0 select 5);
	};
	if (_loadout select 0 select 6 == "") then {
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

fn_gearStart = {
	if ((missionNamespace getVariable "playerGear") isEqualTo []) then {
		removeAllWeapons player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeAllAssignedItems player;
		removeGoggles player;

		// give basic gear
		["gearUniformBasic"] call fn_uniform_set;
		["gearVestBasic"] call fn_vest_set;
		["gearHeadgearBasic"] call fn_headgear_set;
		["gearBackpackBasic"] call fn_backpack_set;

		player linkItem "ItemMap";
		player linkItem "itemGPS";
		player linkItem (missionNameSpace getVariable "gearRadio");
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player addWeapon "Binocular";
		if (missionNameSpace getVariable "gearGiveNightvision") then {
			player linkItem (missionNameSpace getVariable "gearNightvision");
		};
	} else {
		_loadout = missionNamespace getVariable "playerGear";
		_loadout call fn_gearLoad;
	};
};

fn_headgear_set = {
	_headgearVar = _this select 0;

	// remove headgear
	removeHeadgear player;

	// set headgear
	player addHeadgear (missionNamespace getVariable _headgearVar);
};

fn_uniform_set = {
	_uniformVar = _this select 0;

	// remove uniform
	removeUniform player;

	// set uniform
	player forceAddUniform (missionNamespace getVariable _uniformVar);
	player addItemToUniform "ACE_bodyBag";
	player addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 5 do {
		player addItemToUniform "ACE_morphine";
		player addItemToUniform "ACE_epinephrine";
		player addItemToUniform "ACE_splint";
	};
	for "_i" from 1 to 2 do {
		player addItemToUniform "ACE_tourniquet";
	};
	for "_i" from 1 to 30 do {
		player addItemToUniform "ACE_fieldDressing"
	};
};

fn_vest_set = {
	_vestVar = _this select 0;

	// remove vest
	removeVest player;

	// set vest
	player addVest (missionNamespace getVariable _vestVar);
};

fn_backpack_set = {
	_backpackVar = _this select 0;

	// remove backpack
	removeBackpack player;

	// set backpack
	player addBackpack (missionNamespace getVariable _backpackVar);
};

//// ////////////////////////////////////////////
//               FUNCTION LOOP               // 
//// ////////////////////////////////////////////

if (side player == sideLogic) exitWith {
	true
};

_request = (_this select 0);

switch (_request) do {
	// gear start
	case 0: {
		[] call fn_gearStart;
	};

	// gear loadout
	case 1: {
		_loadout = (_this select 1);
		_loadout call fn_gearLoadout;
	};

	// save gear
	case 2: {
		[] call fn_gearSave;
	};

	// rearm from save
	case 3: {
		[] call fn_gearLoad;
	};

	// check unallowed gear
	case 4: {
		[] call fn_gearSnitch;
	};

	// save loadout
	case 5: {
		_unit = (_this select 1);
		_loadoutName = (_this select 2);
		[_unit, _loadoutName] call fn_loadoutSave;
	};

	case 6: {
		[] call fn_setLoadoutByRole;
	};
};