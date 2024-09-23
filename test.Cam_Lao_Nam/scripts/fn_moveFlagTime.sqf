/*
	Flag Interact for Arma 3
	
	Author: Matthew Warner (Warnerm14)
	Site: www.twitter.com/Warnerm14
			
	Permission: 
		You may use the FlagInteract.pbo on your server without receiving permission from the Author.
		You may redistribute the FlagInteract.pbo as long as you give proper credit to the Author.
		You may not remove any code from the FlagInteract.pbo to use in your own mods/mission/projects without permission from the Author.
		You may repack the FlagInteract.pbo with edits made to the code as long as you do not modify the comment blocks.
		
	File Desc: Allows flags to be moved up and down over a set amount of time.
*/

_flag = _this select 0;
_time = _this select 1;
_direction = _this select 2;

_curTime = time;
_time = time + _time;
_curPos = (flagAnimationPhase _flag);
if (_flag getVariable ["animState",false]) exitWith {hint "Already animating!";};

if (_direction == 1) then {
	_flag setVariable ["animState",true,true];
	if (flagAnimationPhase _flag == 0) then {
		_flag forceFlagTexture "textures\vietnam-flag.jpg";
	}; 
	while {(flagAnimationPhase _flag) != 1} do {
		_newPos = _curPos + ((flagAnimationPhase _flag) - _curTime)*(_direction - _curPos)/(_time - _curTime);
		[_flag, _newPos] call BIS_fnc_animateFlag; 
	
		uiSleep 1;
	};
	_flag setVariable ["animState",false,true];
} else {
	_flag setVariable ["animState",true,true]; 
	_flag setVariable ["flagTxt",(flagTexture _flag),true]; 
	while {(flagAnimationPhase _flag) != 0} do {
		_newPos = _curPos + ((flagAnimationPhase _flag) - _curTime)*(_direction - _curPos)/(_time - _curTime);
		[_flag, _newPos] call BIS_fnc_animateFlag; 
	
		uiSleep 1;
	};
	_flag forceFlagTexture "\FlagInteract\textures\blank_ico.paa"; 
	_flag setVariable ["animState",false,true];
};