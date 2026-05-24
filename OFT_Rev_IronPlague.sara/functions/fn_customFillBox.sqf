fn_clearBox = {
	params ["_box"];
	if (isNil "_box") exitWith {};
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};

fn_fillBox = {
	params ["_box", "_weapons", "_weaponsNum", "_items", "_itemsNum", "_mags", "_magsNum", "_backpacks", "_backpacksNum"];
	if (!(isNil "_weapons") && !(isNil "_weaponsNum")) then {
		if (!(_weapons isEqualTo [])) then {
			if (_weaponNum isEqualTo 0) then {
				{ _box addWeaponCargoGlobal [_x, 1] } forEach _weapons;
			} else {
				{ _box addWeaponCargoGlobal [_x, _weaponNum] } forEach _weapons;
			};
		};
	};

	if (!(isNil "_items") && !(isNil "_itemsNum")) then {
		if (!(_items isEqualTo [])) then {
			if (_itemsNum isEqualTo 0) then {
				{
					if (typeName _x isEqualTo "ARRAY") then {
						{ _box addItemCargoGlobal [_x, 1] } forEach _x;
					} else {
						_box addItemCargoGlobal [_x, 1];
					};
				} forEach _items;
			} else {
				{ 
					if (typeName _x isEqualTo "ARRAY") then {
						{ _box addItemCargoGlobal [_x, _itemsNum] } forEach _x;
					} else {
						_box addItemCargoGlobal [_x, _itemsNum];
					};
				} forEach _items;
			};
		};
	};

	if (!(isNil "_mags") && !(isNil "_magsNum")) then {
		if (!(_mags isEqualTo [])) then {
			if (_magsNum isEqualTo 0) then {
				{ _box addMagazineCargoGlobal [_x, 1] } forEach _mags;
			} else {
				{ _box addMagazineCargoGlobal [_x, _magsNum] } forEach _mags;
			};
		};
	};

	if (!(isNil "_backpacks") && !(isNil "_backpacksNum")) then {
		if (!(_backpacks isEqualTo [])) then {
			if (_backpacksNum isEqualTo 0) then {
				{ _box addBackpackCargoGlobal [_x, 1] } forEach _backpacks;
			} else {
				{ _box addBackpackCargoGlobal [_x, _backpacksNum] } forEach _backpacks;
			};
		};
	};
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

if (!isServer) exitWith {};

_request = _this select 0;

switch (_request) do {
	case "init": {
		systemChat "custom fill box init";
	};

	case "fillBox": {
		_box = _this select 1;
		_weapons = _this select 2;
		_weaponsNum = _this select 3;
		_items = _this select 4;
		_itemsNum = _this select 5;
		_mags = _this select 6;
		_magsNum = _this select 7;
		_backpacks = _this select 8;
		_backpacksNum = _this select 9;

		[_box] call fn_clearBox;
		[_box, _weapons, _weaponsNum, _items, _itemsNum, _mags, _magsNum, _backpacks, _backpacksNum] call fn_fillBox;
	};

	case "clearBox": {
		_box = _this select 1;

		[_box] call fn_clearBox;
	};
};