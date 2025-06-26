if (!isServer) exitWith {};
_unit = _this select 0;
_loadoutName = _this select 1;

_items = [];
_linkedItems = [];

_uniform = [];
_vest = [];
_backpack = [];

_primary = [];
_secondary = [];
_handgun = [];

// save loose items
_items pushBack (uniform _unit);
_items pushBack (vest _unit);
_items pushBack (backpack _unit);
_items pushBack (headgear _unit);
_items pushBack (goggles _unit);
_items pushBack (hmd _unit);
_items pushBack (binocular _unit);

// save linked items
_linkedItems = (assignedItems _unit);

// save uniform contents
{
	_uniform pushBack _x;
} forEach (uniformItems _unit);

// save vest contents
{
	_vest pushBack _x;
} forEach (vestItems _unit);

// save backpack contents
{
	_backpack pushBack _x;
} forEach (backpackItems _unit);

// save primary plus attachments
_primary pushBack (primaryWeapon _unit);
_primary pushBack (primaryWeaponMagazine _unit);
{
	_primary pushBack _x;
} forEach (primaryWeaponItems _unit);

// save secondary plus attachments
_secondary pushBack (secondaryWeapon _unit);
_secondary pushBack (secondaryWeaponMagazine _unit);
{
	_secondary pushBack _x;
} forEach (secondaryWeaponItems _unit);

// save pistol plus attachments
_handgun pushBack (handgunWeapon _unit);
_handgun pushBack (handgunMagazine _unit);
{
	_handgun pushBack _x;
} forEach (handgunItems _unit);

// save loadout
_loadout = [_items, _linkedItems, _uniform, _vest, _backpack, _primary, _secondary, _handgun];
missionNamespace setVariable [_loadoutName, _loadout, true];