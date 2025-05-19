/*
   This script adds an action to a snowman object that triggers an explosion when activated.
   The snowman object is deleted after the explosion.
*/

/*
	This script adds an action to a snowman object that allows players to interact with it.
	When the action is triggered, the snowman explodes and a "Lovely snowman want a hug <3" message is displayed.
	The snowman is replaced with a "R_80mm_HE" explosive and then deleted.
*/

[_this#0, { 
	_this addAction ["<t color='#FF0000'>Lovely snowman want a hug &lt;3</t>", {  
		params ["_target", "_caller", "_actionId", "_arguments"];  
		"R_80mm_HE" createVehicle (position _target);
		deleteVehicle _target;
		[_target] spawn {
			params ["_target"];

			// Get all units within 30 meters of the snowman
			_nearby_units = _target nearEntities 30;

			sleep 10;

			// Heal all nearby units
			{
				// Current result is saved in variable _x
				_x setDamage 0;
				["ace_medical_treatment_fullHealLocal", _x, _x] call CBA_fnc_targetEvent;
				[_x, false] call ace_medical_fnc_setUnconscious;
			} forEach _nearby_units;
		};
	}, nil, 1.5, true, true, "", "true", 2];
}] remoteExec ['call', [0,-2] select isDedicated];
