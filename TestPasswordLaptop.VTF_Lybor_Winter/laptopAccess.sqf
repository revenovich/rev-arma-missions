params ["_target", "_caller", "_password", "_promptMessage"];

// Request the password through chat
_caller globalChat _promptMessage;

input_password = nil;

// Listen for the player's input
_this spawn {
	params ["_target", "_caller", "_password", "_promptMessage"];

    waitUntil { !isNil "input_password" && {input_password != ""} };

    // Check the password
    if (input_password == _password) then {
        systemChat "Password correct. Access granted!";
		_target setVariable ["laptopAccess", true, true];
    } else {
        systemChat "Incorrect password. Access denied.";
		_target setVariable ["laptopAccess", false, true];
    };

    // Reset the input variable
    input_password = nil;
};