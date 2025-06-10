fn_checkKey = {
	params ["_this"];
	private _isHave = false;
	{
		if (_x == "Keys") then {
			_isHave = true;
		};
	} forEach uniformItems _this;
	{
		if (_x == "Keys") then {
			_isHave = true;
		};
	} forEach backpackItems _this;
	{
		if (_x == "Keys") then {
			_isHave = true;
		};
	} forEach vestItems _this;
	_isHave
};

publicVariable "fn_checkKey";

fn_evil_laugh_normal = {
	params ["_source", "_dist", "_runtime"];

	_path = getMissionPath "files\evil-laugh.ogg";

	for "_i" from 1 to _runtime do {
		playSound3D [_path, _source, false, getPosASL _source, 5, 1, _dist];
	};
};

publicVariable "fn_evil_laugh_normal";

fn_evil_demonic_laugh = {
	params ["_source", "_dist", "_runtime"];

	_path = getMissionPath "files\evil-demonic-laugh.ogg";

	for "_i" from 1 to _runtime do {
		playSound3D [_path, _source, false, getPosASL _source, 5, 1, _dist];
	};
};

publicVariable "fn_evil_demonic_laugh";

fn_evil_laugh = {
	params ["_type", "_source", "_dist", "_runtime"];
	if (_type == "") then {
		_type = "normal";
	};

	if (_type == "normal") then {
		[_source, _dist, _runtime] call fn_evil_laugh_normal;
	};
	if (_type == "demonic") then {
		[_source, _dist, _runtime] call fn_evil_demonic_laugh;
	};
};

publicVariable "fn_evil_laugh";