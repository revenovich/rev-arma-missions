params ["_object", "_maxZ", "_minZ", "_maxUpdateTime", "_minUpdateTime"];

fn_smoothSetPos = {
    params ["_object", "_pos", "_time"];
    
    private _startPos = getPos _object;
    private _endPos = _pos;
    private _startTime = time;
    private _endTime = _startTime + _time;
    
    [_object, _startPos, _endPos, _time] spawn {
        params ["_object", "_startPos", "_endPos", "_time"];
        
        private _startTime = time;
        private _endTime = _startTime + _time;
        
        while {time < _endTime} do {
            private _progress = (time - _startTime) / _time;
            private _interpolatedZ = (_startPos select 2) + ((_endPos select 2) - (_startPos select 2)) * _progress;
            private _currentPos = [_startPos select 0, _startPos select 1, _interpolatedZ];
            _object setPos _currentPos;
            sleep 0.01;
        };
        
        _object setPos _endPos;
    };
};

[_object, _maxZ, _minZ, _maxUpdateTime, _minUpdateTime] spawn {
    params ["_object", "_maxZ", "_minZ", "_maxUpdateTime", "_minUpdateTime"];
    
    private _currentZ = getPos _object select 2;
    private _direction = 1;
    
    while {true} do {
        private _updateTime = random [_minUpdateTime, (_minUpdateTime + _maxUpdateTime) / 2, _maxUpdateTime];
        private _targetZ = _currentZ + (_direction * 1);
        
        if (_targetZ >= _maxZ) then {
            _targetZ = _maxZ;
            _direction = -1;
        } else {
            if (_targetZ <= _minZ) then {
                _targetZ = _minZ;
                _direction = 1;
            };
        };
        
        [_object, [getPos _object select 0, getPos _object select 1, _targetZ], _updateTime] call fn_smoothSetPos;
        
        _currentZ = _targetZ;
        sleep _updateTime;
    };
};
