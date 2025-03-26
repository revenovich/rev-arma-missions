params ["_object", "_targetPos", "_rotateDuration", "_startMoveDuration", "_moveDuration", "_shipVarJumpIn", "_isReversedRotation"];

fn_smoothSetPos = {
    params ["_object", "_pos", "_time"];
    
    private _startPos = getPosASL _object;
    private _endPos = _pos;
    private _startTime = time;
    private _endTime = _startTime + _time;
    
    [_object, _startPos, _endPos, _time] spawn {
        params ["_object", "_startPos", "_endPos", "_time"];
        
        private _startTime = time;
        private _endTime = _startTime + _time;
		private _currentDir = vectorDir _object;
		private _currentUp = vectorUp _object;
        
        while {time < _endTime} do {
            private _progress = (time - _startTime) / _time;
            private _interpolatedZ = (_startPos select 2) + ((_endPos select 2) - (_startPos select 2)) * _progress;
            private _currentPos = [_startPos select 0, _startPos select 1, _interpolatedZ];
            _object setPosASL _currentPos;
			_object setVectorDirAndUp [_currentDir, _currentUp];
            sleep 0.01;
        };
        
        _object setPosASL _endPos;
		_object setVectorDirAndUp [_currentDir, _currentUp];
    };
};

[_object, _targetPos, _rotateDuration, _startMoveDuration, _moveDuration, _shipVarJumpIn, _isReversedRotation] spawn {
    params ["_object", "_targetPos", "_rotateDuration", "_startMoveDuration", "_moveDuration", "_shipVarJumpIn", "_isReversedRotation"];
    
	waitUntil {(missionNamespace getVariable [format ["%1", _shipVarJumpIn], false])};

	_targetPos set [2, (_targetPos#2) + 100];

	// Rotate the object to face the target position first
	private _dx = (_targetPos select 0) - (getPosASL _object select 0);
	private _dy = (_targetPos select 1) - (getPosASL _object select 1);
	private _targetDir = (_dx atan2 _dy);

	if (_targetDir < 0) then { _targetDir = _targetDir + 360; };

	private _currentDir = getDir _object;
	private _rotateDegrees = _targetDir - _currentDir;
	if (_rotateDegrees > 180) then { _rotateDegrees = _rotateDegrees - 360; };
	if (_rotateDegrees < -180) then { _rotateDegrees = _rotateDegrees + 360; };

	if (_isReversedRotation) then {
		_rotateDegrees = -_rotateDegrees;
	};

	private _steps = _rotateDuration / 0.01;
	private _stepSize = _rotateDegrees / _steps;

	for "_i" from 1 to _steps do {
		_currentDir = _currentDir + _stepSize;
		if (_currentDir < 0) then { _currentDir = _currentDir + 360; };
		if (_currentDir > 360) then { _currentDir = _currentDir - 360; };
		
		_object setDir _currentDir;
		sleep 0.01;
	};

	sleep 0.2;

	private _currentPos = getPosASL _object;
	_currentDir = vectorDir _object;
	_currentUp = vectorUp _object;

	_object setPos [_currentPos select 0, _currentPos select 1, _targetPos select 2];
	_object setVectorDirAndUp [_currentDir, _currentUp];

	sleep 0.1;

	// Start move object slowly by set position repeatly
	// to make it look like it's accelerating
	// Don't change object's height position and direction
	private _currentPos = getPosASL _object;
	private _dx = (_targetPos select 0) - (_currentPos select 0);
	private _dy = (_targetPos select 1) - (_currentPos select 1);
	private _steps = _startMoveDuration / 0.01;
	private _stepSizeX = _dx / _steps;
	private _stepSizeY = _dy / _steps;

	for "_i" from 1 to _steps do {
		_currentPos set [0, (_currentPos select 0) + _stepSizeX];
		_currentPos set [1, (_currentPos select 1) + _stepSizeY];
		_currentPos set [2, _targetPos select 2];

		_currentDir = vectorDir _object;
		_currentUp = vectorUp _object;

		_object setPosASL _currentPos;
		_object setVectorDirAndUp [_currentDir, _currentUp];
		sleep 0.01;
	};

	// Move object to target position quickly by set position repeatly
	// to make it look like it's moving at constant speed
	// Don't change object's height position and direction
	_currentPos = getPosASL _object;
	_dx = (_targetPos select 0) - (_currentPos select 0);
	_dy = (_targetPos select 1) - (_currentPos select 1);
	_steps = _moveDuration / 0.01;
	_stepSizeX = _dx / _steps;
	_stepSizeY = _dy / _steps;

	for "_i" from 1 to _steps do {
		_currentPos set [0, (_currentPos select 0) + _stepSizeX];
		_currentPos set [1, (_currentPos select 1) + _stepSizeY];
		_currentPos set [2, _targetPos select 2];
		_currentDir = vectorDir _object;
		_currentUp = vectorUp _object;

		_object setPosASL _currentPos;
		_object setVectorDirAndUp [_currentDir, _currentUp];
		sleep 0.1;
	};

	sleep 1;

	private _currentPos = getPosASL _object;
	private _maxZ = (_currentPos select 2) + 100;
	private _minZ = (_currentPos select 2) - 20;
	private _maxUpdateTime = 10;
	private _minUpdateTime = 5;
    private _currentZ = _currentPos select 2;
    private _direction = 50;
    
    while {true} do {
        private _updateTime = random [_minUpdateTime, (_minUpdateTime + _maxUpdateTime) / 2, _maxUpdateTime];
        private _targetZ = _currentZ + (_direction * 1);
        
        if (_targetZ >= _maxZ) then {
            _targetZ = _maxZ;
            _direction = -50;
        } else {
            if (_targetZ <= _minZ) then {
                _targetZ = _minZ;
                _direction = 50;
            };
        };
        
        [_object, [getPosASL _object select 0, getPosASL _object select 1, _targetZ], _updateTime] call fn_smoothSetPos;
        
        _currentZ = _targetZ;
        sleep _updateTime;
    };
};