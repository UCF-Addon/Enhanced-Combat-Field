#include "script_component.h"

ADDON = false;

#include "XEH_PREP.h"

// only server
if (isDedicated) then
{
	if (typeName (uiNamespace getVariable ["db_session_Id", objNull]) != "STRING") exitWith {};

    GVAR(useDBI) = _true;
};

ADDON = true;