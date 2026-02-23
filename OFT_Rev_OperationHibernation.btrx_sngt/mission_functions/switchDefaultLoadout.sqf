if (isServer) then {
    isDefaultLoadoutFirstRun = false;
    publicVariable "isDefaultLoadoutFirstRun";

    isDefaultLoadoutOn = false;
    publicVariable "isDefaultLoadoutOn";

    isDefaultLoadoutFinishRunAnim = false;
    publicVariable "isDefaultLoadoutFinishRunAnim";
};

if (missionNamespace getVariable "isDefaultLoadoutFirstRun") then {
    _this#0 animateSource ["switchposition",1];  
    _this#0 animateSource ["light",0];

    missionNamespace setVariable ["isAutoGear", false, true];
    missionNamespace setVariable ["isDefaultLoadoutFirstRun", false, true];
};

_this#0 addAction  
[  
    "Turn On Auto Set Gear",
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",-1];  
		_target animateSource ["light",1];

        // Insert code below to use
        missionNamespace setVariable ["isAutoGear", true, true];
        //

        missionNamespace setVariable ["isDefaultLoadoutFinishRunAnim", true, true];
        [] spawn {
            sleep 1.5;
            missionNamespace setVariable ["isDefaultLoadoutOn", true, true];
            missionNamespace setVariable ["isDefaultLoadoutFinishRunAnim", false, true];
        };
    },  
    [],  
    1.5,  
    true,  
    true,  
    "",
    "!(missionNamespace getVariable 'isDefaultLoadoutOn') && !(missionNamespace getVariable 'isDefaultLoadoutFinishRunAnim')",  
    3,  
    false,  
    "",  
    ""  
];

_this#0 addAction
[  
    "Turn Off Auto Set Gear",
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",1];  
		_target animateSource ["light",0];

        // Insert code below to use
        missionNamespace setVariable ["isAutoGear", false, true];
        //


        missionNamespace setVariable ["isDefaultLoadoutFinishRunAnim", true, true];
        [] spawn {
            sleep 1.5;
            missionNamespace setVariable ["isDefaultLoadoutOn", false, true];
            missionNamespace setVariable ["isDefaultLoadoutFinishRunAnim", false, true];
        };
    },  
    [],
    1.5,  
    true,  
    true,  
    "",  
    "missionNamespace getVariable 'isDefaultLoadoutOn' && !(missionNamespace getVariable 'isDefaultLoadoutFinishRunAnim')",  
    3,  
    false,  
    "",  
    ""  
];