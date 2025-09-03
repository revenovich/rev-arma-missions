[] spawn {
	if (isDedicated && !isServer) exitWith {};

	_mk = createMarker ["fpsmarker", [0, -500]];
	_mk setMarkerType "mil_dot";
	_mk setMarkerSize [0,0];

	_mk1 = createMarker ["minFpsMarker", [0, -700]];
	_mk1 setMarkerType "mil_dot";
	_mk1 setMarkerSize [0,0];

	_mk2 = createMarker ["maxFpsMarker", [0, -900]];
	_mk2 setMarkerType "mil_dot";
	_mk2 setMarkerSize [0,0];

	_mk3 = createMarker ["averageLast10FpsMarker", [0, -1100]];
	_mk3 setMarkerType "mil_dot";
	_mk3 setMarkerSize [0,0];

	missionNamespace setVariable ["minFps", (round (diag_fps * 100.0)) / 100.0, true];
	missionNamespace setVariable ["maxFps", (round (diag_fps * 100.0)) / 100.0, true];
	missionNamespace setVariable ["averageLast10Fps", [(round (diag_fps * 100.0)) / 100.0], true];

	_mk1 setMarkerText format ["MIN FPS: %1", (round (diag_fps * 100.0)) / 100.0];
	_mk2 setMarkerText format ["MAX FPS: %1", (round (diag_fps * 100.0)) / 100.0];
	_mk3 setMarkerText format ["AVERAGE LAST 10 FPS: %1", (round (diag_fps * 100.0)) / 100.0];

	while {true} do {
		_currentFps = (round (diag_fps * 100.0)) / 100.0;
		_mk setMarkerText format ["CURRENT FPS: %1 fps", _currentFps];

		_minFps = missionNamespace getVariable ["minFps", 0];
		if (_currentFps < _minFps) then {
			_mk1 setMarkerText format ["MIN FPS: %1", _currentFps];
			missionNamespace setVariable ["minFps", _currentFps, true];
		};

		_maxFps = missionNamespace getVariable ["maxFps", 0];
		if (_currentFps > _maxFps) then {
			_mk2 setMarkerText format ["MAX FPS: %1", _currentFps];
			missionNamespace setVariable ["maxFps", _currentFps, true];
		};

		_averageLast10Fps = missionNamespace getVariable ["averageLast10Fps", []];
		if (count _averageLast10Fps > 9) then {
			_averageLast10Fps = _averageLast10Fps - [_averageLast10Fps select 0];
			_averageLast10Fps = _averageLast10Fps + [_currentFps];
		} else {
			_averageLast10Fps pushBack _currentFps;
		};

		_average = 0;
		{
			_average = _average + _x;
		} forEach _averageLast10Fps;
		_average = _average / count _averageLast10Fps;

		_mk3 setMarkerText format ["AVERAGE LAST 10 FPS CHECK: %1", _average];

		sleep 2;
	};
};

