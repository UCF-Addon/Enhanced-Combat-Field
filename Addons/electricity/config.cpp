#include "script_component.h"

class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        version = "0.1";
        versionStr = "0.1";
        VersionDesc = "UCF";
        versionAr[] = {0,1};

        requiredVersion = 0.1;
        requiredAddons[] =
        {
            "ECF_Main",
            "ECF_Modules"
        };
        author = AUTHORS;
    };
};

#include "CfgEventHandlers.hpp"