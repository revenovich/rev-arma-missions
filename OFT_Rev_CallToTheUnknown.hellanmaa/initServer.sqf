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

systemChat "Loading mission...";
diag_log "Loading mission...";

["init"] call OFT_fnc_customFillBox;
["init"] call OFT_fnc_teleportThings;
["init"] call OFT_fnc_healAction;

_handle = execVM format["factions\%1.sqf", _faction];

waitUntil {isNull _handle};

["init"] call OFT_fnc_respawnHandle;

missionNamespace setVariable ["playerSideVar", _playerSideVar, true];
missionNameSpace setVariable ["gearGiveNightvision", _nightvision, true];
missionNameSpace setVariable ["fullArsenal", _fullArsenal, true];

systemChat "Mission loaded!";
diag_log "Mission loaded!";

missionNameSpace setVariable ["initDone", true, true];
