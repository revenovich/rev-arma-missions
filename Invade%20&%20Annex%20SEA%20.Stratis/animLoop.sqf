_unit = _this select 0;
_animation = _this select 1;
_slp = _this select 2;
_noWeapons = _this select 3;
_switchMove = _this select 4;

_unit DisableAI "ANIM";
_unit setDamage 0;
_unit setVariable ["BIS_noCoreConversations", true];
if (_noWeapons) then {removeAllWeapons _unit};
sleep _slp;
if (_switchMove) then {
	while {true} do {
	    _unit playMoveNow _animation;
		sleep .1;
		_unit switchMove _animation;
		waitUntil {animationState _unit != _animation};
	};
} else {
	while {true} do {
		_unit playMoveNow _animation;
		sleep .1;
		_unit playMove _animation;
		sleep .1;
		_unit switchMove _animation;
		waitUntil {animationState _unit != _animation};
	};
};