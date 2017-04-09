#include "script_component.h"

ADDON = false;

#include "XEH_PREP.h"

private ["_local"];

_local = false;
if(isMultiplayer && isServer) then { _local = true; }
else { _local = true; };

GVAR(local) = _local;

ADDON = true;