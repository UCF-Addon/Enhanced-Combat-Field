#include "script_component.h"

private ["_nul"];

// only server
if (isDedicated) then
{
    if ((typeName (uiNamespace getVariable ["db_session_Id", objNull])) != "STRING") exitWith {};
    if ((uiNamespace getVariable ["db_session_Id", objNull]) == "") exitWith {};

    [] call DFUNC(registerEH);
};