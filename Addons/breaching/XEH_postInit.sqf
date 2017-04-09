#include "script_component.h"

if (GVAR(local)) then
{
    DFUNC(initBreaching);
};

["Fired", {_this call DFUNC(handleExplosion)}] call CBA_fnc_addEventHandler;