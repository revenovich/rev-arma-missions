if (isServer) then {
	input_password = nil;
	publicVariable "input_password";
};

addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

    systemChat format ["Player %1 connected", _name];
}];
