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
            "rhsusf_c_weapons",
            "ECF_Main"
        };
        author = AUTHORS;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
