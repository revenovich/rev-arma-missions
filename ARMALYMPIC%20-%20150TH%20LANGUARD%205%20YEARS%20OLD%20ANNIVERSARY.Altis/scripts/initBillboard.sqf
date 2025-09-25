params ["_bb", "_screenNum", "_r2tName"];

private _att = "#(argb,512,512,1)r2t(" + _r2tName + ",1)";

for "_i" from 0 to _screenNum do {
	_bb setObjectTexture [_i, _att];
};