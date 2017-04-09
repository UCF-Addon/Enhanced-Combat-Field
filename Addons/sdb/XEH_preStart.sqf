#include "script_component.h"
#include "XEH_PREP.h"

// only server
if (isDedicated) then
{
    [] call sdb_fnc_preInitDB;
};