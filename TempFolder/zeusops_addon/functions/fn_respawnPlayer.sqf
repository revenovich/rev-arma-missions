/*
	@file_name: fn_respawnPlayer.sqf
	@file_author: Dyzalonius
*/

// respawn
setPlayerRespawnTime 0.01;
sleep 1;

// reset respawn timer
if (missionNameSpace getVariable "respawnAllow") then {
    setPlayerRespawnTime (missionNameSpace getVariable "respawnTime");
} else {
    setPlayerRespawnTime (missionNameSpace getVariable "respawnTimeInfinite");
};
