if (isServer) then {
	[] execVM "scripts\initGlobalVariable.sqf";
	[] execVM "scripts\GlobalInitFile\initGlobalFunction.sqf";


	_scriptHandle = [] execVM "scripts\GlobalInitFile\initGlobalArrayVariable.sqf";
	[] execVM "scripts\GlobalInitFile\initGlobalFunctionLate.sqf";

	waitUntil { scriptDone _scriptHandle};
	[] execVM "scripts\FiringRange\TG_initBox.sqf";
	[] execVM "scripts\reChooseLoadout.sqf";
	[] execVM "scripts\Ambient\ambientArtilleryFire.sqf";
	[] execVM "scripts\Ambient\ambientVirtualArtillery.sqf";
	_scriptHandle = [] execVM "scripts\Ambient\frontlineAttacker.sqf";

	waitUntil { scriptDone _scriptHandle};
	[] execVM "scripts\Ambient\spawnFrontlineAttacker.sqf";
};
