private ["_position","_cut","_dialog","_s_alt","_s_alt_text","_sound","_sound2","_soundPath"];
	waitUntil { !isNull player };
[] execVM "ATM_airdrop\functions.sqf";
call compile preprocessFileLineNumbers "scripts\ATM_airdrop\functions.sqf";

		_position = GetPos player;
		_z = _position select 2;
		Altitude = 500;

	hint Localize "STR_ATM_hinton";
	openMap true;

	createDialog "ATM_AD_ALTITUDE_SELECT";
	disableSerialization;
	_dialog = findDisplay 2900;
	_s_alt = _dialog displayCtrl 2901;
	_s_alt_text = _dialog displayCtrl 2902;
	_s_alt_text ctrlSetText format["%1", Altitude];
	_s_alt sliderSetRange [500,1000];
	_s_alt slidersetSpeed [100,100,100];
	_s_alt sliderSetPosition Altitude;


ATM_Keys = 0;

IsCutRope = false;

_ctrl = _dialog displayCtrl 2903;
{
	_index = _ctrl lbAdd _x;
} forEach ["Fr Keyboard","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","US Keyboard","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
lbSetCurSel [2903, 0];

ATM_Jump_mapclick = false;
onMapSingleClick "ATM_Jump_clickpos = _pos; ATM_Jump_mapclick = true; onMapSingleClick ''; true;";
waitUntil {ATM_Jump_mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	systemChat "Halo jump canceled.";
	breakOut "main";
};
_pos = ATM_Jump_clickpos;
ATM_Jump_mapclick = if(true) then{
	call compile format ['
		mkr_halo = createmarker ["mkr_halo", ATM_Jump_Clickpos];
		"mkr_halo" setMarkerTypeLocal "hd_dot";
		"mkr_halo" setMarkerColorLocal "ColorGreen";
		"mkr_halo" setMarkerTextLocal "Jump";'];
};

_target = player;
RedOn = _target addAction["<t color='#B40404'>Chemlight Red On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_red"],6,false,false,"","_target == ( player)"];
BlueOn = _target addAction["<t color='#68ccf6'>Chemlight Blue On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_blue"],6,false,false,"","_target == ( player)"];
YellowOn = _target addAction["<t color='#fcf018'>Chemlight Yellow On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_yellow"],6,false,false,"","_target == ( player)"];
GreenOn = _target addAction["<t color='#30fd07'>Chemlight Green On</t>", "ATM_airdrop\atm_chem_on.sqf",["Chemlight_green"],6,false,false,"","_target == ( player)"];
IrOn = _target addAction["<t color='#FF00CC'>Strobe IR On</t>", "ATM_airdrop\atm_chem_on.sqf",["NVG_TargetC"],6,false,false,"","_target == ( player)"];

// See if unit has a backback.
_hasBackpack = false;
if ( ! isNull( unitBackpack _target) ) then {
   // Unit does have a backback.
   _hasBackpack = true;
};

_loadout=[_target, _hasBackpack] call Getloadout;

_posJump = getMarkerPos "mkr_halo";
_posx = _posJump select 0;
_posy = _posJump select 1;
_posz = _posJump select 2;
_target setPos [_posx,_posy,_posz+Altitude];

openMap false;
deleteMarker "mkr_halo";

// Put backpack on front, if the unit has one.
if ( _hasBackpack ) then {
   [_target] call Frontpack;
};

/*
 * Sort parachute and backpack out.
 */
if ( _hasBackpack ) then {
   // Remove current backpack.
   removeBackpack _target;
   sleep 0.5;
};
// Give unit backpack.
_target addBackpack "B_Parachute";
// If above 8,000m give the unit breathing equipment and face protection.
if ((getPos _target select 2) >= 8000) then{
	removeHeadgear _target;
	_target addHeadgear "H_CrewHelmetHeli_B";
	sleep 0.5;
};

hintsilent "";
hint Localize "STR_ATM_hintjump";
Cut_Rope = (FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyDown"];

// Spawn the noise system so it will run in the background.
[ _target ] spawn {
   params[ "_target" ];
   while {(getPos _target select 2) > 2} do {
      playSound "Vent";
      playSound "Vent2";
      sleep 5;
   };
};

// Check for automatic parachute opening at 150m if not already opened.
_parachuteOpen = false;
_playerAlt = getPos _target  select 2;
while { _playerAlt > 2 } do {
   _playerAlt = getPos _target  select 2;
   if ( (! _parachuteOpen) && _playerAlt < 150 &&
        (typeOf (unitBackpack _target) isEqualTo "B_Parachute" ) ) then {
      _target action ["OpenParachute", _target];
      _parachuteOpen = true;
   };
};

hint Localize "STR_ATM_hintload";
_target removeAction RedOn;
_target removeAction BlueOn;
_target removeAction YellowOn;
_target removeAction GreenOn;
_target removeaction Iron;
deletevehicle (_target getvariable "frontpack"); _target setvariable ["frontpack",nil,true];
deletevehicle (_target getvariable "lgtarray"); _target setvariable ["lgtarray",nil,true];
if (!IsCutRope) Then {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", Cut_Rope];
};

sleep 3;
hintsilent "";
sleep 1;

0=[_target,_loadout] call Setloadout;

if (true) exitWith {};
