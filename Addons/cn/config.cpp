#include "script_component.h"

class CfgPatches
{
	class ADDON
	{
		units[]={};
		weapons[]={};
		version = "1.03";
        versionStr = "1.03";
        VersionDesc = "ECF";
        versionAr[] = {1,02};

		requiredVersion = 0.1;
		requiredAddons[] =
		{
		    "A3_Modules_F",
		    "ECF_Main"
		};
		author = AUTHORS;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
