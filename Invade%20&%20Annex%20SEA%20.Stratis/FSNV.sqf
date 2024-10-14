/*
Created by: soulkobk
Activation: Place this line into init.sqf         null=[] execVM "FSNV.sqf";
Usage: Feel free to use in any and all mission files
How To: Use "Nightvision" key to activate, must remove equipped item in nightvision slot in your inventory, and be wearing one of the pre-loaded items below "glasses"
Summary: Please leave credits, feel free to edit anything below this point
*/

if (!hasInterface) exitWith {};
FSNV = ["G_Spectacles",
"G_Spectacles_Tinted",
"G_Combat",
"G_Lowprofile",
"G_Shades_Black",
"G_Shades_Green",
"G_Shades_Red",
"G_Squares",
"G_Squares_Tinted",
"G_Sport_BlackWhite",
"G_Sport_Blackyellow",
"G_Sport_Greenblack",
"G_Sport_Checkered",
"G_Sport_Red",
"G_Tactical_Black",
"G_Aviator",
"G_Lady_Mirror",
"G_Lady_Dark",
"G_Lady_Red",
"G_Lady_Blue",
"G_Diving",
"G_B_Diving",
"G_O_Diving",
"G_I_Diving",
"G_Goggles_VR",
"G_Balaclava_blk",
"G_Balaclava_oli",
"G_Balaclava_combat",
"G_Balaclava_lowprofile",
"G_Bandanna_blk",
"G_Bandanna_oli",
"G_Bandanna_khk",
"G_Bandanna_tan",
"G_Bandanna_beast",
"G_Bandanna_shades",
"G_Bandanna_sport",
"G_Bandanna_aviator",
"G_Shades_Blue",
"G_Sport_Blackred",
"G_Tactical_Clear",
"G_Balaclava_TI_blk_F",
"G_Balaclava_TI_tna_F",
"G_Balaclava_TI_G_blk_F",
"G_Balaclava_TI_G_tna_F",
"G_Combat_Goggles_tna_F",
"G_Respirator_base_F",
"G_Respirator_white_F",
"G_Respirator_yellow_F",
"G_Respirator_blue_F",
"G_EyeProtectors_base_F",
"G_EyeProtectors_F",
"G_EyeProtectors_Earpiece_F",
"G_WirelessEarpiece_base_F",
"G_WirelessEarpiece_F"];

FSNV_fn = {params ["_displayCode","_keyCode","_isShift","_isCtrl","_isAlt"];
	_handled = false;
	if ((_keyCode in actionKeys "NightVision") && (goggles player in FSNV)) then
	{
		switch FSNVMode do
		{
			case 0: {
				if (cameraView != "GUNNER") then
				{
					player action ["nvGoggles", player];
					FSNVMode = currentVisionMode player;
					_handled = true;
				};
			};
			case 1: {
				if (cameraView != "GUNNER") then
				{
					player action ["nvGogglesOff", player];
					FSNVMode = currentVisionMode player;
					_handled = true;
				};
			};
		};
	};
	_handled
};
waitUntil {alive player};
player addEventHandler ["GetOutMan", {
	params ["_player", "_role", "_vehicle", "_turret"];
	if (goggles _player in FSNV) then
	{
		switch FSNVMode do
		{
			case 1: {
				_player action ["nvGoggles", _player];
				FSNVMode = currentVisionMode _player;
			};
			case 0: {
				_player action ["nvGogglesOff", _player];
				FSNVMode = currentVisionMode _player;
			};
		};
	};
}];
player addEventHandler ["Put", {
	params ["_player", "_container", "_item"];
	if (goggles _player in FSNV) then
	{
		switch FSNVMode do
		{
			case 1: {
				_player action ["nvGoggles", _player];
				FSNVMode = currentVisionMode _player;
			};
			case 0: {
				_player action ["nvGogglesOff", _player];
				FSNVMode = currentVisionMode _player;
			};
		};
	};
}];
player addEventHandler ["Take", {
	params ["_player", "_container", "_item"];
	if (goggles _player in FSNV) then
	{
		switch FSNVMode do
		{
			case 1: {
				_player action ["nvGoggles", _player];
				FSNVMode = currentVisionMode _player;
			};
			case 0: {
				_player action ["nvGogglesOff", _player];
				FSNVMode = currentVisionMode _player;
			};
		};
	};
}];
FSNVMode = currentVisionMode player;
waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call FSNV_fn;"];