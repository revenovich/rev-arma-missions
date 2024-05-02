gActionIdZeusSupportArray = ["actionIDHeal", "actionIDDel1", "actionIDDel2", "actionIDDel3"];

[_this#0, {
	_tempActionId = _this getVariable ["actionIdZeusMenu", -1];
	if (_tempActionId > -1) then {
		_this removeAction _tempActionId;
	}
}] remoteExec ["call"];

[_this#0, {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_this setVariable [(gActionIdZeusSupportArray#0), _target addAction ["Heal All",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target, {
			params ["_target", "_caller", "_actionId", "_arguments"];
			private _headlessClients = entities "HeadlessClient_F"; 
			private _humanPlayers = allPlayers - _headlessClients; 
			{_x call ace_medical_treatment_fnc_fullHealLocal} forEach _humanPlayers;
		}] remoteExec ["call"];
		[_target] call zeusMenu_Back_Fnc;
	}, [], 1.5, false, true, "", 'true', 3]];
}] remoteExec ["call"];

[_this#0, {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_this setVariable [(gActionIdZeusSupportArray#1), _target addAction ["Delete All Dead Corpse And Destroyed Object",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		{

			_pNearestObj = nearestObjects [_x, ["all"], 20];
			{
				// Current result is saved in variable _x
				if (!(isNull _x)) then {	
					if (damage _x >= 1) then {
						deleteVehicle _x;
					};
				};
			} forEach _pNearestObj;
			deleteVehicle _x;

		} forEach allDeadMen;
		[_target] call zeusMenu_Back_Fnc;
	}, [_this], 1.5, false, true, "", 'true', 3]];
}] remoteExec ["call"];

[_this#0, {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_this setVariable [(gActionIdZeusSupportArray#2), _target addAction ["Delete All Damaged Object",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		{
			if (damage _x >= 0.6) then {
				deleteVehicle _x;
			};
			
		} forEach (allMissionObjects "all");
		[_target] call zeusMenu_Back_Fnc;
	}, [_this], 1.5, false, true, "", 'true', 3]];
}] remoteExec ["call"];

[_this#0, {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_this setVariable [(gActionIdZeusSupportArray#3), _target addAction ["Delete All Destroyed Object",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		{
			if (damage _x >= 1) then {
				deleteVehicle _x;
			};
			
		} forEach (allMissionObjects "all");
		[_target] call zeusMenu_Back_Fnc;
	}, [_this], 1.5, false, true, "", 'true', 3]];
}] remoteExec ["call"];

[_this#0, {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_this setVariable ["actionIDZeus", _target addAction ["Open Zues",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target] call zeusMenu_Back_Fnc;
		openCuratorInterface;

	}, [_this], 1.5, false, true, "", 'true', 3]];
}] remoteExec ["call"];

[_this#0, {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_this setVariable ["actionIDBack", _target addAction ["Back to Zues Support Menu",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target] call zeusMenu_Back_Fnc;

	}, [_this], 1.5, false, true, "", 'true', 3]];
}] remoteExec ["call"];

zeusMenu_RemoveAct_Fnc = {
	params ["_attachedObj", "_pActionIdArray"];
	_tempAction0 = _attachedObj getVariable [(gActionIdZeusSupportArray#0), -1];
	_tempAction1 = _attachedObj getVariable [(gActionIdZeusSupportArray#1), -1];
	_tempAction2 = _attachedObj getVariable [(gActionIdZeusSupportArray#2), -1];
	_tempAction3 = _attachedObj getVariable [(gActionIdZeusSupportArray#3), -1];

	if (_tempAction0 > -1) then {
		_attachedObj removeAction _tempAction0;
	};

	if (_tempAction1 > -1) then {
		_attachedObj removeAction _tempAction1;
	};

	if (_tempAction2 > -1) then {
		_attachedObj removeAction _tempAction2;
	};

	if (_tempAction3 > -1) then {
		_attachedObj removeAction _tempAction3;
	};
};

zeusMenu_Back_Fnc = {
	params ["_target"];
	[_target] call zeusMenu_RemoveAct_Fnc;
	[_target] execVM "scripts\Players\initZeusMenu.sqf";
	_tempActionIdBack = _target getVariable ["actionIDBack", -1];
	_target removeAction _tempActionIdBack;
	_tempActionIdBack = _target getVariable ["actionIDZeus", -1];
	_target removeAction _tempActionIdBack;
}