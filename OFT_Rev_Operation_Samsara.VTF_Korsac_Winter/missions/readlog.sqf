[_this#0, { 
	_this addAction ["<t color='#FF0000'>Read Log</t>", {  
		params ["_target", "_caller", "_actionId", "_arguments"];  
		[] spawn {
			format [
				"Log #1: Send help to the coordinates: %1", 009049
			] remoteExec ["systemChat", -2];
			sleep 20;
			format [
				"Log #2: They can not be dead, they will come again. They can not be dead, they will come again. They can not be dead, they will come again. They can not be dead, they will come again. They can not be dead, they will come again."
			] remoteExec ["systemChat", -2];
			sleep 30;
			format [
				"Log #3: Do not forget. Do not forget. Do not forget. Do not forget. Do not forget. Do not forget. Do not forget. Do not forget. Do not forget. Do not forget."
			] remoteExec ["systemChat", -2];

			missionNamespace setVariable ["readLog", true, true];
		};
	}, nil, 1.5, true, true, "", "
		!(missionNamespace getVariable ['readLog', false])
	", 3];
}] remoteExec ['call', [0,-2] select isDedicated];