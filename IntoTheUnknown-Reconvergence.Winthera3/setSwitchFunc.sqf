_this#0 animateSource ["switchposition",1];  
_this#0 animateSource ["light",0];  
_this#0 setDamage 1;  

_this#0 addAction  
[  
    "Turn On",  
    {  
        params ["_target", "_caller", "_actionId", "_arguments"];  
		_target animateSource ["switchposition",-1];  
		_target animateSource ["light",1];  
		_target setDamage 0;

        [radioMan_1, "Jammer is now on, and start intercepting messages"] remoteExec ["sideChat", 0];
    },  
    [],  
    1.5,  
    true,  
    true,  
    "",
    "!alive _target",  
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
		_target setDamage 1;  

        [radioMan_1, "Jammer is now off, and stop intercepting messages"] remoteExec ["sideChat", 0];
    },  
    [],
    1.5,  
    true,  
    true,  
    "",  
    "alive _target",  
    3,  
    false,  
    "",  
    ""  
];