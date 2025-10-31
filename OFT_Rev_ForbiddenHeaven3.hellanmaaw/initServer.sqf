////////////////////////////////////////////////
//             EDITABLE VARIABLES             //
////////////////////////////////////////////////

_faction = "custom"; // All factions are in the factions folder, use custom to edit your own.
_nightvision = true; // Set to true if you want players to spawn with nightvision
_fullArsenal = false;  // Set to false if you've manually set up a limited arsenal in the editor
_playerSideVar = "west"; // Side of the player, west, east, guer, or civilian

////////////////////////////////////////////////
//        DO NOT EDIT BELOW THIS LINE         //
////////////////////////////////////////////////

missionNameSpace setVariable ["initDone", false, true];

if (isServer) then
{
	OFT_TO_ALL_PLAYERS = [0, -2] select isDedicated;

	private _allNegativeHCs = allPlayers apply { getPlayerID _x } select { _x != "-1" }	// all valid playerIDs
		apply { getUserInfo _x } select { _x select 7 }									// filter by HC
		apply { -(_x select 1) };														// get negative network ID

	if (_allNegativeHCs isNotEqualTo []) then
	{
		OFT_TO_ALL_PLAYERS = [OFT_TO_ALL_PLAYERS] + _allNegativeHCs;
	};

	publicVariable "OFT_TO_ALL_PLAYERS";

	addMissionEventHandler ["OnUserConnected", {
		params ["_networkId"];
		private _userInfo = getUserInfo _networkId;
		if !(_userInfo select 7) exitWith {};	// not a HC

		if (OFT_TO_ALL_PLAYERS isEqualType 0) then	// number to array conversion
		{
			if (OFT_TO_ALL_PLAYERS == 0) then		// player-hosted
			{
				OFT_TO_ALL_PLAYERS = [-(_userInfo select 1)];
			}
			else								// -2, dedicated server
			{
				OFT_TO_ALL_PLAYERS = [OFT_TO_ALL_PLAYERS, -(_userInfo select 1)];
			};
		}
		else									// already an array
		{
			OFT_TO_ALL_PLAYERS pushBackUnique -(_userInfo select 1);
		};

		publicVariable "OFT_TO_ALL_PLAYERS";
	}];
};

missionNamespace setVariable ["isAutoGear", true, true];

systemChat "Loading mission...";
diag_log "Loading mission...";

["init"] call OFT_fnc_customFillBox;
["init"] call OFT_fnc_healAction;

_handle = execVM format["factions\%1.sqf", _faction];
waitUntil {isNull _handle};

_handleFnInit = execVM "functions\fn_init.sqf";
waitUntil {isNull _handleFnInit};

_handleFnInit = execVM "functions\fn_betterText.sqf";
waitUntil {isNull _handleFnInit};

_handleFnInit = execVM "mission_functions\cruiseMissile.sqf";
waitUntil {isNull _handleFnInit};

[] spawn {
	private _sleepDelay = 0.5;
	while {true} do {
		waitUntil { !isNil "jamCar_1" };
		waitUntil { missionNamespace getVariable ["initDone", false] };
		private _currentPos = getPosATL jamCar_1;
		private _lastPos = missionNamespace getVariable ["lastCarPos", [0,0,0]];
		private _distance = _currentPos vectorDistance _lastPos;

		if (_distance > 0.5) then {
			if (missionNamespace getVariable ["isJammerOn", false]) then {
				// Turn off the jammer
				jamswitch_1 animateSource ["switchposition",1];  
				jamswitch_1 animateSource ["light",0];

				["Sound barrier is off due to vehicle movement"] remoteExec ["systemChat", 0];
				missionNamespace setVariable ["isJammerOn", false, true];
			};

			_b1 = missionNamespace getVariable "fire_barrel_1";
			_b2 = missionNamespace getVariable "fire_barrel_2";
			private _isBarrelsDestroyed = false;
			if (!(isNil "_b1")) then {
				if (typeOf _b1 == "Land_MetalBarrel_empty_F") then {
					deleteVehicle _b1;
					missionNamespace setVariable ["fire_barrel_1", nil, true];
					_isBarrelsDestroyed = true;
				};
			};

			if (!(isNil "_b2")) then {
				if (typeOf _b2 == "Land_MetalBarrel_empty_F") then {
					deleteVehicle _b2;
					missionNamespace setVariable ["fire_barrel_2", nil, true];
					_isBarrelsDestroyed = true;
				};
			};
			
			if (_isBarrelsDestroyed) then {
				missionNamespace setVariable ["isDeployed", false, true];
				barrel_1 hideObjectGlobal false;
				barrel_2 hideObjectGlobal false;
				["Fire barrels have been packed up due to vehicle movement"] remoteExec ["systemChat", 0];
			};
		};

		missionNamespace setVariable ["lastCarPos", _currentPos, true];
		sleep _sleepDelay;
	};
};

["init"] call OFT_fnc_respawnHandle;

missionNamespace setVariable ["playerSideVar", _playerSideVar, true];
missionNameSpace setVariable ["gearGiveNightvision", _nightvision, true];
missionNameSpace setVariable ["fullArsenal", _fullArsenal, true];

systemChat "Mission loaded!";
diag_log "Mission loaded!";

missionNameSpace setVariable ["initDone", true, true];
