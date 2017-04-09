#include "script_component.h"

ADDON = false;

#include "XEH_PREP.h"

player setVariable [QGVAR(var_isBreacher), _false, true];
player setVariable [QGVAR(var_isDBI), _false, true];

BIS_fnc_Arsenal = compile preProcessFileLineNumbers QPATHOF(overwrite\DOUBLE(fn,arsenal).sqf);

ADDON = true;