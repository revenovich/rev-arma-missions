[_this#0, 	
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_this setVariable ["actionIdZeusMenu", _this addAction ["Open Zeus Support Menu", 
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			if (["p_", str (_caller)] call BIS_fnc_inString) then {
				[_caller] execVM "scripts\Players\zeusAction.sqf";
			} else {
				titleText [format ["%1 is not in zeus position", name _caller], "PLAIN", 1];
			};
		}, [], 1.5, false, true, "", 'true', 3]];
	}
] remoteExec ["call"];