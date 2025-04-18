params ["_object", "_startHeight", "_endHeight", "_duration"];

private _startPos = getPosATL _object;
private _startTime = time;
private _endTime = _startTime + _duration;

[_object, _startHeight, _endHeight, _duration, _startPos] spawn {
	params ["_object", "_startHeight", "_endHeight", "_duration", "_startPos"];
	
	private _startTime = time;
	private _endTime = _startTime + _duration;
	
	while {time < _endTime} do {
		private _progress = (time - _startTime) / _duration;
		private _acceleration = _progress * _progress; // Simulating gravity
		private _currentHeight = _startHeight + (_endHeight - _startHeight) * _acceleration;
		_object setPosATL [_startPos select 0, _startPos select 1, _currentHeight];
		sleep 0.01;
	};
	
	_object setPosATL [_startPos select 0, _startPos select 1, _endHeight];
};