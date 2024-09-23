params ["_player", "_didJIP"];

// Check if the player has interface so this script will not run headless clients
if (!hasInterface) exitWith {};

[_player] execVM "flagOnPlayerHandler.sqf";