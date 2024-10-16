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

        [radioMan_1, "Jammer is now on, and start intercepting messages"] remoteExec ["sideChat", 0];
        missionNamespace setVariable ["isFinishRunAnim", true, true];
        [] spawn {
            sleep 1.5;
            missionNamespace setVariable ["isJammerOn", true, true];
            missionNamespace setVariable ["isFinishRunAnim", false, true];
        };
        
        if (missionNamespace getVariable "isShowSystemChat") then {
            textForSystemChat = format ["%1 %2", name _caller, "has turned on the jammer"];
            [textForSystemChat] remoteExec ["systemChat", 0];
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

        [radioMan_1, "Jammer is now off, and stop intercepting messages"] remoteExec ["sideChat", 0];
        missionNamespace setVariable ["isFinishRunAnim", true, true];
        [] spawn {
            sleep 1.5;
            missionNamespace setVariable ["isJammerOn", false, true];
            missionNamespace setVariable ["isFinishRunAnim", false, true];
        };
        if (missionNamespace getVariable "isShowSystemChat") then {
            textForSystemChat = format ["%1 %2", name _caller, "has turned off the jammer"];
            [textForSystemChat] remoteExec ["systemChat", 0];
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