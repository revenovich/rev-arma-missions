#define SAFETY_ZONES	[["respawn_west", 300]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "Keep the safety on at base Soldier!"
#define MORTAR_MESSAGE	"No point you putting that up, soldier; we're fresh out of ammo for those things."
#define AA_MESSAGE	"Sorry, solider! All AA missiles are disabled!"

if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
	{
		deleteVehicle (_this select 6);
		titleText [MESSAGE, "PLAIN", 3];
	};
	
	if (_this select 5 == "RPG32_AA_F") then
	{
		deleteVehicle (_this select 6);
		titleText [AA_MESSAGE, "PLAIN", 3];
	};
}];

player addEventHandler ["WeaponAssembled", {
	deleteVehicle _this select 1;
	titleText [MORTAR_MESSAGE, "PLAIN", 3];
}];