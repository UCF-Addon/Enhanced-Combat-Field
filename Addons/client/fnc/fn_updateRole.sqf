#include "script_component.h"

private ["_uiclassid", "_classid"];

_uiclassid = player getVariable ["_client_ui_role", -1];
if (_uiclassid < 0) exitWith { false };

_roles = player getVariable [QGVAR(roles), []];

_classid = ((_roles select _uiclassid) select 0);
player setVariable ["_classid", _classid, true];

// UI Function
closeDialog 0;

// Server Function
[] call DFUNC(callUpdate);