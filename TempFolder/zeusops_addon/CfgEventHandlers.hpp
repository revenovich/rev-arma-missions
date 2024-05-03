class Extended_PreStart_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\zeusops_addon\XEH_preStart.sqf'";
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\zeusops_addon\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = "call compile preprocessFileLineNumbers '\zeusops_addon\XEH_postInit.sqf'";
    };
};
