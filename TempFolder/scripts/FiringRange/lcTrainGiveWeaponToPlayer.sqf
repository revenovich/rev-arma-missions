passedListA = _this#0;

thisPrivatePlayer = passedListA#0;

nearestObjArray = nearestObjects [thisPrivatePlayer, ["Box_NATO_WpsLaunch_F"], 5];

thisPrivateBox = nearestObjArray#0;

if (count weaponCargo thisPrivateBox > 0) then {
	if !(thisPrivatePlayer hasWeapon (weaponCargo thisPrivateBox)#0) then {
		thisPrivatePlayer addWeapon (weaponCargo thisPrivateBox)#0
	}
}