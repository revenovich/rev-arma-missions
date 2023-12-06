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
	}, nil, 1.5, true, true, "", "true", 5];
}] remoteExec ['call', 0 , _this#0]
