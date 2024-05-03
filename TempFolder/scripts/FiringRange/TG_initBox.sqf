
{
	// Current result is saved in variable _x

	[_x, {
		_this addAction ["Refill box", { 
			params ["_target", "_caller", "_actionId", "_arguments"]; 
			_target call reFillBox_Fnc;
		}, nil, 1.5, true, true, "", "true", 2];
	}] remoteExec ['call', 0 , _x]

} forEach gLauncherBoxArray;

{
	// Current result is saved in variable _x

	[_x, {
		_this addAction ["Refill box", { 
			params ["_target", "_caller", "_actionId", "_arguments"]; 
			_target call reFillGreBox_Fnc;
		}, nil, 1.5, true, true, "", "true", 2];
	}] remoteExec ['call', 0 , _x]
	
} forEach gGreBoxArray;

{
	// Current result is saved in variable _x

	[_x, {
		_this addAction ["Clear inventory box!", { 
  			params ["_target", "_caller", "_actionId", "_arguments"]; 
  			clearWeaponCargoGlobal _target;   
		}, nil, 1.5, true, true, "", "true", 3];
	}] remoteExec ['call', 0 , _x]
	
} forEach gTG_LauncherBoxArray;