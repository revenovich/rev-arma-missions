private ["_groups", "_units", "_unitsF", "_unitsP"];
private ["_name", "_faction", "_side", "_type", "_rank", "_unitNetId", "_groupNetId", "_vehicleNetId", "_sessionid", "_steamid", "_player", "_hasmedikit", "_weapon1", "_weapon1isgl", "_weapon2"];

diag_log "[ZOPS] athena hack: gatherUnits init";

//Params
_groups  = param[0,""];

//Vars
_units   = [];
_unitsF  = [];
_unitsP  = playableUnits;

_group_list = if (missionNamespace getVariable ["ath_all_data", false]) then {
	_groups;
} else {
	if (!isNull objectParent player) then {
		// If player is in a vehicle, gather data about passengers
		crew (vehicle player);
	} else {
		[];
	};
};

//Iterate through the known groups
{
	//Iterate through the players in the current group
	{
		_name = name _x;
		_faction = faction _x;
		_side = side _x;
		_type = typeOf _x;
		_rank = rank _x;
		_unitNetId = _x call BIS_fnc_netID;
		_groupNetId = (group _x) call BIS_fnc_netID;
		_vehicleNetId = "";
		_sessionid = '';
		_steamid = '';
		_player = '';
		_hasmedikit = "0";
		_weapon1 = (([primaryWeapon _x] call BIS_fnc_itemType) select 1);
		_weapon1isgl = "0";
		_weapon2 = (([secondaryWeapon _x] call BIS_fnc_itemType) select 1);

		//Check to see if the unit is in a vehicle
		if(!(isNull objectParent _x)) then { _vehicleNetId = (vehicle _x) call BIS_fnc_netID; };

		//Check to see if the unit has a medikit
		if ("Medikit" in (backpackItems _x)) then { _hasmedikit = "1";};

		//Check to see if the primary weapon has multiple 'muzzles' indicating that it is a GL
		if (count ((configFile >> "cfgWeapons" >> (primaryWeapon _x) >> "muzzles") call BIS_fnc_getCfgData) > 1) then { _weapon1isgl = "1";};

		//Collect different data depending on whether or not this is a 'playable unit'
		if (count _unitsP == 0) then {
			//No playable units, so must be singleplayer

			//Is this unit controlled by the player
			if (isPlayer _x) then {
				_player = profileName;
				_steamid = getPlayerUID player;
			};
		} else {
			//There are playable units, must be multiplayer

			//Is this unit a playable unit
			if (_x in _unitsP) then {
				//Yes, is it player controlled
				if (isPlayer _x) then {
					//Yes, is it 'our' player?
					if(_x == player) then{
						//Yes
						_sessionid = owner _x;
						_steamid = getPlayerUID _x;
						_player = profileName;
					} else {
						//No
						_sessionid = owner _x;
						_steamid = getPlayerUID _x;
						_player = name _x;
					};
				};
			};
		};

		_units pushBack _x;
		_unitsF pushBack (format ['{"name":"%1","netid":"%2","sessionid":"%3","steamid":"%4","player":"%5","faction":"%6","side":"%7","type":"%8","rank":"%9","groupnetid":"%10","vehiclenetid":"%11","weapon1":"%12","weapon1isgl":"%13","weapon2":"%14","hasmedikit":"%15"}',_name, _unitNetId, _sessionid, _steamid, _player, _faction, _side, _type, _rank, _groupNetId, _vehicleNetId, _weapon1, _weapon1isgl, _weapon2, _hasmedikit]);
	} forEach units _x;
} forEach _group_list;

//Verify that we have unit data and if not, populate from player group
if(isNil("_units") || (count _units) == 0) then {
	_units  = [];
	_unitsF = [];

	_unitNetId = player call BIS_fnc_netID;
	_groupNetId = (group player) call BIS_fnc_netID;
	_name = name player;
	_sessionid = owner player;
	_steamid = getPlayerUID player;
	_player = name player;
	_faction = faction player;
	_side = side player;
	_type = typeOf player;
	_rank = rank player;
	_weapon1 = (([primaryWeapon player] call BIS_fnc_itemType) select 1);
	_weapon2 = (([secondaryWeapon player] call BIS_fnc_itemType) select 1);

	_vehicleNetId = "";
	if(!(isNull objectParent player)) then { _vehicleNetId = (vehicle player) call BIS_fnc_netID; };

	_hasmedikit = "0";
	if ("Medikit" in (backpackItems player)) then { _hasmedikit = "1"; };

	_weapon1isgl = "0";
	if (count ((configFile >> "cfgWeapons" >> (primaryWeapon player) >> "muzzles") call BIS_fnc_getCfgData) > 1) then { _weapon1isgl = "1";};

	_units pushBack player;
	_unitsF pushBack (format ['{"name":"%1","netid":"%2","sessionid":"%3","steamid":"%4","player":"%5","faction":"%6","side":"%7","type":"%8","rank":"%9","groupnetid":"%10","vehiclenetid":"%11","weapon1":"%12","weapon1isgl":"%13","weapon2":"%14","hasmedikit":"%15"}',_name, _unitNetId, _sessionid, _steamid, _player, _faction, _side, _type, _rank, _groupNetId, _vehicleNetId, _weapon1, _weapon1isgl, _weapon2, _hasmedikit]);
};

[_units, _unitsF];

