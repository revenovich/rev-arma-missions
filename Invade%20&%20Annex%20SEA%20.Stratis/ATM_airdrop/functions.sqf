fnc_alt_onsliderchange =
{
	private["_dialog","_text","_value"];
	disableSerialization;

	_dialog = findDisplay 2900;
	_text = _dialog displayCtrl 2902;
	_value = _this select 0;

	Altitude = round(_value);
	_text ctrlSetText format["%1", round(_value)];
};

dokeyDown={
     private ["_r","_key_delay","_cutawaysound"] ;
     _key_delay  = 0.3;
	player setvariable ["key",false];
   _r = false ;

   if (player getvariable["key",true] and (_this select 1)  == ATM_Keys) exitwith {player setvariable["key",false]; [_key_delay] spawn {sleep (_this select 0);player setvariable["key",true]; }; _r};
     if ((_this select 1)  == ATM_Keys) then {
       if  (player != vehicle player and player getvariable ["cutaway",true]) then  {
		playSound "Para";
		_cut = nearestObjects [player, ["Steerable_Parachute_F"], 5];
	   {
			deletevehicle _x;
	   } foreach _cut;
	player addBackpack "B_Parachute";
	deletevehicle (player getvariable "frontpack"); player setvariable ["frontpack",nil,true];
    player setvariable["key",true];
    player setvariable ["cutaway",false];
    Cut_Rope = (findDisplay 46) displayRemoveEventHandler ["KeyDown", Cut_Rope];
    IsCutRope = true;
   };
    _r=true;
      };
     _r;
} ;

Getloadout={
   params[ "_unit", "_hasBackpack" ];
   _gear = [];
   if ( _hasBackpack ) then {
      // Unit has back pack so store gear.
      _gear = [
         headgear _unit,
         backpack _unit,
         getItemCargo (unitBackpack _unit),
         getWeaponCargo (unitBackpack _unit),
         getMagazineCargo (unitBackpack _unit)
      ];
   }
   else {
      // Unit does not have backpack so only store headgear.
      _gear = [
         headgear _unit,
         "",
         [],
         [],
         []
      ];
   };
	_gear; // Return the gear array.
};

Setloadout={
   params[ "_unit", "_gear" ];
	removeheadgear _unit;
	removeBackPack _unit;
	_unit addBackpack "B_AssaultPack_blk";
	removeBackPack _unit;
	if ((_gear select 1) != "") then {_unit addBackPack (_gear select 1);clearAllItemsFromBackpack _unit;};
	if ((_gear select 0) != "") then {_unit addHeadgear (_gear select 0);};
	if (count ((_gear select 3) select 0) > 0) then
	{
		for "_i" from 0 to (count ((_gear select 3) select 0) - 1) do
		{
			(unitBackpack _unit) addweaponCargoGlobal [((_gear select 3) select 0) select _i,((_gear select 3) select 1) select _i];
		};
	};
	if (count ((_gear select 4) select 0) > 0) then
	{
		for "_i" from 0 to (count ((_gear select 4) select 0) - 1) do
		{
			(unitBackpack _unit) addMagazineCargoGlobal [((_gear select 4) select 0) select _i,((_gear select 4) select 1) select _i];
		};
	};
	if (count ((_gear select 2) select 0) > 0) then
	{
		for "_i" from 0 to (count ((_gear select 2) select 0) - 1) do
		{
			(unitBackpack _unit) addItemCargoGlobal [((_gear select 2) select 0) select _i,((_gear select 2) select 1) select _i];
		};
	};
};

Frontpack={
	_pack = unitBackpack _target;
	_class = typeOf _pack;

	[_target,_class] spawn {
		private ["_target","_class","_packHolder"];
		_target	= _this select 0;
		_class 	= _this select 1;

		_packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
		_packHolder addBackpackCargo [_class, 1];
		_packHolder attachTo [_target,[0.1,0.56,-.72],"pelvis"];
		_target setvariable ["frontpack", _packHolder,true];
		_packHolder setVectorDirAndUp [[0,1,0],[0,0,-1]];

		waitUntil {animationState _target == "para_pilot"};
		_packHolder attachTo [vehicle _target,[0.1,0.72,0.52],"pelvis"];
		_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];
		};
};
