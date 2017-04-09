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
            "ECF_Main",
            "ECF_Client"
        };
        author = AUTHORS;
    };
};

#include "CfgEventHandlers.hpp"