params ["_target", "_caller", "_password", "_promptMessage"];

// Request the password through chat
[_caller, _promptMessage] remoteExec ["globalChat", 0];

input_password = nil;

// Listen for the player's input
_this spawn {
	params ["_target", "_caller", "_password", "_promptMessage"];

    waitUntil { !isNil "input_password" && {input_password != ""} };

    // Check the password
    if (input_password == _password) then {
        "Password correct. Access granted!" remoteExec ["systemChat", 0];
		_target setVariable ["laptopAccess", true, true];
    } else {
        "Incorrect password. Access denied!" remoteExec ["systemChat", 0];
		_target setVariable ["laptopAccess", false, true];
    };

    // Reset the input variable
    input_password = nil;
};