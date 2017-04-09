#include "script_component.h"

class CfgPatches {
  class ADDON {
    units[] = {"ECF_UploadItem","ECF_DownloadItem"};
    weapons[] = {"ECF_Download","ECF_Upload"};
    version = "0.1";
    versionStr = "0.1";
    VersionDesc = "ECF";
    versionAr[] = {0,1};

    requiredVersion = 0.1;
    requiredAddons[] =
    {
        "ECF_Main",
    };
    author = AUTHORS;
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
