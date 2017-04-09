#include "script_component.h"

class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        version = "0.1";
        versionStr = "0.1";
        VersionDesc = "ECF";
        versionAr[] = {0,1};

        requiredVersion = 0.1;
        requiredAddons[] =
        {
            "ECF_Main"
        };
        author = AUTHORS;
    };
};

#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"