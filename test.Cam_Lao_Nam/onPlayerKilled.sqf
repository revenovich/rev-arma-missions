params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

if (!(isNull _oldUnit)) then {
	removeAllActions _oldUnit;
};