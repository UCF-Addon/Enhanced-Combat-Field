#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: obj <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
**/

params [["_obj", objNull]];

if (isNull _obj) exitWith {};

// TODO: handle delay of shutdown
_obj setVariable [QGMVAR(isStarted), false, true];