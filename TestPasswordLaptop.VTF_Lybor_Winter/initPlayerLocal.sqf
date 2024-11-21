addMissionEventHandler ["HandleChatMessage", {
    params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType", "_params"];

    // Example: Log the chat message
    diag_log format ["[CHAT] Channel: %1 | From: %2 (%3) | Message: '%4'", _channel, _name, _strID, _text];

    // Example: Block messages containing a banned word
    if (_text == "halas#2024") then {
        input_password = _text;
    }; 

    false
}];