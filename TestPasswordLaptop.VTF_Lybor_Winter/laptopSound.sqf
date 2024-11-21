params ["_target", "_caller"];

_volume = 3;
_pitch = 1;
_range = 200;
_isInside = true;
_soundFile = "recording.ogg";

playSound3D [getMissionPath _soundFile, _target, _isInside, getPosASL _target, _volume, _pitch, _range];