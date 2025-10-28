if (isServer) then {
    isFirstRun = true;
    publicVariable "isFirstRun";

    isJammerOn = false;
    publicVariable "isJammerOn";

    isFinishRunAnim = false;
    publicVariable "isFinishRunAnim";
};

if (missionNamespace getVariable "isFirstRun") then {
    _this#0 animateSource ["switchposition",1];  
    _this#0 animateSource ["light",0];

    missionNamespace setVariable ["isFirstRun", false, true];
};

_this#0 addAction  
[  
    "Turn On",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",-1];  
		_target animateSource ["light",1];

        [_caller, "Sound barrier is on"] remoteExec ["sideChat", 0];
        missionNamespace setVariable ["isFinishRunAnim", true, true];
        [] spawn {
            sleep 1.5;
            missionNamespace setVariable ["isJammerOn", true, true];
            missionNamespace setVariable ["isFinishRunAnim", false, true];
        };
    },  
    [],  
    1.5,  
    true,  
    true,  
    "",
    "!(missionNamespace getVariable 'isJammerOn') && !(missionNamespace getVariable 'isFinishRunAnim')",  
    3,  
    false,  
    "",  
    ""  
];

_this#0 addAction
[  
    "Turn Off",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",1];  
		_target animateSource ["light",0];

        [_caller, "Sound barrier is off"] remoteExec ["sideChat", 0];
        missionNamespace setVariable ["isFinishRunAnim", true, true];
        [] spawn {
            sleep 1.5;
            missionNamespace setVariable ["isJammerOn", false, true];
            missionNamespace setVariable ["isFinishRunAnim", false, true];
        };
    },  
    [],
    1.5,  
    true,  
    true,  
    "",  
    "missionNamespace getVariable 'isJammerOn' && !(missionNamespace getVariable 'isFinishRunAnim')",  
    3,  
    false,  
    "",  
    ""  
];