if (isServer) then {
	sentence_1 = "O Earthly Mother";
	sentence_2 = "To the Sacred All-Father";
	sentence_3 = "And the Unity of Brothers";
	sentence_4 = "Punish your children";
	sentence_5 = "For they have tainted this land";
	sentence_6 = "But forgive their brothers and sisters";
	sentence_7 = "For they have not sinned";

	publicVariable "sentence_1";
	publicVariable "sentence_2";
	publicVariable "sentence_3";
	publicVariable "sentence_4";
	publicVariable "sentence_5";
	publicVariable "sentence_6";
	publicVariable "sentence_7";

	diag_log "Prayer sentences initialized";

	sentence_1_match = false;
	sentence_2_match = false;
	sentence_3_match = false;
	sentence_4_match = false;
	sentence_5_match = false;
	sentence_6_match = false;
	sentence_7_match = false;

	publicVariable "sentence_1_match";
	publicVariable "sentence_2_match";
	publicVariable "sentence_3_match";
	publicVariable "sentence_4_match";
	publicVariable "sentence_5_match";
	publicVariable "sentence_6_match";
	publicVariable "sentence_7_match";

	diag_log "Prayer sentence matches initialized";

	strikePosArray = [strikePos_1, strikePos_2, strikePos_3, strikePos_4, strikePos_5, strikePos_6, strikePos_7, strikePos_8, strikePos_9, strikePos_10, strikePos_11, strikePos_12, strikePos_13];
	publicVariable "strikePosArray";

	diag_log "Strike positions initialized";

	// Function to execute random strike position
	fn_executeRandomStrikePos = {
		params ["_randomStrikePos"];
		diag_log format ["[CHAT] Executing random strike position: %1", _randomStrikePos];

		_tempTarget = createSimpleObject ["Land_HelipadEmpty_F", getPosASL _randomStrikePos];
		[_tempTarget, nil, true] spawn BIS_fnc_moduleLightning;
	};
	publicVariable "fn_executeRandomStrikePos";

	diag_log "Random strike position execution function initialized";

	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType", "_params"];

		diag_log format ["[CHAT] Channel: %1 | From: %2 (%3) | Message: '%4'", _channel, _name, _strID, _text];

		_isPrayerInAltar = _person inArea altarArea_1;

		if (_isPrayerInAltar) then {
			if (_text == sentence_1
				&& !sentence_1_match
				&& !sentence_2_match
				&& !sentence_3_match
				&& !sentence_4_match
				&& !sentence_5_match
				&& !sentence_6_match
				&& !sentence_7_match) then {
			sentence_1_match = true;
			publicVariable "sentence_1_match";
			
			// Choose 4 random positions to strike
			_randomStrikePosArray = [];
			for "_i" from 1 to 4 do {
				_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
				_randomStrikePosArray pushBack _randomStrikePos;
			};
			
			{
				[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];
			} forEach _randomStrikePosArray;

			};
			
			if (_text == sentence_2
					&& sentence_1_match
					&& !sentence_2_match
					&& !sentence_3_match
					&& !sentence_4_match
					&& !sentence_5_match
					&& !sentence_6_match
					&& !sentence_7_match) then {
				sentence_2_match = true;
				publicVariable "sentence_2_match";

				// Choose 5 random positions to strike
				_randomStrikePosArray = [];
				for "_i" from 1 to 5 do {
					_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
					_randomStrikePosArray pushBack _randomStrikePos;
				};
				
				{
					[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];
				} forEach _randomStrikePosArray;

			};

			if (_text == sentence_3
					&& sentence_1_match
					&& sentence_2_match
					&& !sentence_3_match
					&& !sentence_4_match
					&& !sentence_5_match
					&& !sentence_6_match
					&& !sentence_7_match) then {
				sentence_3_match = true;
				publicVariable "sentence_3_match";

				// Choose 6 random positions to strike
				_randomStrikePosArray = [];
				for "_i" from 1 to 6 do {
					_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
					_randomStrikePosArray pushBack _randomStrikePos;
				};
				
				{
					[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];
				} forEach _randomStrikePosArray;

			};
			
			if (_text == sentence_4
					&& sentence_1_match
					&& sentence_2_match
					&& sentence_3_match
					&& !sentence_4_match
					&& !sentence_5_match
					&& !sentence_6_match
					&& !sentence_7_match) then {
				sentence_4_match = true;
				publicVariable "sentence_4_match";

				// Choose 7 random positions to strike
				_randomStrikePosArray = [];
				for "_i" from 1 to 7 do {
					_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
					_randomStrikePosArray pushBack _randomStrikePos;
				};
				
				{
					[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];
				} forEach _randomStrikePosArray;

			};
			
			if (_text == sentence_5
					&& sentence_1_match
					&& sentence_2_match
					&& sentence_3_match
					&& sentence_4_match
					&& !sentence_5_match
					&& !sentence_6_match
					&& !sentence_7_match) then {
				sentence_5_match = true;
				publicVariable "sentence_5_match";

				// Choose 7 random positions to strike
				_randomStrikePosArray = [];
				for "_i" from 1 to 7 do {
					_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
					_randomStrikePosArray pushBack _randomStrikePos;
				};
				
				{
					[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];
				} forEach _randomStrikePosArray;

			};
			
			if (_text == sentence_6
					&& sentence_1_match
					&& sentence_2_match
					&& sentence_3_match
					&& sentence_4_match
					&& sentence_5_match
					&& !sentence_6_match
					&& !sentence_7_match) then {
				sentence_6_match = true;
				publicVariable "sentence_6_match";

				// Choose 6 random positions to strike
				_randomStrikePosArray = [];
				for "_i" from 1 to 6 do {
					_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
					_randomStrikePosArray pushBack _randomStrikePos;
				};
				
				{
					[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];
				} forEach _randomStrikePosArray;

			};
			
			if (_text == sentence_7
					&& sentence_1_match
					&& sentence_2_match
					&& sentence_3_match
					&& sentence_4_match
					&& sentence_5_match
					&& sentence_6_match
					&& !sentence_7_match) then {
				sentence_7_match = true;
				publicVariable "sentence_7_match";

				// Choose 20 random positions to strike
				_randomStrikePosArray = [];
				for "_i" from 1 to 20 do {
					_randomStrikePos = strikePosArray call BIS_fnc_selectRandom;
					_randomStrikePosArray pushBack _randomStrikePos;
				};
				
				_index = 0;
				{
					_index = _index + 1;

					[_x, _index] spawn {
						params ["_x", "_index"];
						sleep (_index / 2);
						[[_x], fn_executeRandomStrikePos] remoteExec ['call', [0,-2] select isDedicated, true];

						if (_index == 20) then {
							boss_1 setVariable ["oft_maxDamage", 2000, true];
							[["<t color='#ffffff' size='3'>WISH GRANTED!</t>", "PLAIN", -1, true, true]] remoteExec ["cutText", [0,-2] select isDedicated];
						};
					};

				} forEach _randomStrikePosArray;

			};
		};

		false
	}];

	diag_log "Chat message handler initialized";
};


