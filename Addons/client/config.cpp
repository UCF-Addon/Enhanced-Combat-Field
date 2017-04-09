#include "script_component.h"

class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};

        requiredVersion = 0.1;
        requiredAddons[] =
        {
            "ECF_main",
            "ECF_modules"
        };
        author = AUTHORS;
    };
};

#include "CfgEventHandlers.hpp"
#include "RscTileConfig.hpp"