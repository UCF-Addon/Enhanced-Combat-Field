#include "script_component.h"

class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {""};
        fileName = "nvg.pbo";
        version = "1.02";
        versionStr = "1.02";
        VersionDesc = "ECF";
        versionAr[] = {1,02};

		requiredVersion = "1.60";
		requiredAddons[] =
		{
		    "A3_Characters_F_BLUFOR",
		    "ace_nightvision",
		    "ECF_Main"
		};
		author = AUTHORS;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
