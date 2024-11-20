if (isServer) then {
	input_password = nil;
	publicVariable "input_password";
};


addMissionEventHandler ["HandleChatMessage", {
    params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType", "_params"];

    // Example: Log the chat message
    diag_log format ["[CHAT] Channel: %1 | From: %2 (%3) | Message: '%4'", _channel, _name, _strID, _text];

    // Example: Block messages containing a banned word
    if (_text find "bannedWord" >= 0) then {
        diag_log format ["Blocked message from %1: %2", _name, _text];
        true
    } else {
		input_password = _text;
        false
    };
}];
