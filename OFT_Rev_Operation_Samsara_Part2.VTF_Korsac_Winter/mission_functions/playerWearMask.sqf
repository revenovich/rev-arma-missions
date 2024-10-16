[_this#0] spawn {
    params ["_player"];

    // Variables for tracking damage
    _player setVariable ["isWearingGasMask", true, true];
    _player setVariable ["currentBodyDamage", 0, true];
    _player setVariable ["currentHeadDamage", 0, true];

    // Name of the gas mask that protects the player
    _gasMaskName = "USP_SOLR";
    
    // Timer for how long the player has been exposed
    _exposureTime = 0;

    while {alive _player} do {
        _gasMaskPlayer = goggles _player; // Check what goggles the player is wearing
        _isWearingCorrectGasMask = [_gasMaskName, _gasMaskPlayer] call BIS_fnc_inString;

        if (!_isWearingCorrectGasMask) then {
            // Player is not wearing the correct gas mask, start applying damage over time
            
            _exposureTime = _exposureTime + 1;

            // Apply damage to the body first, slowly
            if (_exposureTime > 5 && _exposureTime <= 15) then {
                _currentBodyDamage = _player getVariable ["currentBodyDamage", 0];
                if (_currentBodyDamage < 1) then {
                    _currentBodyDamage = _currentBodyDamage + 0.05; // Increment body damage
                    _player setVariable ["currentBodyDamage", _currentBodyDamage, true];
                    [_player, _currentBodyDamage, "Body", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
                };
            };

            // After a certain amount of exposure, start applying damage to the head
            if (_exposureTime > 15 && _exposureTime <= 25) then {
                _currentHeadDamage = _player getVariable ["currentHeadDamage", 0];
                if (_currentHeadDamage < 1) then {
                    _currentHeadDamage = _currentHeadDamage + 0.05; // Increment head damage
                    _player setVariable ["currentHeadDamage", _currentHeadDamage, true];
                    [_player, _currentHeadDamage, "Head", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
                };
            };

            // If the exposure time exceeds 25 seconds, apply lethal damage
            if (_exposureTime > 25) then {
                [_player, 1, "Head", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit; // Fatal headshot
                [_player, 1, "Body", "poison", objNull, [], true] call ace_medical_fnc_addDamageToUnit; // Fatal body damage
            };

        } else {
            // Reset exposure time if wearing the correct gas mask
            _exposureTime = 0;
            _player setVariable ["currentBodyDamage", 0, true];
            _player setVariable ["currentHeadDamage", 0, true];
        };

        sleep 1; // Check every second
    };
};
