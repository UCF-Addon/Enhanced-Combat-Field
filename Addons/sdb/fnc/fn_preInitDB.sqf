#include "script_component.h"

private ["_dbc"];

_dbc = [] call DFUNC(connectDB);

if !(_dbc) exitWith
{
    //"extDB3" callExtension "9:SHUTDOWN";
    uiNamespace setVariable ["db_session_Id", objNull];
    false
};