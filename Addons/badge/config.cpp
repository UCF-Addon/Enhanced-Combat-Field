#include "script_component.h"

class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[]= {};
        version = "1.00";
        versionStr = "1.00";
        versionDesc = "ECF";
        versionar[] = {1,00};

        requiredVersion = "1.60";
        requiredAddons[] =
        {
            "A3Data",
            "ECF_Main"
        };
        author = AUTHORS;
  };
};

#include "CfgUnitInsignia.hpp"
