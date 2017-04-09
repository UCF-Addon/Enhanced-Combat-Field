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
            "A3_Modules_F",
            "ECF_main"
        };
        author = AUTHORS;
    };
};

#include "CfgEventHandlers.hpp"

class CfgFactionClasses
{
    class NO_CATEGORY;
    class ECF_AI: NO_CATEGORY
    {
        displayName = QUOTE(ECF AI);
    };
};

class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class ArgumentsBaseUnits
        {
        };
        class ModuleDescription
        {
        };
    };

    #include "CfgLogic.hpp"
    #include "CfgModules.hpp"
};