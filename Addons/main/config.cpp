#include "script_component.h"

class CfgPatches
{
	class ADDON
	{
	    units[] = {};
	    weapons[] = {};
	    requiredVersion = "1.60";
	    requiredAddons[] =
		{
			"A3_Modules_F",
			"cba_main",
			"cba_xeh"
		};
		version = "1.02";
		versionStr = "1.02";
		VersionDesc = "ECF";
		versionAr[] = {1,02};
		author = AUTHORS;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgMods.hpp"
#include "gui\ecf_pauseMenu.hpp"
