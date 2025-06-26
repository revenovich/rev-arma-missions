params ["_player", "_didJIP"];

missionNamespace setVariable ["playerGear", [], false];
waitUntil { missionNameSpace getVariable ["oft_serverInit", false] };

[_player] spawn {
	params ["_player"];
	if ((str _player) find "commander" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_leader", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_leader" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_leader", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_radio" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_radio", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_autorifleman" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_autorifleman", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_engineer" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_engineer", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_medic" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_medic", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_guncrew" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_guncrew", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};

	if ((str _player) find "oft_loadout_rifleman" >= 0) exitWith {
		private _loadout = missionNamespace getVariable ["oft_loadout_rifleman", []];
		missionNamespace setVariable ["playerGear", _loadout, false];
		[_player] call oft_fnc_gearLoad;
	};
};
