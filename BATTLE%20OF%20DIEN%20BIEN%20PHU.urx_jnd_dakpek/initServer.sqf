if (!isServer) exitWith {};

missionNamespace setVariable ["oft_serverInit", false, true];

_handleFnInit = execVM "initArtyFunctions.sqf";
waitUntil {isNull _handleFnInit};

_handleFnInit = execVM "initLoadoutFunctions.sqf";
waitUntil {isNull _handleFnInit};

_handleFnInit = execVM "initRazorwireFunctions.sqf";
waitUntil {isNull _handleFnInit};

_handleFnInit = execVM "betterText.sqf";
waitUntil {isNull _handleFnInit};

_handleFnInit = execVM "betterHint.sqf";
waitUntil {isNull _handleFnInit};

oft_fnc_run_intro = {
	[] spawn {
		playMusic "song1";
		["intro1"] call oft_fnc_better_text;
		sleep 6.5;
		["intro2"] call oft_fnc_better_text;
		sleep 6;
		["intro3"] call oft_fnc_better_text;
		sleep 11;
		["intro4"] call oft_fnc_better_text;
	};
};

publicVariable "oft_fnc_run_intro";

missionNamespace setVariable ["oft_serverInit", true, true];